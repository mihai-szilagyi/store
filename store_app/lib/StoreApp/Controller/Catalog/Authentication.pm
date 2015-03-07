package StoreApp::Controller::Catalog::Authentication;
use Mojo::Base 'Mojolicious::Controller';

# This action will render a template
sub login {
    my $self = shift;
    $self->render(json => { message => 'Welcome to our pretty catalog!'});
}

# This action will render a template
sub check {
    my $self = shift;
    if (defined $self->session->{user}){
    	$self->render("");
    }else{
    
    };
    
}

# This action will render a template
sub logout {
    my $self = shift;
    $self->render(json => { message => 'Welcome to our pretty catalog!'});
}


1;
