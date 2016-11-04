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

#push my @array, @testdata::array; # copy
my @array= @testdata::array; # copy

test 3 == @{[4, 5, 6]}; 
test 4 == @{[7, 5, 6, 8]};
test 4 == scalar @{[7, 5, 6, 8]};

test 6 == @{[4, 5, 6]}[2];
test 6 == %{[4, 5, 6]}[2]; # ?
test 6 == ${[4, 5, 6]}[2]; # ?

test @{[1, 2, 3]} == @{[1, 2, 3]};
test @{[1, 2, 3]} == @{[1, 2, 4]}; # dont compare arrays in this way (== leads to scalar context)

# test @{[1, 2, 3]} ~~ @{[1, 2, 3]}; # Smartmatch is experimental
# test not @{[1, 2, 3]} ~~ @{[1, 2, 4]}; # Smartmatch is experimental

test \@{[1, 2, 3]} != \@{[1, 2, 3]};
test \@{[1, 2, 3]} != \@{[1, 2, 4]}; 

test @array == @testdata::array; # is no evidence for the same objects
test @array == @{[4, 5, 6, 7]}; # is no evidence for the same objects

test 3 == $#array;
test 4 == $array[0 ];

push @array, 99;

test 4 == $#array;
test 4 == $array[0 ];

test 99 == $array[-1];
test 7 == $testdata::array[-1]; # objects differ

checkComplainAndAdjustExpected 18;

println result()

