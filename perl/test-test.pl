#!/usr/bin/perl

package current_test;

use strict;
use testenv;

sub println { testenv::println @_}
sub test { testenv::test @_}
sub checkComplainAndAdjustExpected { testenv::checkComplainAndAdjustExpected @_}
sub result { testenv::result @_}

checkComplainAndAdjustExpected 0;
test 1;
test 1;
checkComplainAndAdjustExpected 2;
test 1;
test 1;
test 1;
checkComplainAndAdjustExpected 3;

println result()

