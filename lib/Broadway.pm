package Broadway;
our $VERSION = '0.1';

use Dancer ':syntax';
use Dancer::Plugin::Ajax;

before_template sub { 
    my $tokens = shift;
    if (request->agent =~ /Android|iPhone/i) {
        debug "is_multi_touch : ".request->user_agent;
        $tokens->{is_multi_touch} = 1;
    }
};

use Broadway::API;
use Broadway::UI;

true;
