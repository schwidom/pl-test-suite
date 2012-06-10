#!/usr/bin/perl

package current_test;

use strict;
use testenv;

sub println { testenv::println @_}
sub test { testenv::test @_}
sub checkComplainAndAdjustExpected { testenv::checkComplainAndAdjustExpected @_}
sub result { testenv::result @_}

checkComplainAndAdjustExpected 0;

# this is a comment

=begin
 this is a comment too
=cut

checkComplainAndAdjustExpected 0;

println result()

