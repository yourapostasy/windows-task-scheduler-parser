#!/usr/bin/perl
use strict;
use warnings;
use XML::LibXML;
use XML::Compile::Schema;
use XML::Compile::Util qw/pack_type/;
my $schema = XML::Compile::Schema->new( "duration-range-example-2.xsd" );
my $type   = pack_type 'http://tempuri.org/durationExample', 'Duration';
my $elem   = pack_type 'http://tempuri.org/durationExample', 'Duration';
$schema->printIndex;
my $read   = $schema->compile(READER => $elem);
