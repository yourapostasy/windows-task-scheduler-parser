#!/usr/bin/perl

use XML::LibXML;
use XML::Compile::Schema;
use XML::Compile::Util qw/pack_type/;
use Data::Dumper;

$schema = XML::Compile::Schema->new( "task-scheduler.xsd" );
$type   = pack_type 'http://schemas.microsoft.com/windows/2004/02/mit/task', 'Task';
$elem   = pack_type 'http://schemas.microsoft.com/windows/2004/02/mit/task', 'Task';

$schema->printIndex;

$read   = $schema->compile(READER => $elem);
$data   = $read->( "audit" );
warn $schema->template('PERL', $type);
