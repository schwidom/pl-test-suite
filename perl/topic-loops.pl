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

my @array= ( "a a", "b c");

my @array_res1;

while( <@array>){ push @array_res1, $_}

test "a-a-b-c" == join "-", @array_res1;

foreach( @array){ push @array_res1, $_}

test "a a-b c" == join "-", @array_res1;

checkComplainAndAdjustExpected 2;

my @array=@testdata::array;

test "4-5-6-7" eq join "-", @array;

foreach( @array) # substitute operations change the foreach array
{
 s/.*/99/ if( 5 == $_);
 s/.*/101/ if( 6 == $_);
}

test "4-99-101-7" eq join "-", @array;

checkComplainAndAdjustExpected 2;

println result()

