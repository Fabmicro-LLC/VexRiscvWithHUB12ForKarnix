#!/usr/bin/perl

#############################################################################################
##
##  HUBControl configuration and control tool 
## 
##  Copyright (C) 2021-2023. Fabmicro, LLC, Tyumen, Russia.
##
##  Written by Ruslan Zalata <rz@fabmicro.ru>
##
#############################################################################################

use Time::HiRes qw(usleep);
use Getopt::Long qw(GetOptions);
use Cwd qw(abs_path);
use FindBin;
use lib abs_path("$FindBin::./");

use Device::Modbus::RTU::Client;
use NetRTUClient;
use FileHandle;
use Socket;
use Data::Dumper;
use Encode qw(encode decode is_utf8);
use File::stat;
use File::Basename;
use Data::Dumper;

print "Running under ".$^O."\r\n";


#if(!($^O eq 'MSWin32')) {
#	eval "use Imager;"
#}

GetOptions(
	"host=s" => \$host,				### Use IP Host address of RS-485 converter 
	"port=o" => \$port,				### Use TCP/UDP port number of RS-485 converter 
	"port_type=s" => \$port_type, 			### Use network socket type: 'udp' or 'tcp'
	"serial=s" => \$serial,				### Use Serial device name of RS-485 converter (use instead of -host/-port) 
	"baud=s" => \$baud,				### Use Serial device baud rate
	"version" => \$version,				### Read version register: {Device, OS, Application} 
	"set_scratch=o" => \$set_scratch,		### Set Scratch register
	"get_scratch" => \$get_scratch,			### Get Scratch register
	"get_sys_count" => \$get_sys_count,		### Get Sys counter register
	"get_irq_count" => \$get_irq_count,		### Get IRQ counter register
	"addr=o" => \$addr, 				### Use this modbus address 
	"get_id" => \$get_id, 				### Get device ID string
	"set_modbus_addr=o" => \$set_modbus_addr, 	### Configure Modbus address
	"set_modbus_baud=o" => \$set_modbus_baud, 	### Configure Modbus port baud rate (currently supported: 9600, 38400, 57600, 115200 and 250000)
	"test" => \$test, 				### Continous read of syscount reg
	"reboot" => \$reboot, 				### Reboot device
	"text=s" => \$text, 				### Show given text on the screen
	"x=o" => \$X, 					### Set X coordinate for text
	"y=o" => \$Y,	 				### Set Y coordinate for text
	"font_id=o" => \$font_id,	 		### Set font ID for text
	"sleep_time=o" => \$sleep_time, 		### Sleep during  test
	"set_config_write=o" => \$set_config_write,	### Enables or Disables write operations to Config: set to 0xAABB to enable
	"get_config_write" => \$get_config_write,	### Get Config Write Enabled status
	"get_ip_addr" => \$get_ip_addr,			### Get configured IP address
	"get_gw_addr" => \$get_gw_addr,			### Get configured Gateway address
	"get_netmask" => \$get_netmask,			### Get configured Netmask
	"get_mac_addr" => \$get_mac_addr,		### Get configured MAC addr
	"set_ip_addr=s" => \$set_ip_addr,		### Set configured IP address
	"set_gw_addr=s" => \$set_gw_addr,		### Set configured Gateway address
	"set_netmask=s" => \$set_netmask,		### Set configured Netmask
	"set_mac_addr=s" => \$set_mac_addr,		### Set configured MAC addr
	"set_color=o" => \$set_color,			### Set current drawing color
	"get_color" => \$get_color,			### Get current drawing color
	"set_hub_type=o" => \$set_hub_type,		### Set current HUB controller type (12 - for HUB12, 75 - for HUB75)
	"get_hub_type" => \$get_hub_type,		### Get current HUB controller type
	"set_options=o" => \$set_options,		### Set misc configuration options
	"get_options" => \$get_options,			### Get misc configuration options
	"demo_clock" => \$demo_clock,			### Demo: clock 



);

#$host = "192.168.127.254"; # <-- Put here IP address of TCP-to-RS485 converter, we use Moxa NPort
#$port = 950;               # <-- Put here tcp port number of the converter

$device_addr = 1;          # <-- Put here RS-485/ModbusRTU address of the Grovex D1 device

$|=1;

##### DEFENISTION OF MODBUS REGISTERS #####

$reg_framebuffer = 20;

$reg_sys_counter = 30;
$reg_irq_counter = 31;
$reg_scratch = 32;

$reg_ip_addr = 41;
$reg_gw_addr = 42;
$reg_netmask = 43;
$reg_modbus_addr = 44;
$reg_modbus_baud = 45;
$reg_mac_addr = 47;
$reg_hub_type = 48;
$reg_config_options = 49;	## misc options (bit masked)

$reg_print_text = 50;
$reg_clear_text = 51;
$reg_hub_color = 52;

$reg_config_write = 126;
$reg_reboot = 127;


#############################################################

$ARGC = @ARGV;

if($ARGC > 0) {
	$text = $ARGV[0]." \0";
}

if(length($port_type) == 0) { $port_type = 'udp'; }

#
# This subroutine converts text string to array of binary data to be sent to Grovex
#
# Binary format: int16(X), int16(Y), int16(...data...) 
#
sub buffer_to_array {
	my $buf = shift @_;
	my $offset = shift @_;
	my $flag = shift @_;

	if($flag) {
		print STDERR "buffer_to_array() converting charset\n";
		Encode::from_to($buf, 'utf-8', 'windows-1251');
	}

	my @data = ();

	for(my $i = 0; $i < $offset; $i++) { push @data, 0x0000; }

	my $counter = 0;

	###print STDERR "buffer_to_array() input buf size: ".length($buf).", offset: $offset\n";

	while(1) {
	
		($h, $buf) = unpack("C a*", $buf);
		if(length($h) < 1) {
			last;
		}

		($l, $buf) = unpack("C a*", $buf);
		if(length($l) < 1) {
			$l = 0;
		}

		push @data, ($h<<8)+$l;

		$counter++;
	}

	###print STDERR "buffer_to_array() packed $counter items\n";

	return @data;
}

sub MIN {
	my($a, $b) = @_;
	if($a < $b) { return $a; }
	return $b;
}

my $client;

if(length($addr) > 0) {
	$device_addr = $addr;
}


if(length($serial) > 0) {

	my $serial_baud = 115200;

	if(length($baud) > 0) {
		$serial_baud = $baud;
	}


	print STDERR "Connecting to device using serial: $serial\n";

	##eval {
	   $client = Device::Modbus::RTU::Client->new(
	   	port     => $serial,
	   	baudrate => $serial_baud,
	   	parity   => 'none',
	   	timeout => 3,  ### seconds
	   );
	##};

	if($@) {
		print STDERR "Failed to open serial port: $serial, $@\n";
		exit();
	}
}

if(length($host) > 0 && length($port) > 0) {

	print STDERR "Connecting to device using $port_type: $host:$port\n";

	if($port_type eq 'UDP' or $port_type eq 'udp') {
		$client = NetRTUClient->new_udp( port=> $port, host=> $host );
	} else {
		$client = NetRTUClient->new_udp( port=> $port, host=> $host );
	}

	if($@) {
		print STDERR "Failed to open connection to $host:$port ($@)\n";
		exit();
	}
}

if(length($client) < 1) {
	print STDERR "Neither -serial nor -host/-port was provided, do not know how to connect to device!\n\n";
	print STDERR "Example: $0 -serial /dev/ttyUSB0 -baud 115200 -addr 1 -get_mac_addr\n";
	print STDERR "or\n";
	print STDERR "Example: $0 -host 192.168.127.254 -port 2001 -addr 1 -get_mac_addr\n";
	exit;
}


my $req, $resp;


if(length($version) > 0) {

	eval {
		$req = $client->read_holding_registers( unit => $device_addr, 
			address  => $reg_ver, quantity => 3);
		$client->send_request($req);
		$resp = $client->receive_response;
	};

	if($@) {
		print STDERR "Error reading version: $@\r\n";
		exit;
	}

	if($resp->{message}->{exception_code} > 0) {
		print STDERR "Received error code: ".sprintf("0x%02X (0x%02X)",$resp->{message}->{exception_code},$resp->{message}->{exception_code})."\n";
		exit();
	}

	($device_ver, $os_ver, $app_ver) = @{$resp->values};
	print STDERR "Version: Device = ".sprintf("%02X",$device_ver).", OS build = $os_ver, application build = $app_ver\n";
}



$text_flag = 0; ## UTF-8 conversion: 0 - no conversion, 1 - convert text from UTF-8 to WIN1251

if(length($get_config_write) > 0) {

	$counter = 0;
	$errors = 0;

	eval {
		$req = $client->read_holding_registers( unit => $device_addr, 
			address  => $reg_config_write, quantity => 1);
		$client->send_request($req);
		$resp = $client->receive_response;
	};

	if($@) {
		print STDERR "Received error code: ".sprintf("%d (0x%02X)",$resp->{message}->{exception_code},$resp->{message}->{exception_code})."\n";
		exit();
	}

	($val_high, $val_low) = @{$resp->values};
	$val = ($val_high << 16) + $val_low;
	print STDERR "Config Write register: ".sprintf("%d (0x%08X)", $val, $val)."\n";
}



if(length($set_scratch) > 0) {
	@data[0] = ($set_scratch >> 16) & 0xffff;
	@data[1] = ($set_scratch >> 0) & 0xffff;

	eval {
		$req = $client->write_multiple_registers( unit => $device_addr, address  => $reg_scratch, values => \@data );
		$client->send_request($req);
		$resp = $client->receive_response;
	};

	if($resp->{message}->{exception_code} > 0) {
		print STDERR "Received error code: ".sprintf("0x%02X (0x%02X)",$resp->{message}->{exception_code},$resp->{message}->{exception_code})."\n";
		exit();
	}

	print STDERR "Scratch set: ".sprintf("0x%04X", $set_scratch)."\n";
}




if(length($set_modbus_addr) > 0) {
	@data = ();
	$data[0] = $set_modbus_addr >> 16;
	$data[1] = $set_modbus_addr & 0xFFFF;

	eval {
		$req = $client->write_multiple_registers( unit => $device_addr, address  => $reg_modbus_addr, values => \@data );
		$client->send_request($req);
		$resp = $client->receive_response;
	};

	if($@) {
		print STDERR "Received error code: ".sprintf("%d (0x%02X)",$resp->{message}->{exception_code},$resp->{message}->{exception_code})."\n";
		exit();
	}

	print STDERR "Modbus address set: ".sprintf("%d", $set_modbus_addr)."\n";
}


if(length($set_modbus_baud) > 0) {
	@data = ();
	$data[0] = $set_modbus_baud >> 16;
	$data[1] = $set_modbus_baud & 0xFFFF;

	eval {
		$req = $client->write_multiple_registers( unit => $device_addr, address  => $reg_modbus_baud, values => \@data );
		$client->send_request($req);
		$resp = $client->receive_response;
	};


	if($@) {
		print STDERR "Received error code: ".sprintf("%d (0x%02X)",$resp->{message}->{exception_code},$resp->{message}->{exception_code})."\n";
		exit();
	}

	print STDERR "Modbus baud rate set: ".sprintf("%d", $set_modbus_baud)."\n";
}


if(length($demo_clock) > 0) {

	my @data = (0);

	eval {
		$req = $client->write_multiple_registers( unit => $device_addr, address  => $reg_clear_text, values => \@data );
		$client->send_request($req);
		$resp = $client->receive_response;
	};

	while(1) {
		my ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime(time);

		my $test = sprintf("%02d:%02d", $hour, $min);
 
		@data = buffer_to_array($test, 3, $text_flag);
		@data[0] = 0; ## X
		@data[1] = 3; ## Y
		@data[2] = 1; ## Font ID

		eval {
			$req = $client->write_multiple_registers( unit => $device_addr, address  => $reg_print_text, values => \@data );
			$client->send_request($req);
			$resp = $client->receive_response;
		};

		usleep(500000);
		
		$test = sprintf("%02d %02d", $hour, $min);

		@data = buffer_to_array($test, 3, $text_flag);
		@data[0] = 0; ## X
		@data[1] = 3; ## Y
		@data[2] = 1; ## Font ID

		eval {
			$req = $client->write_multiple_registers( unit => $device_addr, address  => $reg_print_text, values => \@data );
			$client->send_request($req);
			$resp = $client->receive_response;
		};

		usleep(500000);
	}
}


if(length($test) > 0) {

	$counter = 0;
	$errors = 0;
	
	if($sleep_time < 1) { $sleep_time = 10000; }

	while(1) {
		eval {
			$req = $client->read_holding_registers( unit => $device_addr, 
				address  => $reg_sys_counter, quantity => 1);
			$client->send_request($req);
			$resp = $client->receive_response;
		};

		if($@) {
			print STDERR "Received error code: ".sprintf("%d (0x%02X)",$resp->{message}->{exception_code},$resp->{message}->{exception_code})."\n";
			$errors++;
			next;
		}


		usleep($sleep_time);

		$counter++;

		($syscount_val_high, $syscount_val_low) = @{$resp->values};
		$syscount_val = ($syscount_val_high << 16) + $syscount_val_low;
		print STDERR "Syscounter register: ".sprintf("%d (0x%08X)", $syscount_val, $syscount_val)."\n";

		print "Test counter: $counter, errors: $errors, time: ".localtime."\r\n";



		#####

		@data = (0);

		eval {
			$req = $client->write_multiple_registers( unit => $device_addr, address  => $reg_clear_text, values => \@data );
			$client->send_request($req);
			$resp = $client->receive_response;
		};

		@data = buffer_to_array("TEST", 3, $text_flag);
		@data[0] = 0; ## X
		@data[1] = 0; ## Y
		@data[2] = 0; ## Font ID

		eval {
			$req = $client->write_multiple_registers( unit => $device_addr, address  => $reg_print_text, values => \@data );
			$client->send_request($req);
			$resp = $client->receive_response;
		};
	}


}


if(length($get_sys_count) > 0) {

	$counter = 0;
	$errors = 0;

	eval {
		$req = $client->read_holding_registers( unit => $device_addr, 
			address  => $reg_sys_counter, quantity => 1);
		$client->send_request($req);
		$resp = $client->receive_response;
	};

	if($@) {
		print STDERR "Received error code: ".sprintf("%d (0x%02X)",$resp->{message}->{exception_code},$resp->{message}->{exception_code})."\n";
		exit();
	}

	($val_high, $val_low) = @{$resp->values};
	$val = ($val_high << 16) + $val_low;
	print STDERR "Sys counter register: ".sprintf("%d (0x%08X)", $val, $val)."\n";
}


if(length($get_irq_count) > 0) {

	$counter = 0;
	$errors = 0;

	eval {
		$req = $client->read_holding_registers( unit => $device_addr, 
			address  => $reg_irq_counter, quantity => 1);
		$client->send_request($req);
		$resp = $client->receive_response;
	};

	if($@) {
		print STDERR "Received error code: ".sprintf("%d (0x%02X)",$resp->{message}->{exception_code},$resp->{message}->{exception_code})."\n";
		exit();
	}

	($val_high, $val_low) = @{$resp->values};
	$val = ($val_high << 16) + $val_low;
	print STDERR "IRQ counter register: ".sprintf("%d (0x%08X)", $val, $val)."\n";
}


if(length($get_scratch) > 0) {

	$counter = 0;
	$errors = 0;

	eval {
		$req = $client->read_holding_registers( unit => $device_addr, 
			address  => $reg_scratch, quantity => 1);
		$client->send_request($req);
		$resp = $client->receive_response;
	};

	if($resp->{message}->{exception_code} > 0) {
		print STDERR "Received error code: ".sprintf("0x%02X (0x%02X)",$resp->{message}->{exception_code},$resp->{message}->{exception_code})."\n";
		$errors++;
		next;
	}

	($val_high, $val_low) = @{$resp->values};
	$val = ($val_high << 16) + $val_low;
	print STDERR "Scratch register: ".sprintf("%d (0x%08X)", $val, $val)."\n";
}




if(length($get_ip_addr) > 0) {

	$counter = 0;
	$errors = 0;

	eval {
		$req = $client->read_holding_registers( unit => $device_addr, 
			address  => $reg_ip_addr, quantity => 1);
		$client->send_request($req);
		$resp = $client->receive_response;
	};

	if($@) {
		print STDERR "Received error code: ".sprintf("%d (0x%02X)",$resp->{message}->{exception_code},$resp->{message}->{exception_code})."\n";
	} else {

		($val_high, $val_low) = @{$resp->values};
		$ip1 = $val_high >> 8 & 0xff;
		$ip2 = $val_high & 0xff;
		$ip3 = $val_low >> 8 & 0xff;
		$ip4 = $val_low & 0xff;

		print STDERR "Configured IP: ".sprintf("%d.%d.%d.%d", $ip1, $ip2, $ip3, $ip4)."\n";
	}
}


if(length($get_gw_addr) > 0) {

	$counter = 0;
	$errors = 0;

	eval {
		$req = $client->read_holding_registers( unit => $device_addr, 
			address  => $reg_gw_addr, quantity => 1);
		$client->send_request($req);
		$resp = $client->receive_response;
	};

	if($@) {
		print STDERR "Received error code: ".sprintf("%d (0x%02X)",$resp->{message}->{exception_code},$resp->{message}->{exception_code})."\n";
	} else {

		($val_high, $val_low) = @{$resp->values};
		$ip1 = $val_high >> 8 & 0xff;
		$ip2 = $val_high & 0xff;
		$ip3 = $val_low >> 8 & 0xff;
		$ip4 = $val_low & 0xff;

		print STDERR "Configured Gateway: ".sprintf("%d.%d.%d.%d", $ip1, $ip2, $ip3, $ip4)."\n";
	}
}


if(length($get_netmask) > 0) {

	$counter = 0;
	$errors = 0;

	eval {
		$req = $client->read_holding_registers( unit => $device_addr, 
			address  => $reg_netmask, quantity => 1);
		$client->send_request($req);
		$resp = $client->receive_response;
	};

	if($@) {
		print STDERR "Received error code: ".sprintf("%d (0x%02X)",$resp->{message}->{exception_code},$resp->{message}->{exception_code})."\n";
	} else {


		($val_high, $val_low) = @{$resp->values};
		$ip1 = $val_high >> 8 & 0xff;
		$ip2 = $val_high & 0xff;
		$ip3 = $val_low >> 8 & 0xff;
		$ip4 = $val_low & 0xff;

		print STDERR "Configured Netmask: ".sprintf("%d.%d.%d.%d", $ip1, $ip2, $ip3, $ip4)."\n";
	}
}


if(length($get_mac_addr) > 0) {

	$counter = 0;
	$errors = 0;

	eval {
		$req = $client->read_holding_registers( unit => $device_addr, 
			address  => $reg_mac_addr, quantity => 1);
		$client->send_request($req);
		$resp = $client->receive_response;
	};

	if($@) {
		print STDERR "Received error code: ".sprintf("%d (0x%02X)",$resp->{message}->{exception_code},$resp->{message}->{exception_code})."\n";
	} else {

		($val1, $val2, $val3) = @{$resp->values};
		$hw1 = $val1 >> 8 & 0xff;
		$hw2 = $val1 & 0xff;
		$hw3 = $val2 >> 8 & 0xff;
		$hw4 = $val2 & 0xff;
		$hw5 = $val3 >> 8 & 0xff;
		$hw6 = $val3 & 0xff;

		print STDERR "Configured MAC: ".sprintf("%02x:%02x:%02x:%02x:%02x:%02x", $hw1, $hw2, $hw3, $hw4, $hw5, $hw6)."\n";
	}
}


if(length($set_mac_addr) > 0) {
	
	($hw1, $hw2, $hw3, $hw4, $hw5, $hw6) = split(':', $set_mac_addr);

	$hw1 = hex($hw1);
	$hw2 = hex($hw2);
	$hw3 = hex($hw3);
	$hw4 = hex($hw4);
	$hw5 = hex($hw5);
	$hw6 = hex($hw6);

	@data = ();
	@data[0] = $hw1 << 8 | $hw2;
	@data[1] = $hw3 << 8 | $hw4;
	@data[2] = $hw5 << 8 | $hw6;

	eval {
		$req = $client->write_multiple_registers( unit => $device_addr, address  => $reg_mac_addr, values => \@data );
		$client->send_request($req);
		$resp = $client->receive_response;
	};

	if($@) {
		print STDERR "Received error code: ".sprintf("%d (0x%02X)",$resp->{message}->{exception_code},$resp->{message}->{exception_code})."\n";
		exit();
	}

	print STDERR "New MAC address set: ".sprintf("%02x:%02x:%02x:%02x:%02x:%02x", $hw1, $hw2, $hw3, $hw4, $hw5, $hw6)."\n";
}


if(length($set_ip_addr) > 0) {
	
	($ip1, $ip2, $ip3, $ip4) = split('\.', "$set_ip_addr");

	$ip1 = $ip1 * 1;
	$ip2 = $ip2 * 1;
	$ip3 = $ip3 * 1;
	$ip4 = $ip4 * 1;

	@data = ();
	@data[0] = $ip4 << 8 | $ip3;
	@data[1] = $ip2 << 8 | $ip1;

	eval {
		$req = $client->write_multiple_registers( unit => $device_addr, address  => $reg_ip_addr, values => \@data );
		$client->send_request($req);
		$resp = $client->receive_response;
	};

	if($@) {
		print STDERR "Received error code: ".sprintf("%d (0x%02X)",$resp->{message}->{exception_code},$resp->{message}->{exception_code})."\n";
		exit();
	}

	print STDERR "New IP address set: ".sprintf("%d.%d.%d.%d", $ip1, $ip2, $ip3, $ip4)."\n";
}


if(length($set_gw_addr) > 0) {
	
	($ip1, $ip2, $ip3, $ip4) = split('\.', "$set_gw_addr");

	$ip1 = $ip1 * 1;
	$ip2 = $ip2 * 1;
	$ip3 = $ip3 * 1;
	$ip4 = $ip4 * 1;

	@data = ();
	@data[0] = $ip4 << 8 | $ip3;
	@data[1] = $ip2 << 8 | $ip1;

	eval {
		$req = $client->write_multiple_registers( unit => $device_addr, address  => $reg_gw_addr, values => \@data );
		$client->send_request($req);
		$resp = $client->receive_response;
	};

	if($@) {
		print STDERR "Received error code: ".sprintf("%d (0x%02X)",$resp->{message}->{exception_code},$resp->{message}->{exception_code})."\n";
		exit();
	}

	print STDERR "New GW address set: ".sprintf("%d.%d.%d.%d", $ip1, $ip2, $ip3, $ip4)."\n";
}


if(length($set_netmask) > 0) {
	
	($ip1, $ip2, $ip3, $ip4) = split('\.', "$set_netmask");

	$ip1 = $ip1 * 1;
	$ip2 = $ip2 * 1;
	$ip3 = $ip3 * 1;
	$ip4 = $ip4 * 1;

	@data = ();
	@data[0] = $ip4 << 8 | $ip3;
	@data[1] = $ip2 << 8 | $ip1;

	eval {
		$req = $client->write_multiple_registers( unit => $device_addr, address  => $reg_netmask, values => \@data );
		$client->send_request($req);
		$resp = $client->receive_response;
	};

	if($@) {
		print STDERR "Received error code: ".sprintf("%d (0x%02X)",$resp->{message}->{exception_code},$resp->{message}->{exception_code})."\n";
		exit();
	}

	print STDERR "New NETMASK set: ".sprintf("%d.%d.%d.%d", $ip1, $ip2, $ip3, $ip4)."\n";
}


if(length($set_config_write) > 0) {
	@data[0] = ($set_config_write >> 16) & 0xffff;
	@data[1] = ($set_config_write >> 0) & 0xffff;

	eval {
		$req = $client->write_multiple_registers( unit => $device_addr, address  => $reg_config_write, values => \@data );
		$client->send_request($req);
		$resp = $client->receive_response;
	};

	if($@) {
		print STDERR "Received error code: ".sprintf("%d (0x%02X)",$resp->{message}->{exception_code},$resp->{message}->{exception_code})."\n";
		exit();
	}

	print STDERR "Config Write set: ".sprintf("0x%04X", $set_config_write)."\n";
}


if(length($reboot) > 0) {
	@data = ();
	@data[0] = 0;

	eval {
		$req = $client->write_multiple_registers( unit => $device_addr, address  => $reg_reboot, values => \@data );
		$client->send_request($req);
		$resp = $client->receive_response;
	};

	if($@) {
		print STDERR "Received error code: ".sprintf("%d (0x%02X)",$resp->{message}->{exception_code},$resp->{message}->{exception_code})."\n";
		exit();
	}

	print STDERR "Reboot command sent\n";
}


if(length($X) > 0) {
	$X = $X * 1;
} else {
	$X = 0;
}

if(length($Y) > 0) {
	$Y = $Y * 1;
} else {
	$Y = 0;
}

if(length($font_id) > 0) {
	$F = $font_id * 1;
} else {
	$F = 0;
}



if(length($set_color) > 0) {
	
	@data = ();
	@data[0] = $set_color >> 16;
	@data[1] = $set_color & 0xFFFF;

	eval {
		$req = $client->write_multiple_registers( unit => $device_addr, address  => $reg_hub_color, values => \@data );
		$client->send_request($req);
		$resp = $client->receive_response;
	};

	if($@) {
		print STDERR "Received error code: ".sprintf("%d (0x%02X)",$resp->{message}->{exception_code},$resp->{message}->{exception_code})."\n";
		exit();
	}

	print STDERR "New color set: ".sprintf("%08X", $set_color)."\r\n";
}


if(length($get_color) > 0) {

	eval {
		$req = $client->read_holding_registers( unit => $device_addr, 
			address  => $reg_hub_color, quantity => 1);
		$client->send_request($req);
		$resp = $client->receive_response;
	};

	if($@) {
		print STDERR "Received error code: ".sprintf("%d (0x%02X)",$resp->{message}->{exception_code},$resp->{message}->{exception_code})."\n";
	} else {


		($val_high, $val_low) = @{$resp->values};
		$val = $val_high << 16 | $val_low;

		print STDERR "Current color: ".sprintf("0x%08x", $val)."\n";
	}
}



if(length($set_hub_type) > 0) {
	
	@data = ();
	@data[0] = $set_hub_type >> 16;
	@data[1] = $set_hub_type & 0xFFFF;

	eval {
		$req = $client->write_multiple_registers( unit => $device_addr, address  => $reg_hub_type, values => \@data );
		$client->send_request($req);
		$resp = $client->receive_response;
	};

	if($@) {
		print STDERR "Received error code: ".sprintf("%d (0x%02X)",$resp->{message}->{exception_code},$resp->{message}->{exception_code})."\n";
		exit();
	}

	print STDERR "New HUB type: ".sprintf("%d", $set_hub_type)."\r\n";
}


if(length($get_hub_type) > 0) {

	eval {
		$req = $client->read_holding_registers( unit => $device_addr, 
			address  => $reg_hub_type, quantity => 1);
		$client->send_request($req);
		$resp = $client->receive_response;
	};

	if($@) {
		print STDERR "Received error code: ".sprintf("%d (0x%02X)",$resp->{message}->{exception_code},$resp->{message}->{exception_code})."\n";
	} else {


		($val_high, $val_low) = @{$resp->values};
		$val = $val_high << 16 | $val_low;

		print STDERR "Current HUB type: ".sprintf("%d", $val)."\n";
	}
}


if(length($text) > 0) {
	#@data = (0);

	#eval {
	#	$req = $client->write_multiple_registers( unit => $device_addr, address  => $reg_clear_text, values => \@data );
	#	$client->send_request($req);
	#	$resp = $client->receive_response;
	#};

	@data = buffer_to_array($text, 3, $text_flag);
	@data[0] = $X; ## X
	@data[1] = $Y; ## Y
	@data[2] = $F; ## Font ID

	eval {
		$req = $client->write_multiple_registers( unit => $device_addr, address  => $reg_print_text, values => \@data );
		$client->send_request($req);
		$resp = $client->receive_response;
	};

	if($@) {
		print STDERR "Received error code: ".sprintf("%d (0x%02X)",$resp->{message}->{exception_code},$resp->{message}->{exception_code})."\n";
		exit();
	}


	print STDERR "Text set at ($X, $Y, font: $F): $text\n";
}

if(length($set_options) > 0) {
	
	@data = ();
	@data[0] = 0;
	@data[1] = $set_options & 0x00FF;

	eval {
		$req = $client->write_multiple_registers( unit => $device_addr, address  => $reg_config_options, values => \@data );
		$client->send_request($req);
		$resp = $client->receive_response;
	};

	if($@) {
		print STDERR "Received error code: ".sprintf("%d (0x%02X)",$resp->{message}->{exception_code},$resp->{message}->{exception_code})."\n";
		exit();
	}

	print STDERR "Config options set: ".sprintf("%08X", @data[1])."\r\n";
}


if(length($get_options) > 0) {

	eval {
		$req = $client->read_holding_registers( unit => $device_addr, 
			address  => $reg_config_options, quantity => 1);
		$client->send_request($req);
		$resp = $client->receive_response;
	};

	if($@) {
		print STDERR "Received error code: ".sprintf("%d (0x%02X)",$resp->{message}->{exception_code},$resp->{message}->{exception_code})."\n";
	} else {


		($val_high, $val_low) = @{$resp->values};
		$val = $val_high << 16 | $val_low;

		print STDERR "Current options: ".sprintf("0x%08x", $val)."\n";
	}
}
