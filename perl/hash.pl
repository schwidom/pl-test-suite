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

test 5 == $hash{ 4};

$hash{99} = 101;

test 101 == $hash{ 99};
test not defined $testdata::hash{ 99};

delete $hash{ 99};

test not defined $hash{ 99};

checkComplainAndAdjustExpected 5;

println result()

