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
test 1;
checkComplainAndAdjustExpected 1;

println result()

