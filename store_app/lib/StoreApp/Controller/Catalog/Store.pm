package StoreApp::Controller::Catalog::Store;
use Mojo::Base 'Mojolicious::Controller';
use File::Basename;

sub products {
	my $self = shift;
	$self->product_list();
}

sub product_list {
	my $self = shift;

	my $order_by = $self->param('order_by') // "created_date";
	my $order_type = $self->param('order_type') // "asc";

	my $model = $self->app->model;
	my @products  =$model->resultset('Product')->search({}, {
		order_by => { -$order_type => $order_by },
   		# result_class => 'DBIx::Class::ResultClass::HashRefInflator',
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

	$product->{image} = scalar @images ? "/images/" . basename ( $images[0] ) : "http://placehold.it/350x150";

	$self->render(product => $product );
}

1;
