#!/usr/bin/perl -w
 
use strict;
use warnings;
 
use DBIx::Class::Schema::Loader qw/ make_schema_at /;
use JSON::Parse 'json_file_to_perl';
 
my $conf = json_file_to_perl('../store_app.json');
 
my $dsn = "dbi:mysql:" . $conf->{database}->{dbname};
 
make_schema_at(
     'Model::Schema',
     { debug => 1,
       dump_directory => '../lib/',
     },
     [
        $dsn,
        $conf->{database}->{username},
        $conf->{database}->{password}  
     ],
 );