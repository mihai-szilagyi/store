package StoreApp::Controller::Catalog::Home;
use Mojo::Base 'Mojolicious::Controller';

# This action will render a template
sub home {
    my $self = shift;
    $self->render(msg => 'Welcome to our pretty catalog!');
}

1;
