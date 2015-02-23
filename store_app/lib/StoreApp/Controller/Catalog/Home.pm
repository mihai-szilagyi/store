package StoreApp::Controller::Catalog::Home;
use Mojo::Base 'Mojolicious::Controller';
use File::Basename;

# This action will render a template
sub home {
    my $self = shift;
    $self->_carousel();
    $self->render(msg => 'Welcome to our pretty catalog!');
}

sub _carousel {
	my $self = shift;
	my $model = $self->app->model;
	my $slides  =$model->resultset('Carousel')->search({}, {
		order_by => { -asc => "position" },
   		});

	my @carousel = ();

	while (my $slide = $slides->next) {
		my $id = $slide->product->id;
		my $path = $self->config->{path}->{images};
		my @images = glob "'${path}/*${id}.*'";
		my $image = scalar @images ? "/images/" . basename ( $images[0] ) : "http://placehold.it/350x150";
		push @carousel, { id => $id , image => $image, caption => $slide->product->description() };
	}

	$self->stash(carousel => \@carousel);
}

1;
