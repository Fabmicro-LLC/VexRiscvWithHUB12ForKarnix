package NetRTUClient;

use parent 'Device::Modbus::Client';
use Device::Modbus::RTU::ADU;
use Role::Tiny::With;

use Carp;
use strict;
use warnings;

with 'NetRTU';

sub new_tcp {
    my ($class, %args) = @_;

    my $self = bless \%args, $class;
    $self->open_port('tcp');

    return $self;
}

sub new_udp {
    my ($class, %args) = @_;

    my $self = bless \%args, $class;
    $self->open_port('udp');

    return $self;
}


1;

