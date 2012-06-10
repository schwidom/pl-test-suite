#!/usr/bin/perl

package current_test;

use strict;
use warnings;
use testenv;

sub println { testenv::println @_}
sub test { testenv::test @_}
sub checkComplainAndAdjustExpected { testenv::checkComplainAndAdjustExpected @_}
sub result { testenv::result @_}

use testdata ;

checkComplainAndAdjustExpected 0;

my %keys= (4 =>1, 6 => 1);
my %values= (5 => 1, 7 => 1);

my $key;
my $value;

while( ($key, $value) = each %testdata::hash)
{
 test delete $keys{ $key};
 test delete $values{ $value};
}

($key, $value) = each %testdata::hash;
test $value == $testdata::hash{ $key};

checkComplainAndAdjustExpected 5;

println result()

