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


test "a" =~ m/a/;

my $regex="a";

test "a" =~ m/$regex/;

my $regex='a(b)c'; # singe quotes needed for later \ usage

test "xabcx" =~ m/$regex/;
test "b" eq $1;
test "abc" eq $&;


checkComplainAndAdjustExpected 5;

println result()

