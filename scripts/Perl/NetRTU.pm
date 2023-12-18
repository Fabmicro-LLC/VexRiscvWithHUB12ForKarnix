package NetRTU;

use Fcntl;
use Time::HiRes qw( usleep );
use Device::Modbus::RTU::ADU;
use FileHandle;
use Socket;
use Carp;
use strict;
use warnings;

our $VERSION = '0.022';

use Role::Tiny;

sub open_port {
    my $self = shift;
    my $type = shift;

    # Validate parameters
    croak "Attribute 'port' is required for a Modbus RTU client"
        unless exists $self->{port};
    croak "Attribute 'host' is required for a Modbus RTU client"
        unless exists $self->{host};

    $self->{timeout}  //=     3;  # seconds

	my $remote = inet_aton($self->{host})  || die "No such host $self->{host}";

	if($type eq 'udp' or $type eq 'UDP') {
		socket($self->{fd}, PF_INET, SOCK_DGRAM, getprotobyname('udp')) || die "Can't create socket - $!";
	} else {
		socket($self->{fd}, PF_INET, SOCK_STREAM, getprotobyname('tcp')) || die "Can't create socket - $!";
	}

	my $paddr = sockaddr_in($self->{port}, $remote);

	connect($self->{fd}, $paddr)        || die "Can't connect to $self->{host}:$self->{port} - $!";

	$self->{fd}->autoflush(1);

  
    return $self->{fd};
}


sub fhbits {
        my @fhlist = @_;
        my $bits = "";
        for my $fh (@fhlist) {
            vec($bits, fileno($fh), 1) = 1;
        }
        return $bits;
    }


sub read_port {
    my $self    = shift;
    my $buffer  = '';
    my $bytes   = 0;
    my $timeout = 1000 * $self->{timeout}; # Turn to milliseconds
    while(1) {
        my $read;
	my $rin = fhbits($self->{fd});

	if(length($buffer) == 0) {
		if(select($rin, undef, undef, 1.0) < 1) {
			last;
		}
	} else {
		if(select($rin, undef, undef, 0.003) < 1) {
			last;
		}
	}

	$bytes = sysread($self->{fd}, $read, 255);
        $buffer  .= $read;
        $timeout -= 5;

    	if($timeout <= 0 || ($bytes == 0 && length($buffer) > 0)) { last; }
    }

    # say STDERR "> " . join '-', unpack 'C*', $buffer;
    $self->{buffer} = $buffer;
    return $buffer;
}

sub write_port {
    my ($self, $adu) = @_;
    #$self->{port}->write($adu->binary_message);
    my $written = syswrite($self->{fd}, $adu->binary_message, length($adu->binary_message));
}

sub disconnect {
    my $self = shift;
    #$self->{port}->close;
    close($self->fd);
}

#### Modbus RTU Operations

sub parse_buffer {
    my ($self, $bytes, $pattern) = @_;
    croak "Timeout error" unless
        defined $self->{buffer} && length($self->{buffer}) >= $bytes;    
    return unpack $pattern, substr $self->{buffer},0,$bytes,'';
}

sub new_adu {
    my ($self, $msg) = @_;
    my $adu = Device::Modbus::RTU::ADU->new;
    if (defined $msg) {
        $adu->message($msg);
        $adu->unit($msg->{unit}) if defined $msg->{unit};
    }
    return $adu;
}

### Parsing a message

sub parse_header {
    my ($self, $adu) = @_;
    my $unit = $self->parse_buffer(1, 'C');
    $adu->unit($unit);
    return $adu;
}

sub parse_footer {
    my ($self, $adu) = @_;
    my $crc = $self->parse_buffer(2, 'v');
    $adu->crc($crc);
    return $adu;
}

1;

__END__

=head1 NAME

Device::Modbus::RTU - Perl distribution to implement Modbus RTU communications

=head1 SYNOPSIS

 #! /usr/bin/env perl

 use Device::Modbus::RTU::Client;
 use strict;
 use warnings;
 use v5.10;
 
 my $client = Device::Modbus::RTU::Client->new(
    port     => '/dev/ttyUSB0',
    baudrate => 19200,
    parity   => 'none',
 );
 
 my $req = $client->read_holding_registers(
    unit     => 4,
    address  => 0,
    quantity => 2,
 );

 $client->send_request($req);
 my $resp = $client->receive_response;

=head1 DESCRIPTION

This distribution implements the Modbus RTU protocol on top of L<Device::Modbus>. It includes both a client and a server, L<Device::Modbus::RTU::Client> and L<Device::Modbus::RTU::Server>.

=head1 SEE ALSO

=head2 Other distributions

These are other implementations of Modbus in Perl which may be well suited for your application:
L<Protocol::Modbus>, L<MBclient>, L<mbserverd|https://github.com/sourceperl/mbserverd>.

=head1 GITHUB REPOSITORY

You can find the repository of this distribution in L<GitHub|https://github.com/jfraire/Device-Modbus-RTU>.

=head1 AUTHOR

Julio Fraire, E<lt>julio.fraire@gmail.comE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2015 by Julio Fraire
This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.14.2 or,
at your option, any later version of Perl 5 you may have available.

=cut
