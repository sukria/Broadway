package Broadway::UI;

use Dancer ':syntax';
use Dancer::Plugin::Ajax;

use Broadway::Slide;

sub display_slide {
    my ($slide) = @_;
    $slide = sprintf('%03d', $slide);
    return template("slide-$slide");
}

before_template sub { 
    my $tokens = shift;
    if (request->agent =~ /Android|iPhone/i) {
        debug "is_multi_touch : ".request->user_agent;
        $tokens->{is_multi_touch} = 1;
    }
};

get '/' => sub { 
    template 'slideshow';
};

get '/slide/:slide' => sub {
    Broadway::Slide->go(params->{'slide'}); 
    redirect '/';
};

ajax '/refresh_slide' => sub {
    content_type "text/html; charset=UTF-8";

    if (params->{'slide'}) {
        display_slide(params->{'slide'});
    }
    else {
        display_slide(Broadway::Slide->current);
    }
};

1;
