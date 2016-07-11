#!/usr/bin/env perl
# Name:
# Version:

use strict;
use warnings;

use Data::Dumper;

my %picard_info;
%picard_info = (
name => "picard",
rank => "captain",
shirt => "red",
);

print Dumper \%picard_info;
print "\n";

my $picard_ref = \%picard_info;

print q|keys %picard_info|, "\n";
print keys %picard_info, "\n\n";
#
print q|keys %{$picard_ref}|, "\n";
print keys %{$picard_ref}, "\n\n";
#
print q|keys %$picard_ref|, "\n";
print keys %$picard_ref, "\n\n";


print q|$hash{"name"}|, "\n";
print $picard_info{"name"}, "\n\n";


print q|${$picard_ref}{"name"}|, "\n";
print ${$picard_ref}{"name"}, "\n\n";
#
print q|$$picard_ref{"name"}|, "\n";
print $$picard_ref{"name"}, "\n\n";
#
print q|$picard_ref->{"name"}|, "\n";
print $picard_ref->{"name"}, "\n\n";

my %spock_info;
%spock_info = (
name => "spock",
rank => "commander",
shirt => "blue",
);

my $spock_ref = \%spock_info;

my @crew = (\%picard_info, \%spock_info);

print Dumper \@crew;
print "\n";
print q|@crew|, "\n";
print "@crew\n\n";


print q|${$crew[1]}{"name"}|, "\n";
print ${$crew[1]}{"name"}, "\n\n";
#
print q|$crew[1]->{"name"}|, "\n";
print $crew[1]->{"name"}, "\n\n";
#
print q|$crew[1]{"name"}|, "\n";
print $crew[1]{"name"}, "\n\n";

my $s_ref = $crew[1];
print q|$s_ref = $crew[1]|, "\n";

print q|$s_ref->{"name"}|, "\n";
print $s_ref->{"name"}, "\n\n";
