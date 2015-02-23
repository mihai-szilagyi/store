package StoreApp::Controller::Catalog::Store;
use Mojo::Base 'Mojolicious::Controller';
use File::Basename;

sub products {
	my $self = shift;
	$self->product_list();
}

sub product_list {
	my $self = shift;
	my $model = $self->app->model;
	my @products  =$model->resultset('Product')->search({}, {
   		result_class => 'DBIx::Class::ResultClass::HashRefInflator',
 		})->all;
	
	$self->render(products => \@products );
}

sub view {
	my $self = shift;
	my $model = $self->app->model;
	my $product  = $model->resultset('Product')->find({ id => $self->param('id')}, {
   		result_class => 'DBIx::Class::ResultClass::HashRefInflator',
 		});
	
	my $id = $product->{id};
	my $path = $self->config->{path}->{images};
	my @images = glob "'${path}/*${id}.*'";

	$product->{image} = "/images/" . basename ( $images[0] );

	$self->render(product => $product );
}

1;
