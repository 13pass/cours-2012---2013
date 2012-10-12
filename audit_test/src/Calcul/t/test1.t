use strict;
use Test;

BEGIN { plan tests => 1 };

use Calcul;

ok(Calcul->divide(6,2), 3);
