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
        name       => 'wget',
        opt_spider => '--spider',
        opt_O      => '-O',
        opt_S      => '-S',
        download   => $arg->{download} || undef,
        save_to    => $arg->{save_to} || '/dev/null',
        url        => $arg->{url} || 'https://en.wikipedia.org/wiki/Object-oriented_programming',
    };

    bless $self, $class;
    return $self;
}

sub get_name       { my $self = shift; return $self->{name} }
sub get_opt_spider { my $self = shift; return $self->{opt_spider} }
sub get_opt_O      { my $self = shift; return $self->{opt_O} }
sub get_opt_S      { my $self = shift; return $self->{opt_S} }
sub get_download   { my $self = shift; return $self->{download} }
sub get_save_to    { my $self = shift; return $self->{save_to} }
sub get_url        { my $self = shift; return $self->{url} }

sub get_cmd_aref {
    my $self = shift;

    my @cmd;
    if ($self->{download}) {
        push @cmd, $self->{name}, $self->{opt_O}, $self->{save_to}, $self->{opt_S}, $self->{url};
    }
    else {
        push @cmd, $self->{name}, $self->{opt_spider}, $self->{opt_S}, $self->{url};
    }

    return \@cmd;
}

sub system_exec {
    my $self = shift;
    system( @{ $self->get_cmd_aref() } );
}

package main;


my $wget_cmd            = WgetCmd->new;
my $wget_cmd_lxer       = WgetCmd->new( { url => 'http://lxer.com' } );
my $wget_cmd_download   = WgetCmd->new( { url => 'http://lxer.com', download => 1 } );

my $cmd_aref            = $wget_cmd->get_cmd_aref;
my $cmd_aref_lxer       = $wget_cmd_lxer->get_cmd_aref;
my $cmd_aref_download   = $wget_cmd_download->get_cmd_aref;

print "@$cmd_aref", "\n";
print "@$cmd_aref_lxer", "\n";
print "@$cmd_aref_download", "\n";

print Dumper $cmd_aref;
print Dumper $cmd_aref_lxer;
print Dumper $cmd_aref_download;

$wget_cmd->system_exec;
$wget_cmd_lxer->system_exec;
$wget_cmd_download->system_exec;
print $wget_cmd->get_name, "\n";
print $wget_cmd->get_url, "\n";
print $wget_cmd_lxer->get_url, "\n";
