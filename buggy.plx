#!/usr/bin/perl
#buggy.plx

use warnings;
use strict;

my %hash;

until (/^q/i) {
	print "What would you like to do? ('o' for options): ";
	$_ = <STDIN>;
	chomp $_;

	if ($_ eq "o"){
		options();
	}elsif ($_ eq "r"){
		myread();
	}elsif ($_ eq "l"){ 
		list();
	}elsif ($_ eq "w"){
		mywrite(); 
	}elsif ($_ eq "d"){ 
		mydelete(); 
	}elsif ($_ eq "x"){ 
		clear(); 
	}else { 
		print "Sorry, not a recognized option.\n"; 
	}
}

sub options {
	print<<EOF;
	Options available:
	o - view options
	r - read entry
	l - list all entries
	w - write entry
	d - delete entry
	x - delete all entries
EOF
}

sub myread {
	my $keyname = getkey();
	if (exists $hash{$keyname}) {
		print "Element $keyname has value $hash{$keyname}";
	} else {
		print "Sorry, this element does not exist.\n"}
}

sub list {
	foreach (sort keys(%hash)) {
		print "$_ => $hash{$_}\n";}
}

sub mywrite {
	my $keyname = getkey();
	my $keyval = getval();
	if (exists $hash{$keyname}) {
		print "Sorry, this element already exists.\n"
	} else {$hash{$keyname} = $keyval}
}

sub mydelete {
	my $keyname = getkey();
	if (exists $hash{$keyname}) {
		print "This will delete the entry $keyname.\n";
		delete $hash{$keyname}}
}

sub clear {
	undef %hash;
}

sub getkey {
	print "Enter key name of element: "; 
	my $var = <STDIN>;
	chomp $var;
	return $var;
}

sub getval {
	print "Enter value of element: "; 
	my $var = <STDIN>;
	chomp $var;
	return $var;
}
