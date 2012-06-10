#!/usr/bin/perl

# from template tutorial-schema/array.txt

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

# creation

# type identification

test "ARRAY" eq ref [];
test "ARRAY" eq ref scalar [];
test "ARRAY" eq ref \@{[]};

# length

test 4 == @testdata::array;
test 4 == @$testdata::array_ref;

test 3 == $#testdata::array;
test 3 == $#$testdata::array_ref;

# indexing

test 4 == $testdata::array[0 ];
test 7 == $testdata::array[-1 ];

checkComplainAndAdjustExpected 9;

# copying

my @array;
my $i;
my $a1;
my $a2;

@array= @testdata::array; # copy
undef @array;

# comparing

@array= @testdata::array; # copy

sub cmp_array
{
 $a1=shift;
 $a2=shift;

 return undef if( $#$a1 != $#$a2);

 foreach $i (0 .. $#$a1)
 {
  if( $$a1[ $i] != $$a2[ $i]) { return undef}
 }

 return 1;
}

test cmp_array [1, 2], [1, 2];
test ! cmp_array [1, 2], [1, 3];

test cmp_array \@testdata::array, \@array;

undef @array;

checkComplainAndAdjustExpected 3;

# inserting

@array= @testdata::array; # copy
unshift @array, 98, 99;

test cmp_array [98, 99, 4, 5, 6, 7], \@array;

undef @array;

@array= @testdata::array; # copy

splice @array, 0, 0, 98, 99;

test cmp_array [98, 99, 4, 5, 6, 7], \@array;

undef @array;

checkComplainAndAdjustExpected 2;

# appending

@array= @testdata::array; # copy
push @array, 98, 99;

test cmp_array [4, 5, 6, 7, 98, 99], \@array;

undef @array;


@array= @testdata::array; # copy
splice @array, @array, 0, 98, 99;

test cmp_array [4, 5, 6, 7, 98, 99], \@array;

undef @array;

checkComplainAndAdjustExpected 2;

# replacing

@array= @testdata::array; # copy
$array[ 1]= 88;

test cmp_array [4, 88, 6, 7], \@array;

splice @array, 1, 2, 98, 99, 100;

test cmp_array [4, 98, 99, 100, 7], \@array;

undef @array;

checkComplainAndAdjustExpected 2;

# removing

@array= @testdata::array; # copy

test 7 == pop @array;

test cmp_array [4, 5, 6], \@array;

undef @array;

@array= @testdata::array; # copy

test 4 == shift @array;

test cmp_array [5, 6, 7], \@array;

undef @array;

@array= @testdata::array; # copy

test 6 == splice @array, 1, 2;

test cmp_array [4, 7], \@array;

undef @array;

checkComplainAndAdjustExpected 6;

# sorting
# sort


# join, map

checkComplainAndAdjustExpected 0;

println result()

