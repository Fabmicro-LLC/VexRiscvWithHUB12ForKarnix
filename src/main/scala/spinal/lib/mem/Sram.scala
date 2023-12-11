package spinal.lib.mem 

import spinal.core._
import spinal.lib._
import spinal.lib.bus.simple._
import spinal.lib.io.TriState

case class SramLayout(addressWidth: Int, dataWidth : Int){
  def bytePerWord = dataWidth/8
  def capacity = BigInt(1) << addressWidth
}

case class SramInterface(g : SramLayout) extends Bundle with IMasterSlave{
  val addr = Bits((g.addressWidth) bits)
  val dat = inout(Analog(Bits(g.dataWidth bits)))
  val cs  = Bool
  val we  = Bool
  val oe  = Bool

  override def asMaster(): Unit = {
    out(addr,cs,we,oe)
    inout(dat)
  }
}

class PipelinedMemoryBusSram(pipelinedMemoryBusConfig: PipelinedMemoryBusConfig,
                                       sramLayout : SramLayout) extends Component{
  val io = new Bundle{
    val bus = slave(PipelinedMemoryBus(pipelinedMemoryBusConfig))
    val sram = master(SramInterface(sramLayout))
  }

  val we = Reg(Bool)
  io.sram.we := !we

  val oe = Reg(Bool)
  io.sram.oe := !oe

  val cs = Reg(Bool)
  io.sram.cs := !cs

  val state = Reg(UInt(4 bits)) init(0)
  
  val datOut = Reg(Bits(16 bits))

  val data = Reg(Bits(32 bits)) // temp reg to save SRAM or IO data

  val addr = Reg(Bits(18 bits)) // temp reg to save requested address

  val mask = Reg(Bits(4 bits)) // temp reg to save mask 

  val write = Reg(Bool) init(False) // temp reg to save write flag 

  io.sram.addr := addr
  io.bus.cmd.ready := False
  io.bus.rsp.valid := False
  io.bus.rsp.data := data

  when(state === 0 && io.bus.cmd.valid) { // Acknowlage transation 
	io.bus.cmd.ready := True
  }

  when(state === 3) { // Indicate transation is finished 
	io.bus.rsp.valid := True
  }

  //assert(!io.bus.cmd.valid, "SRAM IO: addr data mask write", NOTE);
  //assert(!io.bus.cmd.valid, List(io.bus.cmd.address), NOTE);
  //assert(!io.bus.cmd.valid, List(io.bus.cmd.data), NOTE);
  //assert(!io.bus.cmd.valid, List(io.bus.cmd.mask), NOTE);
  //assert(!io.bus.cmd.valid, List(io.bus.cmd.write), NOTE);

  we := False
  oe := False
  cs := False
 

    when(io.bus.cmd.write || write) {

      io.sram.dat := datOut // Connect SRAM data bus to buffer data reg

      when (state === 0 && io.bus.cmd.valid && io.bus.cmd.mask(0) && io.bus.cmd.mask(1)) {
	data := io.bus.cmd.data // Save IO data to temp reg
	mask := io.bus.cmd.mask // Save mask to temp reg
	write := io.bus.cmd.write // Save write flag to temp reg 
	addr(17 downto 1) := io.bus.cmd.address(sramLayout.addressWidth downto 2).asBits 
	addr(0) := False 
	cs := True
        oe := False 
        we := True
        datOut := io.bus.cmd.data(15 downto 0) // Write low 16 bits to buffer data reg
        state := 1
      } elsewhen (state === 1) {
	cs := True 
	we := False
	oe := False
        when(mask(2) || mask(3)) {
		state := 2
	} otherwise {
		state := 3
		cs := False 
	}
      } elsewhen (state === 2 && mask(2) && mask(3)) {
	// Save 16 LSB to buffer data reg
       	datOut := data(31 downto 16) 
	addr(0) := True 
	cs := True 
        oe := False 
        we := True
        state := 3
      } elsewhen (state === 3) { // Exit state
	// Disconnect SRAM 
	cs := True 
        oe := False 
        we := True
	write := False
        state := 0
      } elsewhen (state === 0 && io.bus.cmd.valid && ((io.bus.cmd.mask(0) && !io.bus.cmd.mask(1)) || ((!io.bus.cmd.mask(0) && io.bus.cmd.mask(1))))) {
	// Read 16 LSB - entrance for per-byte IO 
	data := io.bus.cmd.data // Save IO data to temp reg
	mask := io.bus.cmd.mask // Save mask to temp reg
	write := io.bus.cmd.write // Save write flag to temp reg 
	addr(17 downto 1) := io.bus.cmd.address(sramLayout.addressWidth downto 2).asBits 
	addr(0) := False 
	cs := True 
        oe := True
        we := False
        state := 7
      } elsewhen (state === 7) {
	// Save 16 LSB to temp reg
	addr(0) := False 
	datOut := io.sram.dat
	cs := True 
        oe := True
        we := False
        state := 4
      } elsewhen (state === 4) {
	// Modify masked bytes in 16 LSB
        when(mask(0)) {
		datOut(7 downto 0) := data(7 downto 0) //io.bus.cmd.data(7 downto 0)
	}
        when(mask(1)) {
		datOut(15 downto 8) := data(15 downto 8) //io.bus.cmd.data(15 downto 8) 
	}
	addr(0) := False 
  	io.sram.dat := datOut
	cs := True
        oe := False 
        we := True
	state := 6
      } elsewhen (state === 6) {
	// Write 16 LSB
	addr(0) := False 
  	io.sram.dat := datOut
	cs := True 
	oe := False
	we := True 
        when(mask(2) || mask(3)) {
		state := 2
	} otherwise {
		state := 3
		cs := False 
	}
      } elsewhen (state === 0 && io.bus.cmd.valid && (io.bus.cmd.mask(2) || io.bus.cmd.mask(3))) {
	// Read 16 MSB - entrance for single-byte IO 
	data := io.bus.cmd.data // Save IO data to temp reg
	mask := io.bus.cmd.mask // Save mask to temp reg
	write := io.bus.cmd.write // Save write flag to temp reg 
	addr(17 downto 1) := io.bus.cmd.address(sramLayout.addressWidth downto 2).asBits 
	addr(0) := True 
	cs := True 
        oe := True
        we := False
        state := 5
      } elsewhen (state === 2 && ((!mask(2) && mask(3)) || (mask(2) && !mask(3)))) {
	// Read 16 MSB - proceeding from 32 bit IO 
	addr(0) := True 
	cs := True 
        oe := True
        we := False
        state := 5
      } elsewhen (state === 5) {
	// Save 16 MSB to temp reg
	addr(0) := True 
	datOut := io.sram.dat 
	cs := True 
        oe := True
        we := False
        state := 8
      } elsewhen (state === 8) {
	// Modify masked bytes in 16 MSB
        when(mask(2)) {
		datOut(7 downto 0) := data(23 downto 16) //io.bus.cmd.data(23 downto 16)
	}
        when(mask(3)) {
		datOut(15 downto 8) := data(31 downto 24) //io.bus.cmd.data(31 downto 24) 
	}
	addr(0) := True 
	// Store modified 16 MSB 
  	io.sram.dat := datOut
	cs := True
        oe := False 
        we := True
	state := 9
      } elsewhen (state === 9) {
	addr(0) := True 
  	io.sram.dat := datOut
	cs := True 
	oe := False
	we := True 
	state := 3
      }

    } otherwise { // Read

      val io_addr = Reg(UInt(32 bits)) // temp reg to save bus address

      write := False 

      when (state === 0 && io.bus.cmd.valid) {
	cs := True 
        oe := True
	io_addr := io.bus.cmd.address // save bus address
        addr(17 downto 1) := io.bus.cmd.address(sramLayout.addressWidth downto 2).asBits // at this moment bus address has not been changed yet, so use it 
	addr(0) := False // access lower 16 bits
        state := 1
    } elsewhen (state === 1) {
        data(15 downto 0) := io.sram.dat  // save low 16 bits to temp register
	state := 2
	cs := True 
        oe := True
      } elsewhen (state === 2) {
        addr(17 downto 1) := io_addr(sramLayout.addressWidth downto 2).asBits // restore bus address from temp reg 
	addr(0) := True // access higher 16 bits 
        state := 4
	cs := True 
        oe := True
      } elsewhen (state === 4) {
        data(31 downto 16) := io.sram.dat  // save high 16 bits to temp register
	cs := True 
        oe := True
        state := 3
      } elsewhen (state === 3) {
	cs := True 
        oe := True
        state := 0
	write := False
      }
    }

}


