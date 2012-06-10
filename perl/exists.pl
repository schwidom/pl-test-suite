#!/usr/bin/perl

package current_test;

use strict;
use testenv;

sub println { testenv::println @_}
sub test { testenv::test @_}
sub checkComplainAndAdjustExpected { testenv::checkComplainAndAdjustExpected @_}
sub result { testenv::result @_}

use testdata ;

checkComplainAndAdjustExpected 0;

my @array = ( undef);

test exists $array[0 ];
test not defined $array[0 ];
test not $array[0 ];

my %hash = ( "k" => undef);

test exists $hash{ "k"};
test not defined $hash{ "k"};
test not $hash{ "k"};

=begin # won't work
foreach( @array)
{
 test exists $_;
}
=cut

checkComplainAndAdjustExpected 6;

# see also defined.pl, exists.pl

println result()

