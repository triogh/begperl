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
        op_head => '--spider',
        download => $arg->{download} ? $arg->{download} : undef,
        op_download => '-O',
        devnull => '/dev/null',
        headers => '-S',
        url => $arg->{url} ? $arg->{url} : 'https://en.wikipedia.org/wiki/Object-oriented_programming',
        };

    bless $self, $class;
    return $self;
}

sub show {
    my $self = shift;

    my @cmd;
    if ($self->{download}) {
        push @cmd, $self->{cmd}, $self->{op_download}, $self->{devnull}, $self->{headers}, $self->{url};
    }
    else {
        push @cmd, $self->{cmd}, $self->{op_head}, $self->{headers}, $self->{url};
    }
    print "@cmd\n";
}

sub cmd_aref {
    my $self = shift;

    my @cmd;
    if ($self->{download}) {
        push @cmd, $self->{cmd}, $self->{op_download}, $self->{devnull}, $self->{headers}, $self->{url};
    }
    else {
        push @cmd, $self->{cmd}, $self->{op_head}, $self->{headers}, $self->{url};
    }
    return \@cmd;
}

sub execute {
    my $self = shift;
    system( @{ $self->cmd_aref() } );
}

package main;


my $wget_cmd = WgetCmd->new( {url => 'http://lxer.com'} );
my $wget_cmd_download = WgetCmd->new( { url => 'http://lxer.com', download => 1 } );
$wget_cmd->show();
$wget_cmd_download->show();
my $cmd_aref = $wget_cmd->cmd_aref();
my $cmd_aref_download = $wget_cmd_download->cmd_aref();
print "@$cmd_aref", "\n";
print "@$cmd_aref_download", "\n";
print Dumper $cmd_aref;
print Dumper $cmd_aref_download;
$wget_cmd->execute();
$wget_cmd_download->execute();
