#!/usr/bin/env perl
#===============================================================================
#
#         FILE: wget_oo_class_experiment.pl
#
#        USAGE: ./wget_oo_class_experiment.pl  
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
#      CREATED: 02/19/2017 01:53:17 PM
#     REVISION: ---
#===============================================================================

use strict;
use warnings;
use utf8;

use Data::Dumper qw/ Dumper /;


package WgetCmd;

use strict;
use warnings;

sub new {
    my $class = shift;
    my $arg = shift;

    my $self = {
        cmd => 'wget',
        head => '--spider',
        download => '-O',
        devnull => '/dev/null',
        headers => '-S',
        url => $arg->{url} ? $arg->{url} : 'https://en.wikipedia.org/wiki/Object-oriented_programming',
        };

    bless $self, $class;
    return $self;
}

sub show {
    my $self = shift;
    print $self->{cmd}, ' ' , $self->{head}, ' ', $self->{headers}, ' ', $self->{url}, "\n";
}

sub cmd_aref {
    my $self = shift;
    #push my @cmd, $self->{cmd}, $self->{head}, $self->{headers}, $self->{url};
    push my @cmd, $self->{cmd}, $self->{download}, $self->{devnull}, $self->{headers}, $self->{url};
    return \@cmd;
}

sub execute {
    my $self = shift;
    system( @{ $self->cmd_aref() } );
}

package main;


my $wget_cmd = WgetCmd->new( {url => 'http://lxer.com'} );
$wget_cmd->show();
my $cmd_aref = $wget_cmd->cmd_aref();
print "@$cmd_aref", "\n";
print Dumper $cmd_aref;
$wget_cmd->execute();
