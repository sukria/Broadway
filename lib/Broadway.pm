package Broadway;
use Dancer ':syntax';
our $VERSION = '0.1';

use Dancer::Plugin::Ajax;

my $SLIDE = 1;

get '/test' => sub { template 'test' };

sub display_slide {
    my ($slide) = @_;
    $slide = sprintf('%03d', $slide);
    debug "using template : slide-$slide";
    return template("slide-$slide");
}

get '/' => sub { 
    template 'slideshow';
};

ajax '/refresh_slide' => sub {
    display_slide($SLIDE);
};

# API

ajax '/next' => sub {
    my $nbslides = config->{slides};
    $SLIDE++ if $SLIDE < $nbslides;
};

ajax '/prev' => sub {
    my $nbslides = config->{slides};
    $SLIDE-- if $SLIDE > 1;
};

ajax '/current_slide' => sub {
    content_type 'application/json';
    to_json({ slide => $SLIDE });
};

# remote

get '/remote' => sub {
    template 'remote';
};

true;
