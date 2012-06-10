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


test( 3 == $#{@$testdata::array_ref});

test( 3 == $#testdata::array);

test( $testdata::array_ref == \@$testdata::array_ref);

test( @testdata::array == @{\@testdata::array});

checkComplainAndAdjustExpected 4;

test 1 == $#{[keys %testdata::hash]};
test 3 == $#{[%testdata::hash]};

checkComplainAndAdjustExpected 2;

println result()

