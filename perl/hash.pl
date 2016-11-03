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

my %hash= %testdata::hash; # copy

test %hash eq %{{4, 5, 6, 7}};
test %hash eq %{{4 => 5, 6 => 7}};
test %hash eq %{{4, 5 => 6, 7}}; # prima
test 5 == %{{4, 5, 6, 7}}{4};
test 5 == @{{4, 5, 6, 7}}{4}; # ?
test 5 == ${{4, 5, 6, 7}}{4}; # ?

checkComplainAndAdjustExpected 6;

test 5 == $hash{ 4};

$hash{99} = 101;

test 101 == $hash{ 99};
test not defined $testdata::hash{ 99};

delete $hash{ 99};

test not defined $hash{ 99};

checkComplainAndAdjustExpected 4;

println result()

# see also: hash.pl, keys.pl, values.pl

