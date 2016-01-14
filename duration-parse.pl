#!/usr/bin/perl

use strict;
use warnings;

use XML::Compile::Schema;
use XML::Compile::Util qw/pack_type/;
use Data::Dumper;

my $schema = XML::Compile::Schema->new( "duration-example.xsd" );

# see what types are defined
$schema->printIndex;
# show template to demonstrate how to write out hashes for schema
my $type = pack_type 'http://tempuri.org/duration-example', 'periodExample';
warn $schema->template('PERL', $type);

# create and use a reader
my $elem   = pack_type 'http://tempuri.org/duration-example', 'periodExample';
my $read   = $schema->compile(READER => $elem);
my $data   = $read->("duration-example.xml");
