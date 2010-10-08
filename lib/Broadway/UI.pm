package Broadway::UI;

use Dancer ':syntax';
use Dancer::Plugin::Ajax;

use Broadway::Slide;

sub display_slide {
    my ($slide) = @_;
    $slide = sprintf('%03d', $slide);
    return template("slide-$slide");
}

get '/' => sub { 
    template 'slideshow';
};

get '/slide/:slide' => sub {
    Broadway::Slide->go(params->{'slide'}); 
    redirect '/';
};

ajax '/refresh_slide' => sub {
    display_slide(Broadway::Slide->current);
};

get '/remote' => sub {
    template 'remote';
};

1;
