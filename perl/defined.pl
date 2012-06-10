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

test not 0;
test defined 0;

test not "";
test defined "";

test not undef;
test not defined undef;

checkComplainAndAdjustExpected 6;

# see also exists.pl, defined.pl

println result()

