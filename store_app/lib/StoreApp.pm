package StoreApp;
use Mojo::Base 'Mojolicious';
use Model::Schema;

# This method will run once at server start
sub startup {
    my $self = shift;

    # Documentation browser under "/perldoc"
    $self->plugin('PODRenderer');
    my $config = $self->plugin('JSONConfig');

    my $dsn = "dbi:mysql:" . $config->{database}->{dbname};
      
    unless ($self->can('model')) {
        __PACKAGE__->attr(
         'model' => sub {
                Model::Schema->connect(
                    $dsn,  
                    $config->{database}->{username},
                    $config->{database}->{password},
                );
            }
        );
    }
    # Router
    my $r = $self->routes;

    # Normal route to controller
    $r->get('/')->to('example#welcome');
}

1;
