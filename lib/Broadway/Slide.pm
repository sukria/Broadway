package Broadway::Slide;

use Dancer ':syntax';

my $_slide = 0;

sub nbslides { config->{broadway}{slides} }

sub current { 
    if (config->{'broadway'}{'remote'}) {
        return $_slide;
    }
    else {
        if (not defined session('slide')) {
            session slide => 0;
        }
        return session('slide') 
    }
}

sub next { 
    my $slide = session('slide');
    $slide++ if $slide < nbslides;
    if (config->{'broadway'}{'remote'}) {
        $_slide = $slide;
    }
    session(slide => $slide);
}

sub prev { 
    my $slide = session('slide');
    $slide-- if $slide > 0;
    if (config->{'broadway'}{'remote'}) {
        $_slide = $slide;
    }
    session(slide => $slide);
}

sub go { 
    my $slide = $_[1];
    if (config->{'broadway'}{'remote'}) {
        $_slide = $slide;
    }
    session(slide => $slide);
}

1;
