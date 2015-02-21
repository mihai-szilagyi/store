package StoreApp::Controller::Cms::Product;
use Mojo::Base 'Mojolicious::Controller';

# This action will render a template
sub home {
    my $self = shift;
    my $model = $self->app->model;
    $model->resultset('Customer')->all();

    $self->render(msg => 'Welcome to Cms!');
}

1;
