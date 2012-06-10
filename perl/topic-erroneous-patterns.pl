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

my $a=1 if( undef); # not defined, see man perlsyn
test not $a;

my $a=1 if( 1); # not defined, see man perlsyn
test $a;



checkComplainAndAdjustExpected 2;

println result()

