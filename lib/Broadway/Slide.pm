package Broadway::Slide;

use Dancer ':syntax';

my $_slide = 0;

sub nbslides { config->{broadway}{slides} }
sub current { $_slide }
sub next { $_slide++ if $_slide < nbslides }
sub prev { $_slide-- if $_slide > 0 }
sub go { $_slide = $_[1] }

1;
