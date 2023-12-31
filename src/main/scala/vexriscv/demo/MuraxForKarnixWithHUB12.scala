package vexriscv.demo

import spinal.core._
import spinal.lib._
import vexriscv.ip.{DataCacheConfig, InstructionCacheConfig}
import spinal.lib.bus.amba3.apb._
import spinal.lib.bus.misc.SizeMapping
import spinal.lib.bus.simple.PipelinedMemoryBus
import spinal.lib.com.jtag.Jtag
import spinal.lib.com.spi.ddr.SpiXdrMaster
import spinal.lib.com.spi._
import spinal.lib.com.uart._
import spinal.lib.io.{InOutWrapper, TriStateArray}
import spinal.lib.misc.{InterruptCtrl, Prescaler, Timer}
import spinal.lib.soc.pinsec.{PinsecTimerCtrl, PinsecTimerCtrlExternal}
import spinal.lib.blackbox.lattice.ecp5._
import vexriscv.plugin._
import vexriscv.{VexRiscv, VexRiscvConfig, plugin}
import vexriscv.ip.InstructionCacheConfig
import spinal.lib.com.spi.ddr._
import spinal.lib.bus.simple._
import scala.collection.mutable.ArrayBuffer

import spinal.lib.bus.simple._
import spinal.lib.bus.simple.PipelinedMemoryBusConfig
import spinal.lib.bus.simple.PipelinedMemoryBus
import spinal.lib.bus.simple.Pwm
import spinal.lib.bus.simple.Apb3PwmCtrl

import spinal.lib.mem.{SramInterface,SramLayout,PipelinedMemoryBusSram}

import mylib.Apb3HubCtrl
import mylib.Apb3MicroPLICCtrl
import mylib.Apb3MacEthCtrl
import mylib.Apb3TimerCtrl
import mylib.Apb3WatchDogCtrl
import mylib.{Apb3MicroI2CCtrl, MicroI2CInterface}

import spinal.lib.com.eth._

/*
	This SoC is based on Murax SoC by PIC32F_USER.

	The purpose of this SoC is to provide fast interface to chinese HUB12 and HUB75 LED matrices
	through FPGA fabric - all high frequency dynamic updates of the matrix is performed in hardware 
	transferring data from built-in SRAM to matrix array. 

	RISC-V soft-core is used to control the fabric and to transfer data to fabric SRAM over Ethernet or RS-485 interface.

	Written by Ruslan Zalata <rz@fabmicro.ru>

	(C) 2021-2023 Fabmicro, LLC., Tyumen, Russia.

*/



case class MuraxForKarnixWithHUB12Config(coreFrequency : HertzNumber,
		onChipRamSize		: BigInt,
		onChipRamHexFile	: String,
		pipelineDBus		: Boolean,
		pipelineMainBus		: Boolean,
		pipelineApbBridge	: Boolean,
		gpioWidth		: Int,
		macConfig		: MacEthParameter,
		uart0CtrlConfig		: UartCtrlMemoryMappedConfig,
		uart1CtrlConfig		: UartCtrlMemoryMappedConfig,
                spiAudioDACCtrlConfig   : SpiMasterCtrlMemoryMappedConfig,
		xipConfig		: SpiXdrMasterCtrl.MemoryMappingParameters,
		hardwareBreakpointCount : Int,
		cpuPlugins         : ArrayBuffer[Plugin[VexRiscv]]){
  require(pipelineApbBridge || pipelineMainBus, "At least pipelineMainBus or pipelineApbBridge should be enable to avoid wipe transactions")
  val genXip = xipConfig != null

}



object MuraxForKarnixWithHUB12Config{
  def default : MuraxForKarnixWithHUB12Config = default(false, false)
  def default(withXip : Boolean = false, bigEndian : Boolean = false) =  MuraxForKarnixWithHUB12Config(
    coreFrequency         = 60.0 MHz,
    onChipRamSize         = 96 kB ,
    onChipRamHexFile      = null,
    pipelineDBus          = true,
    pipelineMainBus       = false,
    pipelineApbBridge     = true,
    gpioWidth = 17,
    xipConfig = ifGen(withXip) (SpiXdrMasterCtrl.MemoryMappingParameters(
      SpiXdrMasterCtrl.Parameters(8, 12, SpiXdrParameter(2, 2, 1)).addFullDuplex(0,1,false),
      cmdFifoDepth = 32,
      rspFifoDepth = 32,
      xip = SpiXdrMasterCtrl.XipBusParameters(addressWidth = 24, lengthWidth = 2)
    )),
    hardwareBreakpointCount = if(withXip) 3 else 0,
    cpuPlugins = ArrayBuffer( //DebugPlugin added by the toplevel

      /*
        new IBusCachedPlugin(
          resetVector = if(withXip) 0xF001E000l else 0x80000000l,
          prediction = STATIC,
          config = InstructionCacheConfig(
            cacheSize = 1024,
            bytePerLine = 32,
            wayCount = 1,
            addressWidth = 32,
            cpuDataWidth = 32,
            memDataWidth = 32,
            catchIllegalAccess = false,
            catchAccessFault = false,
            asyncTagMemory = false,
            twoCycleRam = false, 
            twoCycleCache = true 
          )
        ),
      */

      new IBusSimplePlugin(
        resetVector = if(withXip) 0xF001E000l else 0x80000000l,
        cmdForkOnSecondStage = true,
        cmdForkPersistence = withXip, //Required by the Xip controller
        prediction = DYNAMIC,
        catchAccessFault = false,
        compressedGen = false,
        bigEndian = bigEndian
      ),

      new DBusSimplePlugin(
        catchAddressMisaligned = false,
        catchAccessFault = false,
        earlyInjection = false,
        bigEndian = bigEndian
      ),

      new CsrPlugin(CsrPluginConfig.smallest(mtvecInit = if(withXip) 0xE0040020l else 0x80000020l)),

      new DecoderSimplePlugin(
        catchIllegalInstruction = false,
	assertIllegalInstruction = false 
      ),
      new RegFilePlugin(
        regFileReadyKind = plugin.SYNC,
        zeroBoot = false
      ),
      new IntAluPlugin,
      new SrcPlugin(
        separatedAddSub = false,
        executeInsertion = false
      ),
      //new LightShifterPlugin,
      new FullBarrelShifterPlugin,
      new MulPlugin,
      new DivPlugin,

      new HazardSimplePlugin(
        bypassExecute = false,
        bypassMemory = false,
        bypassWriteBack = false,
        bypassWriteBackBuffer = false,
        pessimisticUseSrc = false,
        pessimisticWriteRegFile = false,
        pessimisticAddressMatch = false
      ),
      new BranchPlugin(
        earlyBranch = false,
        catchAddressMisaligned = false
      ),
      new YamlPlugin("cpu0.yaml")
    ),
    macConfig = MacEthParameter(
      phy = PhyParameter(
        txDataWidth = 4,
        rxDataWidth = 4
      ),
      rxDataWidth = 32,
      rxBufferByteSize = 4096,
      txDataWidth = 32,
      txBufferByteSize = 4096
    ),
    uart0CtrlConfig = UartCtrlMemoryMappedConfig(
      uartCtrlConfig = UartCtrlGenerics(
        dataWidthMax      = 8,
        clockDividerWidth = 20,
        preSamplingSize   = 1,
        samplingSize      = 3,
        postSamplingSize  = 1,
        deGen  = false 
      ),
      initConfig = UartCtrlInitConfig(
        baudrate = 115200,
        dataLength = 7,  //7 => 8 bits
        parity = UartParityType.NONE,
        stop = UartStopType.ONE
      ),
      busCanWriteClockDividerConfig = false,
      busCanWriteFrameConfig = false,
      txFifoDepth = 16,
      rxFifoDepth = 16
    ),

    uart1CtrlConfig = UartCtrlMemoryMappedConfig(
      uartCtrlConfig = UartCtrlGenerics(
        dataWidthMax      = 8,
        clockDividerWidth = 20,
        preSamplingSize   = 1,
        samplingSize      = 3,
        postSamplingSize  = 1,
        deGen  = true 
      ),
      initConfig = UartCtrlInitConfig(
        baudrate = 115200,
        dataLength = 7,  //7 => 8 bits
        parity = UartParityType.NONE,
        stop = UartStopType.ONE
      ),
      busCanWriteClockDividerConfig = false,
      busCanWriteFrameConfig = false,
      txFifoDepth = 16,
      rxFifoDepth = 16
    ),

    spiAudioDACCtrlConfig = SpiMasterCtrlMemoryMappedConfig(
      ctrlGenerics = SpiMasterCtrlGenerics(
        dataWidth      = 16, // transmit 16 bit words
        timerWidth     = 16,
        ssWidth        = 1 // only one CS line
      ),
      cmdFifoDepth = 512, // CMD is same as TX FIFO
      rspFifoDepth = 512  // RSP is same as RX FIFO
    )
  )

  def fast = {
    val config = default

    //Replace HazardSimplePlugin to get datapath bypass
    config.cpuPlugins(config.cpuPlugins.indexWhere(_.isInstanceOf[HazardSimplePlugin])) = new HazardSimplePlugin(
      bypassExecute = true,
      bypassMemory = true,
      bypassWriteBack = true,
      bypassWriteBackBuffer = true
    )
//    config.cpuPlugins(config.cpuPlugins.indexWhere(_.isInstanceOf[LightShifterPlugin])) = new FullBarrelShifterPlugin()

    config
  }
}




case class MuraxHUBFabric(config : MuraxForKarnixWithHUB12Config) extends Component{
  import config._

  val io = new Bundle {
    //Clocks / reset
    val asyncReset = in Bool
    val mainClk = in Bool

    //Main components IO
    val jtag = slave(Jtag())

    //Peripherals IO
    val gpioA = master(TriStateArray(32 bits))
    val uart0 = master(Uart(config.uart0CtrlConfig.uartCtrlConfig))
    val uart1 = master(Uart(config.uart1CtrlConfig.uartCtrlConfig))
    val spiAudioDAC = master(SpiMaster(ssWidth = config.spiAudioDACCtrlConfig.ctrlGenerics.ssWidth))
    val xip = ifGen(genXip)(master(SpiXdrMaster(xipConfig.ctrl.spi)))
    val pwm = out Bool
    val hub = out Bits(16 bits)
    val mii = master(Mii(MiiParameter(MiiTxParameter(dataWidth = config.macConfig.phy.txDataWidth, withEr = false), MiiRxParameter( dataWidth = config.macConfig.phy.rxDataWidth)))) 
    val i2c = MicroI2CInterface()
    val hard_reset = out Bool()
    val sram = master(SramInterface(SramLayout(addressWidth = 18, dataWidth = 16)))
  }


  val resetCtrlClockDomain = ClockDomain(
    clock = io.mainClk,
    config = ClockDomainConfig(
      resetKind = BOOT
    )
  )

  val resetCtrl = new ClockingArea(resetCtrlClockDomain) {
    val mainClkResetUnbuffered  = False

    //Implement an counter to keep the reset axiResetOrder high 64 cycles
    // Also this counter will automatically do a reset when the system boot.
    val systemClkResetCounter = Reg(UInt(6 bits)) init(0)
    when(systemClkResetCounter =/= U(systemClkResetCounter.range -> true)){
      systemClkResetCounter := systemClkResetCounter + 1
      mainClkResetUnbuffered := True
    }
    when(BufferCC(io.asyncReset)){
      systemClkResetCounter := 0
    }

    //Create all reset used later in the design
    val mainClkReset = RegNext(mainClkResetUnbuffered)
    val systemReset  = RegNext(mainClkResetUnbuffered)
  }


  val systemClockDomain = ClockDomain(
    clock = io.mainClk,
    reset = resetCtrl.systemReset,
    frequency = FixedFrequency(coreFrequency)
  )

  val debugClockDomain = ClockDomain(
    clock = io.mainClk,
    reset = resetCtrl.mainClkReset,
    frequency = FixedFrequency(coreFrequency)
  )

  val system = new ClockingArea(systemClockDomain) {
    val pipelinedMemoryBusConfig = PipelinedMemoryBusConfig(
      addressWidth = 32,
      dataWidth = 32
    )

    //val bigEndianDBus = config.cpuPlugins.exists(_ match{ case plugin : DBusSimplePlugin => plugin.bigEndian case _ => false})
    val bigEndianDBus = false;

    //Arbiter of the cpu dBus/iBus to drive the mainBus
    //Priority to dBus, !! cmd transactions can change on the fly !!
    val mainBusArbiter = new MuraxMasterArbiter(pipelinedMemoryBusConfig, bigEndianDBus)

    //Instanciate the CPU
    val cpu = new VexRiscv(
      config = VexRiscvConfig(
        plugins = cpuPlugins += new DebugPlugin(debugClockDomain, hardwareBreakpointCount)
      )
    )

    //Checkout plugins used to instanciate the CPU to connect them to the SoC
    val timerInterrupt = False 
    //val externalInterrupt = False
    val externalInterrupt = Bool()


    for(plugin <- cpu.plugins) plugin match{
      case plugin : IBusCachedPlugin => {
        mainBusArbiter.io.iBus.toPipelinedMemoryBus() <> plugin.iBus.toPipelinedMemoryBus()
        // This does not compile
      }
      case plugin : IBusSimplePlugin => {
        mainBusArbiter.io.iBus.cmd <> plugin.iBus.cmd
        mainBusArbiter.io.iBus.rsp <> plugin.iBus.rsp
      }
      case plugin : DBusSimplePlugin => {
        if(!pipelineDBus)
          mainBusArbiter.io.dBus <> plugin.dBus
        else {
          mainBusArbiter.io.dBus.cmd << plugin.dBus.cmd.halfPipe()
          mainBusArbiter.io.dBus.rsp <> plugin.dBus.rsp
        }
      }
      case plugin : CsrPlugin        => {
        plugin.externalInterrupt := externalInterrupt
        plugin.timerInterrupt := timerInterrupt
      }
      case plugin : DebugPlugin         => plugin.debugClockDomain{
        resetCtrl.systemReset setWhen(RegNext(plugin.io.resetOut))
        io.jtag <> plugin.io.bus.fromJtag()
      }
      case _ =>
    }



    //****** MainBus slaves ********
    val mainBusMapping = ArrayBuffer[(PipelinedMemoryBus,SizeMapping)]()
    val ram = new MuraxPipelinedMemoryBusRam(
      onChipRamSize = onChipRamSize,
      onChipRamHexFile = onChipRamHexFile,
      pipelinedMemoryBusConfig = pipelinedMemoryBusConfig,
      bigEndian = bigEndianDBus
    )
    mainBusMapping += ram.io.bus -> (0x80000000l, onChipRamSize)

    val apbBridge = new PipelinedMemoryBusToApbBridge(
      apb3Config = Apb3Config(
        addressWidth = 20,
        dataWidth = 32
      ),
      pipelineBridge = pipelineApbBridge, 
      pipelinedMemoryBusConfig = pipelinedMemoryBusConfig
    )
    mainBusMapping += apbBridge.io.pipelinedMemoryBus -> (0xF0000000l, 1 MB)

    val sramCtrl = new PipelinedMemoryBusSram(
      pipelinedMemoryBusConfig = pipelinedMemoryBusConfig,
      sramLayout = SramLayout(addressWidth = 18, dataWidth = 16)
    )
    sramCtrl.io.sram <> io.sram
    mainBusMapping += sramCtrl.io.bus -> (0x90000000l, 512 kB)


    //******** APB peripherals *********
    val apbMapping = ArrayBuffer[(Apb3, SizeMapping)]()

    val plic = new Apb3MicroPLICCtrl()
    apbMapping += plic.io.apb     -> (0x60000, 64 kB)
    externalInterrupt := plic.io.externalInterrupt
    plic.io.IRQLines := 0 

    val gpioACtrl = Apb3Gpio(gpioWidth = 32, withReadSync = true)
    io.gpioA <> gpioACtrl.io.gpio
    apbMapping += gpioACtrl.io.apb -> (0x00000, 4 kB)

    val uart0Ctrl = Apb3UartCtrl(uart0CtrlConfig)
    uart0Ctrl.io.uart <> io.uart0
    //externalInterrupt setWhen(uart0Ctrl.io.interrupt)
    plic.setIRQ(uart0Ctrl.io.interrupt, 0)
    apbMapping += uart0Ctrl.io.apb  -> (0x10000, 4 kB)

    val uart1Ctrl = Apb3UartCtrl(uart1CtrlConfig)
    uart1Ctrl.io.uart <> io.uart1
    //externalInterrupt setWhen(uart1Ctrl.io.interrupt)
    plic.setIRQ(uart1Ctrl.io.interrupt, 1)
    apbMapping += uart1Ctrl.io.apb  -> (0x11000, 4 kB)

    val timer0Ctrl = new Apb3TimerCtrl()
    plic.setIRQ(timer0Ctrl.io.interrupt, 3)
    apbMapping += timer0Ctrl.io.apb     -> (0x20000, 4 kB)

    val timer1Ctrl = new Apb3TimerCtrl()
    plic.setIRQ(timer1Ctrl.io.interrupt, 4)
    apbMapping += timer1Ctrl.io.apb     -> (0x21000, 4 kB)

    val pwmCtrl = new Apb3PwmCtrl(size = 32)
    apbMapping += pwmCtrl.io.apb     -> (0x30000, 4 kB)
    io.pwm := pwmCtrl.io.output

    val hubCtrl = new Apb3HubCtrl()
    apbMapping += hubCtrl.io.apb     -> (0x50000, 64 kB)
    io.hub := hubCtrl.io.output

    val macCtrl = new Apb3MacEthCtrl(macConfig)
    apbMapping += macCtrl.io.apb     -> (0x70000, 64 kB)
    macCtrl.io.mii <> io.mii
    plic.setIRQ(macCtrl.io.interrupt, 2)

    val machineTimerCtrl = Apb3MachineTimerCtrl(coreFrequency.toInt / 1000000)
    apbMapping += machineTimerCtrl.io.apb   -> (0xB0000, 4 kB)

    val xip = ifGen(genXip)(new Area{
      val ctrl = Apb3SpiXdrMasterCtrl(xipConfig)
      ctrl.io.spi <> io.xip
      //externalInterrupt setWhen(ctrl.io.interrupt)
      apbMapping += ctrl.io.apb     -> (0x1F000, 4 kB)

      val accessBus = new PipelinedMemoryBus(PipelinedMemoryBusConfig(24,32))
      mainBusMapping += accessBus -> (0xE0000000l, 16 MB)

      ctrl.io.xip.fromPipelinedMemoryBus() << accessBus
      val bootloader = Apb3Rom("src/main/c/murax/xipBootloader/crt.bin")
      apbMapping += bootloader.io.apb     -> (0x1E000, 4 kB)
    })


    val i2cCtrl = new Apb3MicroI2CCtrl()
    apbMapping += i2cCtrl.io.apb     -> (0x90000, 64 kB)
    i2cCtrl.io.i2c <> io.i2c
    plic.setIRQ(i2cCtrl.io.interrupt, 5)

    val wdCtrl = new Apb3WatchDogCtrl()
    apbMapping += wdCtrl.io.apb     -> (0xa0000, 64 kB)
    io.hard_reset := wdCtrl.io.hard_reset 

    val spiAudioDACCtrl = new Apb3SpiMasterCtrl(spiAudioDACCtrlConfig)
    spiAudioDACCtrl.io.spi <> io.spiAudioDAC
    //externalInterrupt setWhen(uart0Ctrl.io.interrupt)
    plic.setIRQ(spiAudioDACCtrl.io.interrupt, 6)
    apbMapping += spiAudioDACCtrl.io.apb  -> (0xC0000, 4 kB)


    //******** Memory mappings *********
    val apbDecoder = Apb3Decoder(
      master = apbBridge.io.apb,
      slaves = apbMapping
    )

    val mainBusDecoder = new Area {
      val logic = new MuraxPipelinedMemoryBusDecoder(
        master = mainBusArbiter.io.masterBus,
        specification = mainBusMapping,
        pipelineMaster = pipelineMainBus
      )
    }
  }
}



case class MuraxForKarnixWithHUB12() extends Component{
    val io = new Bundle {
	val clk25 = in Bool()
	val uart_debug_txd = out Bool() // mapped to uart_debug_txd
	val uart_debug_rxd = in Bool() // mapped to uart_debug_rxd
	val rgb = out Bits(3 bits)
	val gpio = out Bits(16 bits)
	val rst_n = out Bool() // Hard-reset pin
	val eeprom_wp = out Bool()
	val rs485_txd = out Bool() // mapped to uart_rs485_txd
	val rs485_rxd = in Bool() // mapped to uart_rs485_rxd
	val rs485_de = out Bool() // uart_rs485 data output enable

	val lan_mdc = out Bool() // manamgement data CLK
	val lan_mdio = out Bool() // management data I/O
	val lan_nint = in Bool() // Interrupt, Active LOW
	val lan_nrst = out Bool() // Reset, Acvite LOW
	val lan_txen = out Bool() // TX data present
	val lan_txclk = in Bool() // TX data clock
	val lan_txd0 = out Bool()
	val lan_txd1 = out Bool()
	val lan_txd2 = out Bool()
	val lan_txd3 = out Bool()
	val lan_rxd0 = in Bool()
	val lan_rxd1 = in Bool()
	val lan_rxd2 = in Bool()
	val lan_rxd3 = in Bool()
	val lan_col = in Bool() // RX collision indicator
	val lan_crs = in Bool() // RX carrier detected 
	val lan_rxer = in Bool() // RX error indicator
	val lan_rxclk = in Bool() // RX data clock
	val lan_rxdv = in Bool() // RX data valid

	val i2c_scl = inout(Analog(Bool()))
	val i2c_sda = inout(Analog(Bool()))

        val sram = master(SramInterface(SramLayout(addressWidth = 18, dataWidth = 16)))
        val spiAudioDAC = master(SpiMaster(ssWidth = 1))
        
	val config = in Bool() // Config reset pin

	var core_jtag_tck = in Bool()
	var core_jtag_tdi = in Bool()
	var core_jtag_tdo = out Bool()
	var core_jtag_tms = in Bool()
    }



    val murax = MuraxHUBFabric(MuraxForKarnixWithHUB12Config.default(withXip = false).copy(
		coreFrequency = 60.0 MHz, 
		onChipRamSize = 96 kB , 
		pipelineMainBus = true, // XXX
		onChipRamHexFile = "MuraxForKarnixWithHUB12TopLevel_random.hex"
		//onChipRamHexFile = "src/main/c/murax/karnix_hub12/build/karnix_hub12.hex"
	))

    // LAN PHY management 
    io.lan_mdc := True
    io.lan_mdio := True
    io.lan_nrst := True

    // LAN PHY
    murax.io.mii.TX.CLK := io.lan_txclk
    io.lan_txen := murax.io.mii.TX.EN
    io.lan_txd0 := murax.io.mii.TX.D(0)
    io.lan_txd1 := murax.io.mii.TX.D(1)
    io.lan_txd2 := murax.io.mii.TX.D(2)
    io.lan_txd3 := murax.io.mii.TX.D(3)

    murax.io.mii.RX.CLK := io.lan_rxclk
    murax.io.mii.RX.D(0) := io.lan_rxd0
    murax.io.mii.RX.D(1) := io.lan_rxd1
    murax.io.mii.RX.D(2) := io.lan_rxd2
    murax.io.mii.RX.D(3) := io.lan_rxd3
    murax.io.mii.RX.DV := io.lan_rxdv
    murax.io.mii.RX.ER := io.lan_rxer
    murax.io.mii.RX.CRS := io.lan_crs
    murax.io.mii.RX.COL := io.lan_col



    murax.io.asyncReset := False 
    io.rst_n := murax.io.hard_reset // Watch-dog is sitting there 

    //val pll = new EHXPLLL(EHXPLLLConfig.singleOutput(25.0 MHz, 50.0 MHz, 0.02)) // This thing is buggy, gives incorrect dividers

    //val core_pll = new EHXPLLL( EHXPLLLConfig(clkiFreq = 25.0 MHz, mDiv = 1, fbDiv = 3, opDiv = 8, opCPhase = 4) ) // 75.0 MHz
    //val core_pll = new EHXPLLL( EHXPLLLConfig(clkiFreq = 25.0 MHz, mDiv = 1, fbDiv = 2, opDiv = 12, opCPhase = 5) ) // 50.0 MHz
    //val core_pll = new EHXPLLL( EHXPLLLConfig(clkiFreq = 25.0 MHz, mDiv = 5, fbDiv = 13, opDiv = 9, opCPhase = 4) ) // 65.0 MHz
    val core_pll = new EHXPLLL( EHXPLLLConfig(clkiFreq = 25.0 MHz, mDiv = 5, fbDiv = 12, opDiv = 10, opCPhase = 4) ) // 60.0 MHz

    core_pll.io.CLKI := io.clk25
    core_pll.io.CLKFB := core_pll.io.CLKOP
    core_pll.io.STDBY := False
    core_pll.io.RST := False
    core_pll.io.ENCLKOP := True
    core_pll.io.ENCLKOS := False
    core_pll.io.ENCLKOS2 := False
    core_pll.io.ENCLKOS3 := False
    core_pll.io.PLLWAKESYNC := False
    core_pll.io.PHASESEL0 := False
    core_pll.io.PHASESEL1 := False
    core_pll.io.PHASEDIR := False
    core_pll.io.PHASESTEP := False
    core_pll.io.PHASELOADREG := False

    murax.io.mainClk := core_pll.io.CLKOP 

    /*
    case class DCCA() extends BlackBox{
	val CLKI = in  Bool()
	val CLKO = out  Bool()
	val CE = in  Bool()
    }

    var dcca_core_pll = DCCA()
    dcca_core_pll.CE := True
    dcca_core_pll.CLKI := core_pll.io.CLKOP
    murax.io.mainClk := dcca_core_pll.CLKO
    */

    /*
    val jtagClkBuffer = DCCA()
    jtagClkBuffer.setDefinitionName("DCCA");
    jtagClkBuffer.CLKI <> io.core_jtag_tck
    jtagClkBuffer.CLKO <> murax.io.jtag.tck
    jtagClkBuffer.CE := True
    murax.io.jtag.tdi <> io.core_jtag_tdi
    murax.io.jtag.tdo <> io.core_jtag_tdo
    murax.io.jtag.tms <> io.core_jtag_tms
    */
    murax.io.jtag.tdi := False
    murax.io.jtag.tck := False
    murax.io.jtag.tms := False
    io.core_jtag_tdo := False

    io.rgb := murax.io.gpioA.write.resized

    io.eeprom_wp := murax.io.gpioA.write(3) 
    murax.io.gpioA.read(30 downto 0) := 0
    murax.io.gpioA.read(31) := io.config 

    io.gpio <> murax.io.hub

    murax.io.uart0.txd <> io.uart_debug_txd
    murax.io.uart0.rxd <> io.uart_debug_rxd

    murax.io.uart1.txd <> io.rs485_txd
    murax.io.uart1.rxd <> io.rs485_rxd
    murax.io.uart1.de <> io.rs485_de

    murax.io.sram <> io.sram
    murax.io.spiAudioDAC <> io.spiAudioDAC

    io.i2c_scl <> murax.io.i2c.scl
    io.i2c_sda <> murax.io.i2c.sda

}


object MuraxForKarnixWithHUB12Verilog{
  def main(args: Array[String]) {
    //SpinalVerilog(InOutWrapper(MuraxForKarnixWithHUB12().setDefinitionName("MuraxForKarnixWithHUB12TopLevel")))
    SpinalVerilog(MuraxForKarnixWithHUB12().setDefinitionName("MuraxForKarnixWithHUB12TopLevel"))
  }
}



import spinal.sim._
import spinal.core.sim._

object MuraxForKarnixWithHUB12VerilogSim {
  def main(args: Array[String]) {

    //SimConfig.withWave.compile{
    SimConfig.compile{
        val dut = new MuraxHUBFabric(MuraxForKarnixWithHUB12Config.default(withXip = false).copy(
                coreFrequency = 25.0 MHz,
                onChipRamSize = 72 kB ,
                //pipelineMainBus = true,
                //onChipRamHexFile = "src/main/c/murax/karnix_hub12/build/karnix_hub12.hex"
                onChipRamHexFile = "MuraxForKarnixWithHUB12TopLevel_random.hex"
        )) 
        dut.io.asyncReset.simPublic()
        dut.io.mainClk.simPublic()
    dut.system.cpu.decode.arbitration.isValid.simPublic()
    dut.system.cpu.decode.arbitration.haltItself.simPublic()
    dut.system.cpu.decode.arbitration.haltByOther.simPublic()
    dut.system.cpu.execute.arbitration.isValid.simPublic()
    dut.system.cpu.execute.arbitration.haltItself.simPublic()
    dut.system.cpu.execute.arbitration.haltByOther.simPublic()
    dut.system.cpu.memory.arbitration.isValid.simPublic()
    dut.system.cpu.memory.arbitration.haltItself.simPublic()
    dut.system.cpu.memory.arbitration.haltByOther.simPublic()
    dut.system.cpu.writeBack.arbitration.isValid.simPublic()
    dut.system.cpu.writeBack.arbitration.haltItself.simPublic()
    dut.system.cpu.writeBack.arbitration.haltByOther.simPublic()
    dut.system.mainBusArbiter.io.dBus.cmd.valid.simPublic()
    dut.system.mainBusArbiter.io.dBus.cmd.wr.simPublic()
    dut.system.mainBusArbiter.io.dBus.cmd.ready.simPublic()
    dut.system.mainBusArbiter.io.dBus.cmd.address.simPublic()
    dut.system.mainBusArbiter.io.dBus.cmd.data.simPublic()
    dut.system.mainBusArbiter.io.iBus.cmd.valid.simPublic()
    dut.system.mainBusArbiter.io.iBus.cmd.ready.simPublic()
    dut.system.mainBusArbiter.io.iBus.cmd.pc.simPublic()
    dut.system.mainBusArbiter.rspPending.simPublic()
    dut.system.mainBusArbiter.rspTarget.simPublic()
    dut.system.mainBusArbiter.io.dBus.rsp.ready.simPublic()
    dut.system.mainBusArbiter.io.dBus.rsp.data.simPublic()
    dut.system.mainBusArbiter.io.iBus.rsp.valid.simPublic()
    dut.system.mainBusArbiter.io.iBus.rsp.inst.simPublic()

    dut.system.apbBridge.io.pipelinedMemoryBus.cmd.valid.simPublic()
    dut.system.apbBridge.io.pipelinedMemoryBus.cmd.ready.simPublic()
    dut.system.apbBridge.io.pipelinedMemoryBus.cmd.write.simPublic()
    dut.system.apbBridge.io.pipelinedMemoryBus.cmd.data.simPublic()
    dut.system.apbBridge.io.pipelinedMemoryBus.cmd.address.simPublic()
    dut.system.apbBridge.io.pipelinedMemoryBus.rsp.valid.simPublic()
    dut.system.apbBridge.io.pipelinedMemoryBus.rsp.data.simPublic()

        dut
    }.doSim{ 
    dut =>

    // Create our own clock domain using external signals mainClk and asyncReset
    val myClockDomain = ClockDomain(dut.io.mainClk, dut.io.asyncReset)

    // Fork process that drives our clock
    myClockDomain.forkStimulus(period = 10)

    // We are in reset state at the beginning
    myClockDomain.assertReset()

      var modelState = 0


      for(idx <- 0 to 2999999){

    if(idx > 1) { myClockDomain.deassertReset() }

        myClockDomain.waitRisingEdge()


    implicit def bool2int(b:Boolean) = if (b) 1 else 0

/*
    println("[%08d] BUS: dBus.cmd (_v:%d, v:%d, w:%d, rdy:%d, p_rdy:%d, a:%08X, d:%08X), dBus.rsp (p_v:%d, rdy:%d, d:%08X), iBus.cmd (v:%d, rdy:%d, pc:%08X), iBus.rsp (v:%d, ins:%08X), pending: %d, target: %d, lastPC: %08X, lastInst: %08X, counter(%d of %d), SRC(%08X, %08X)".format(
        idx,
        dut.io.test.toBoolean * 1,
        dut.system.mainBusArbiter.io.dBus.cmd.valid.toBoolean * 1,
        dut.system.mainBusArbiter.io.dBus.cmd.wr.toBoolean * 1,
        dut.system.mainBusArbiter.io.dBus.cmd.ready.toBoolean * 1,
        dut.io.plugin_cmd_ready.toBoolean * 1,
        dut.system.mainBusArbiter.io.dBus.cmd.address.toLong,
        dut.system.mainBusArbiter.io.dBus.cmd.data.toLong,
        dut.io.plugin_rsp_valid.toBoolean * 1,
        dut.system.mainBusArbiter.io.dBus.rsp.ready.toBoolean * 1,
        dut.system.mainBusArbiter.io.dBus.rsp.data.toLong,
        dut.system.mainBusArbiter.io.iBus.cmd.valid.toBoolean * 1,
        dut.system.mainBusArbiter.io.iBus.cmd.ready.toBoolean * 1,
        dut.system.mainBusArbiter.io.iBus.cmd.pc.toLong,
        dut.system.mainBusArbiter.io.iBus.rsp.valid.toBoolean * 1,
        dut.system.mainBusArbiter.io.iBus.rsp.inst.toLong,
        dut.system.mainBusArbiter.rspPending.toBoolean * 1,
        dut.system.mainBusArbiter.rspTarget.toBoolean * 1,
        dut.system.cpu.lastStagePc.toLong, 
        dut.system.cpu.lastStageInstruction.toLong,
        dut.io.mem_counter.toLong, 
        dut.io.plugin_cmd_length.toLong, 
        dut.system.cpu.lastStageSRC1.toLong, 
        dut.system.cpu.lastStageSRC2.toLong 
    ))  

*/

    // Print some details about peripheral access

    //if(dut.system.mainBusArbiter.io.dBus.cmd.valid.toBoolean && dut.system.mainBusArbiter.io.dBus.cmd.address.toLong >= 0x90000000l) {
    //if(dut.system.mainBusArbiter.io.dBus.cmd.address.toLong >= 0x90000000l && dut.system.mainBusArbiter.io.dBus.cmd.address.toLong < 0xa0000000l) {
    if(!dut.system.mainBusArbiter.io.dBus.cmd.wr.toBoolean && dut.system.mainBusArbiter.io.dBus.cmd.address.toLong >= 0x90000000l && dut.system.mainBusArbiter.io.dBus.cmd.address.toLong < 0xa0000000l) {


        println("[%08d] PERIPHERY: apbBridge(cmd.v: %s, cmd.rdy: %s, cmd.wr: %s, addr: %08X, data: %08X, rsp.v: %s, rsp.data: %08X), mainBusArbiter(cmd.v: %s, cmd.rdy: %s, cmd.wr: %s, addr: %08X, data: %08X, rsp.rdy: %s, rsp.data: %08X)".format(
            idx,
            dut.system.apbBridge.io.pipelinedMemoryBus.cmd.valid.toBoolean,
            dut.system.apbBridge.io.pipelinedMemoryBus.cmd.ready.toBoolean,
            dut.system.apbBridge.io.pipelinedMemoryBus.cmd.write.toBoolean,
            dut.system.apbBridge.io.pipelinedMemoryBus.cmd.address.toLong,
            dut.system.apbBridge.io.pipelinedMemoryBus.cmd.data.toLong,
            dut.system.apbBridge.io.pipelinedMemoryBus.rsp.valid.toBoolean,
            dut.system.apbBridge.io.pipelinedMemoryBus.rsp.data.toLong,
            dut.system.mainBusArbiter.io.dBus.cmd.valid.toBoolean,
            dut.system.mainBusArbiter.io.dBus.cmd.ready.toBoolean,
            dut.system.mainBusArbiter.io.dBus.cmd.wr.toBoolean,
            dut.system.mainBusArbiter.io.dBus.cmd.address.toLong,
            dut.system.mainBusArbiter.io.dBus.cmd.data.toLong,
            dut.system.mainBusArbiter.io.dBus.rsp.ready.toBoolean,
            dut.system.mainBusArbiter.io.dBus.rsp.data.toLong
        ))
    }

        sleep(1);

        //Update the reference model value

        // ...
      }
    }
  }
}

