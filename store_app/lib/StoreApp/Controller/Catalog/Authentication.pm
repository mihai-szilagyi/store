package StoreApp::Controller::Catalog::Authentication;
use Mojo::Base 'Mojolicious::Controller';

# This action will render a template
sub login {
    my $self = shift;
    my $model = $self->app->model;

    my $user = $model->resultset('Customer')->find($self->param('id'));

    unless ($user) {
    	$user = $model->resultset('Customer')->create(
    													{ id => $self->param('id'),
    													email => $self->param('email')
    												});
    }

    $self->session->{user} = $user->{_column_data};

    $self->render(json => { message => 'Welcome to our pretty catalog!'});
}

# This action will render a template
# sub check {
#     my $self = shift;
#     if (defined $self->session->{user}){
#     	$self->render("");
#     }else{
#     	$self->render("");
#     };
# }

# This action will render a template
sub logout {
    my $self = shift;
    delete $self->session->{user};
    $self->render(json => { message => 'Welcome to our pretty catalog!'});
}


1;
