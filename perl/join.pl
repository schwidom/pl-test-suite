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

test join( ':', qw/4 5 6 7/) eq '4:5:6:7';

test join( ':', qw/4 5 6 7/) eq join( ':', 4, 5, 6, 7);
test join( ':', qw/4 5 6 7/) eq join( ':', @{[4, 5, 6, 7]});
test join( ':', qw/4 5 6 7/) eq join( ':', @testdata::array);
test join( ':', qw/4 5 6 7/) eq join( ':', @$testdata::array_ref);

# test join( ':', qw/4 5 6 7/) eq join( ':', %testdata::hash); # undefined
# test join( ':', qw/4 5 6 7/) eq join( ':', %$testdata::hash_ref); # undefined


test join( ':', qw/3 4 5 6 7 4 5 6 7 8/) eq join( ':', 3, @testdata::array, @testdata::array, 8);

checkComplainAndAdjustExpected 6;

println result()

