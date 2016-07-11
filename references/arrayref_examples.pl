#!/usr/bin/env perl
# Name:
# Version:

use strict;
use warnings;

use Data::Dumper;


my @picard = qw(bald french thin);
my @spock  = qw(vulcan tall logical);
my @data   = qw(machine android positronic);

my @about_picard = ("picard", \@picard);
my @about_spock  = ("spock", \@spock);
my @about_data   = ("data", \@data);

my @all_persons = (
\@about_picard,
\@about_spock,
\@about_data,
);

print q|Dumper \@all_persons|;
print Dumper \@all_persons;
print "\n";

print q|"@all_persons"|, "\n";
print "@all_persons", "\n\n";

print q|$all_persons[0]|, "\n";
print $all_persons[0], "\n\n";

print q|@{$all_persons[0]}|, "\n";
print @{$all_persons[0]}, "\n\n";

print q|$all_persons[0][0]|, "\n";
print $all_persons[0][0], "\n\n";
print q|$all_persons[0]->[0]|, "\n";
print $all_persons[0]->[0], "\n\n";
print q|${$all_persons[0]}[0]|, "\n";
print ${$all_persons[0]}[0], "\n\n";

print q|$all_persons[0][1]|, "\n";
print $all_persons[0][1], "\n\n";
print q|$all_persons[0]->[1]|, "\n";
print $all_persons[0]->[1], "\n\n";
print q|${$all_persons[0]}[1]|, "\n";
print ${$all_persons[0]}[1], "\n\n";

print q|@{$all_persons[0][1]}|, "\n";
print @{$all_persons[0][1]}, "\n\n";
print q|@{$all_persons[0]->[1]}|, "\n";
print @{$all_persons[0]->[1]}, "\n\n";

print q|${$all_persons[0][1]}[1]|, "\n";
print ${$all_persons[0][1]}[1], "\n\n";
#
print q|$all_persons[0]->[1]->[1]|, "\n";
print $all_persons[0]->[1]->[1], "\n\n";
#
print q|$all_persons[0][1][1]|, "\n";
print $all_persons[0][1][1], "\n\n";


for my $person (@all_persons) {
    print ${$person}[0], "\n";
    my $aref = ${$person}[1];
    print "@{$aref}", "\n";
}
