package Broadway::API;

use Dancer ':syntax';
use Dancer::Plugin::Ajax;
use Broadway::Slide;

ajax '/next' => sub {
    Broadway::Slide->next;
};

ajax '/prev' => sub {
    Broadway::Slide->prev;
};

ajax '/last' => sub {
    Broadway::Slide->go(config->{broadway}{slides});
};

ajax '/first' => sub {
    Broadway::Slide->go(0);
};

ajax '/current_slide' => sub {
    content_type 'application/json';
    to_json({ slide => Broadway::Slide->current });
};

1;
