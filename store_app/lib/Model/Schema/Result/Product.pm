use utf8;
package Model::Schema::Result::Product;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Model::Schema::Result::Product

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<product>

=cut

__PACKAGE__->table("product");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 price

  data_type: 'float'
  is_nullable: 1

=head2 description

  data_type: 'mediumtext'
  is_nullable: 1

=head2 name

  data_type: 'varchar'
  is_nullable: 1
  size: 450

=head2 stock

  data_type: 'smallint'
  default_value: 0
  is_nullable: 1

=head2 material

  data_type: 'varchar'
  is_nullable: 1
  size: 450

=head2 color

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 manufacturer

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 type

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 created_date

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=head2 last_updated

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "price",
  { data_type => "float", is_nullable => 1 },
  "description",
  { data_type => "mediumtext", is_nullable => 1 },
  "name",
  { data_type => "varchar", is_nullable => 1, size => 450 },
  "stock",
  { data_type => "smallint", default_value => 0, is_nullable => 1 },
  "material",
  { data_type => "varchar", is_nullable => 1, size => 450 },
  "color",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "manufacturer",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "type",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "created_date",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 1,
  },
  "last_updated",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 1,
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 manufacturer

Type: belongs_to

Related object: L<Model::Schema::Result::Manufacturer>

=cut

__PACKAGE__->belongs_to(
  "manufacturer",
  "Model::Schema::Result::Manufacturer",
  { id => "manufacturer" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);

=head2 orders

Type: has_many

Related object: L<Model::Schema::Result::Order>

=cut

__PACKAGE__->has_many(
  "orders",
  "Model::Schema::Result::Order",
  { "foreign.product" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 type

Type: belongs_to

Related object: L<Model::Schema::Result::Type>

=cut

__PACKAGE__->belongs_to(
  "type",
  "Model::Schema::Result::Type",
  { id => "type" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2015-02-23 17:24:56
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:YHBiM4gg10jext1vgOTqWA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
