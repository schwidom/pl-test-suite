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

my $a= 0;
my @a= ( 1, 3);
my %a= ( 1 => 15, 3 => 17);

test 0 == $a;

test 1 == $a[0];
test 3 == $a[1];

test 15 == $a{ 1};
test 17 == $a{ 3};

test 15 == $a{ $a[0]};
test 17 == $a{ $a[1]};

test 15 == $a{ $a[ $a]};

checkComplainAndAdjustExpected 8;

test "REF" eq ref $testdata::scalar_ref_to_1;
test "REF" eq ref \{};

test "SCALAR" eq ref \$testdata::scalar_to_1;
test "SCALAR" eq ref \"ox";
test "SCALAR" eq ref \9;

test "ARRAY" eq ref [];
test "ARRAY" eq ref $testdata::array_ref;
test "ARRAY" eq ref \@testdata::array;
test not ref @testdata::array;

test "HASH" eq ref {};
test "HASH" eq ref $testdata::hash_ref;
test "HASH" eq ref \%testdata::hash;
test not ref %testdata::hash;

test "CODE" eq ref \&test;

checkComplainAndAdjustExpected 14;

println result()

