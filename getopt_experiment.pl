#!/usr/bin/env perl
#===============================================================================
#
#         FILE: getopt_experiment.pl
#
#        USAGE: ./getopt_experiment.pl  
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
#      CREATED: 02/23/2017 05:56:47 AM
#     REVISION: ---
#===============================================================================

use strict;
use warnings;
use utf8;

my @cli_args = @ARGV;

use Getopt::Long;
      my $data   = "file.dat";
      my $length = 24;
      my $verbose;
      my $map_append;
      my $map_replay;
      GetOptions (
                  "length=i"    => \$length,       # numeric
                  "file=s"      => \$data,         # string
                  "verbose"     => \$verbose,      # flag
                  "map-append"  => \$map_append,   # flag
                  "map-replay"  => \$map_replay,   # flag
                  )
      or die("Error in command line arguments\n");

print $0, ' ', "@cli_args", "\n";
print "Lenght was set to: ", $length, "\n";

if ($map_append) {
    open( my $fh, '>>', $data ) or die "Error! Could not open $data: $!";
    for (0 .. $#cli_args) {
        if ($cli_args[$_] =~ /map-append/) {
            $cli_args[$_] = '';
        }
        if ($cli_args[$_] =~ /map-replay/) {
            $cli_args[$_] = '';
        }
    }
    print {$fh} $0, ' ', "@cli_args", "\n";
    close($fh) or die "Error! Could not close $data: $!"; 
}

if ($map_replay) {
    open( my $fh, '<', $data ) or die "Error! Could not open $data: $!";
    while (my $line = <$fh>) {
        chomp $line;
        system(split /\s/, $line);    
    }
    close($fh) or die "Error! Could not close $data: $!";
}
