package StoreApp;
use Mojo::Base 'Mojolicious';
use Model::Schema;
use WWW::Session;

# This method will run once at server start
sub startup {
    my $self = shift;

    # Documentation browser under "/perldoc"
    $self->plugin('PODRenderer');
    $self->plugin('ParamLogger');
    my $config = $self->plugin('JSONConfig');
    
    #Set up the serialization engine (defaults to JSON)
    WWW::Session->serialization_engine('JSON');    

    my $dsn = "dbi:mysql:" . $config->{database}->{dbname};
    
    my $schema = Model::Schema->connect(
                    $dsn,  
                    $config->{database}->{username},
                    $config->{database}->{password},
                    { AutoCommit => 1 },
                );

    
    unless ($self->can('model')) {
        __PACKAGE__->attr(
         'model' => sub { return $schema }
        );
    }


    WWW::Session->add_storage( 'MySQL', { 
                                        dbh => $schema->storage()->dbh(),
                                        table => 'sessions',
                                        fields => {
                                                sid => 'id',
                                                expires => 'expires',
                                                data => 'data'
                                        },
                                    }
                          );

    WWW::Session->autosave(1);

    WWW::Session->setup_field('user',
                        inflate => sub { return $schema->resultset('Customer')->find({id => $_[0] }) },
                        deflate => sub { return $_[0]->id(); },
                );
                    
    WWW::Session->default_expiration_time(3600);
    # Router
    my $r = $self->routes;

    # Normal route to controller
    $r->get('/')->to('catalog-home#home');
    $r->get('/store')->to('catalog-store#products');
    $r->get('/store/view')->to('catalog-store#view');

    my $cms = $self->routes->under('/cms');
    $cms->get("/product")->to('cms-product#home');
    $cms->post("/product/save")->to('cms-product#save');

}

1;
