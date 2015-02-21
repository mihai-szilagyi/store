use utf8;
package Model::Schema::Result::Session;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Model::Schema::Result::Session

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<sessions>

=cut

__PACKAGE__->table("sessions");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_nullable: 0

=head2 expires

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 data

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_nullable => 0 },
  "expires",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "data",
  { data_type => "varchar", is_nullable => 1, size => 45 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2015-02-21 20:29:50
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:/JSdqwR4gAQz6sZRDpnQRw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
