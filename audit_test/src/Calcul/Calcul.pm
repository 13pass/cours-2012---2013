package Calcul;

use strict;
use warnings;

use Mojo::UserAgent;
use Mojo::Util 'encode';


sub divide {
	my ($self, $a, $b) = @_;

	return $a / $b;
}

1;
