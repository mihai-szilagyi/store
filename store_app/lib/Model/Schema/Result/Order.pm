use utf8;
package Model::Schema::Result::Order;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Model::Schema::Result::Order

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<order>

=cut

__PACKAGE__->table("order");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_nullable: 0

=head2 product

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 price

  data_type: 'float'
  is_nullable: 1

=head2 invoice

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_nullable => 0 },
  "product",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "price",
  { data_type => "float", is_nullable => 1 },
  "invoice",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 invoice

Type: belongs_to

Related object: L<Model::Schema::Result::Invoice>

=cut

__PACKAGE__->belongs_to(
  "invoice",
  "Model::Schema::Result::Invoice",
  { id => "invoice" },
  { is_deferrable => 1, on_delete => "NO ACTION", on_update => "NO ACTION" },
);

=head2 product

Type: belongs_to

Related object: L<Model::Schema::Result::Product>

=cut

__PACKAGE__->belongs_to(
  "product",
  "Model::Schema::Result::Product",
  { id => "product" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2015-02-21 20:29:50
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:AlHBOYgPLL0kTKc0StVzCg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
