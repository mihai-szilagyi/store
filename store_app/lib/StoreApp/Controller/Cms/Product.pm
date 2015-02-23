package StoreApp::Controller::Cms::Product;
use Mojo::Base 'Mojolicious::Controller';
use Mojo::Upload;
use DateTime;

# This action will render a template
sub home {
    my $self = shift;
    $self->render(msg => 'Welcome to Cms!');
}

sub edit {
	my $self = shift;
	my $model = $self->app->model;
	my $manufacturers  =$model->resultset('Manufacturer')->search({}, {
		columns => [qw/id name/],
 		});
	
	my @manufacturers = ();
	while(my $item = $manufacturers->next){
        push @manufacturers, { $item->id => $item->name };
	}
	
	$self->render(manufacturers => \@manufacturers );
}

=head2 save
insert new product into the database
=cut
sub save {
	my $self = shift;
	my $model = $self->app->model;
	my $product  =$model->resultset('Product')->create({
		name => $self->param('name'),
		description => $self->param('description'),
		price => $self->param('price'),
		stock => $self->param('stock'),
		created_date => DateTime->now(),
		material => $self->param('material'),
		manufacturer => $self->param('manufacturer')
		});

	my $upload = $self->req->upload('upload');
	my ($ext) = $upload->filename =~ /(\.[^.]+)$/;
	$upload->move_to("/data/images/" . $product->id . $ext);

	$self->render(json => {
		"message" => "success"
		});
}

1;
