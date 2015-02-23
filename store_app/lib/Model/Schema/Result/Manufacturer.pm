use utf8;
package Model::Schema::Result::Manufacturer;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Model::Schema::Result::Manufacturer

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<manufacturer>

=cut

__PACKAGE__->table("manufacturer");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 name

  data_type: 'varchar'
  is_nullable: 1
  size: 450

=head2 details

  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "name",
  { data_type => "varchar", is_nullable => 1, size => 450 },
  "details",
  { data_type => "text", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 products

Type: has_many

Related object: L<Model::Schema::Result::Product>

=cut

__PACKAGE__->has_many(
  "products",
  "Model::Schema::Result::Product",
  { "foreign.manufacturer" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2015-02-23 17:24:56
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:uErNVzAU6OalWj3yREeqhg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
