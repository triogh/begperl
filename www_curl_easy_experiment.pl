#!/usr/bin/env perl
#===============================================================================
#
#         FILE: www_curl_easy_experiment.pl
#
#        USAGE: ./www_curl_easy_experiment.pl  
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
#      CREATED: 02/18/2017 11:01:33 PM
#     REVISION: ---
#===============================================================================

use strict;
use warnings;
use utf8;

use WWW::Curl::Easy;

my $curl = WWW::Curl::Easy->new;

$curl->setopt( CURLOPT_HEADER, 1 );
$curl->setopt( CURLOPT_URL,    'http://lxer.com' );

# A filehandle, reference to a scalar or reference to a typeglob can be used here.
my $response_body;
$curl->setopt( CURLOPT_WRITEDATA, \$response_body );

# Starts the actual request
my $retcode = $curl->perform;

# Looking at the results...
if ( $retcode == 0 ) {
    print("Transfer went ok\n");
    my $response_code = $curl->getinfo(CURLINFO_HTTP_CODE);

    # judge result and next action based on $response_code
    print("Received response: $response_body\n");
}
else {
    # Error code, type of error, error message
    print(    "An error happened: $retcode "
            . $curl->strerror($retcode) . " "
            . $curl->errbuf
            . "\n" );
}

