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

# comparision

test 1;
test !0;

test ! 1 == 0;
test 1 != 0;
test 1 ne 0;

test 1 == 1;
test 1 eq 1;

test 2 == 2;
test 2 == "2";
test 2 eq "2";

test "23"=="23";

test "a";
test ! "";
# test 0=="";
# test 0=="a";

# test undef == "";
# test undef == 0;
test defined "";
test defined 0;


test ! undef;

test "2" != "3";
# test "a2" == "a3";
# test "" == "ab3";
test ! ( "ab2" eq "ab3");
test not "ab2" eq "ab3";
test "ab2" ne "ab3";
test "ab2" eq "ab2";

checkComplainAndAdjustExpected 21;

# concatenation

test "ab" eq "a" . "b";
test "ab" eq 'a' . 'b';

checkComplainAndAdjustExpected 2;

test -1 == (2 cmp 4);
test  0 == (3 cmp 3);
test  1 == (4 cmp 2);

checkComplainAndAdjustExpected 3;

# see also defined.pl, exists.pl, operators.pl

println result()

