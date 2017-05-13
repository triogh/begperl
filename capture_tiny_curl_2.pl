#!/usr/bin/env perl
#===============================================================================
#
#         FILE: capture_tiny_curl.pl
#
#        USAGE: ./capture_tiny_curl.pl  
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
#      CREATED: 05/13/2017 07:20:51 PM
#     REVISION: ---
#===============================================================================

use strict;
use warnings;
use utf8;

use Capture::Tiny ':all';

#capture from external command
my $cmd = 'curl';
my @args = qw(-vo /dev/null http://mirror.centos.XXXXX/centos/7/isos/x86_64/CentOS-7-x86_64-DVD-1611.iso);
print ((join '', $cmd, @args), "\n");
my ( $stderr, @result ) = tee_stderr { system( $cmd, @args ); };

print "\n\n###debug $stderr \n\n### end_debug";
