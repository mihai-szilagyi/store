use utf8;
package Model::Schema::Result::Invoice;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Model::Schema::Result::Invoice

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<invoice>

=cut

__PACKAGE__->table("invoice");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_nullable: 0

=head2 customer

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 date

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=head2 address

  data_type: 'text'
  is_nullable: 1

=head2 total

  data_type: 'float'
  is_nullable: 1

=head2 delivered

  data_type: 'tinyint'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_nullable => 0 },
  "customer",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "date",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 1,
  },
  "address",
  { data_type => "text", is_nullable => 1 },
  "total",
  { data_type => "float", is_nullable => 1 },
  "delivered",
  { data_type => "tinyint", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 customer

Type: belongs_to

Related object: L<Model::Schema::Result::Customer>

=cut

__PACKAGE__->belongs_to(
  "customer",
  "Model::Schema::Result::Customer",
  { id => "customer" },
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
  { "foreign.invoice" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2015-02-21 20:29:50
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:+3exyxf1bFLAVIPjGdqWVg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
