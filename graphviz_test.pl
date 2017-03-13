#!/usr/bin/env perl
#===============================================================================
#
#         FILE: graphviz_test.pl
#
#        USAGE: ./graphviz_test.pl  
#
#  DESCRIPTION: 
#
#      OPTIONS: ---
# REQUIREMENTS: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: YOUR NAME (), 
# ORGANIZATION: 
#      VERSION: 1.0
#      CREATED: 03/13/2017 03:50:43 PM
#     REVISION: ---
#===============================================================================

use strict;
use warnings;
use utf8;

# external dependencies, sudo apt-get graphviz libgraphviz-perl
use GraphViz;

my $g = GraphViz->new();
$g->add_node('Client');
$g->add_node('Server', shape => 'box');
$g->add_edge('Client' => 'Server');
$g->as_jpeg('simple.jpg');
