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

my $empty= "";
my $open_bracket="[";

test not $empty =~ m/\[/;
test $open_bracket =~ m/\[/;

checkComplainAndAdjustExpected 2;

my ($a, $b) = split( " ", "a b");

if( my $ca= "a" =~ m/$a/ or my $cb= "b" =~ m/$b/) # short circuit
{
 test $ca;
 test not $cb;
}
else{ test 0}

if( my $ca= "x" =~ m/$a/ or my $cb= "b" =~ m/$b/) 
{
 test not $ca;
 test $cb;
}
else{ test 0}

unless( my $ca= "x" =~ m/$a/ and my $cb= "b" =~ m/$b/) # short circuit
{
 test not $ca;
 test not $cb;
}
else{ test 0}

if( my $ca= "a" =~ m/$a/ and my $cb= "b" =~ m/$b/) 
{
 test $ca;
 test $cb;
}
else{ test 0}

checkComplainAndAdjustExpected 8;

println result()

