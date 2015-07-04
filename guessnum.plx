#!/usr/bin/perl
# guessnum.plx

use warnings;
use strict;

my $target = 12;
print "Guess my number!\n";
print "Enter your guess: ";

while (<STDIN>){
	my $guess = $_;
	if ($guess > $target) {
		print "Your number is bigger than my number\n";
		print "Try again.\n";
	}elsif ($guess < $target){
		print "Your number is less than my number\n";
		print "Try again.\n";
	}else{
		print "Bravo. Your guess is correct.\n";
		exit;
	}
}
