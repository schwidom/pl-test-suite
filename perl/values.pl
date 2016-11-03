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

test "57" == join "", sort values %testdata::hash;
test "57" == join "", sort values %{$testdata::hash_ref};

checkComplainAndAdjustExpected 2;

# see also keys.pl, values.pl

println result()

# see also: hash.pl, keys.pl, values.pl

