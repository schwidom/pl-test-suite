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

{
my ($a, $b, $c) = (1, 2, 3);

test 1 == $a;
test 2 == $b;
test 3 == $c;
}

{
my ($a, $b, $c) = @testdata::array;

test 4 == $a;
test 5 == $b;
test 6 == $c;
}

{
my ($a, $b, $c, $d) = @testdata::array;

test 7 == $d;
}

{
my ($a, $b, @c) = @testdata::array;

test 6== $c[0 ];
test 7== $c[1 ];
}

checkComplainAndAdjustExpected 9;

println result()

