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


sub listHash {

 my $hashref = shift ;

 # print ref $hashref, "\n";

 if( "HASH" ne ref $hashref ) { die 'listHash: "HASH" ne ref $hashref' };

 my %hash = %{$hashref};

 # print( 'hashref: ', $hashref, "\n");
 # print( 'hashref: ', %{$hashref}, "\n");

 # my @hashKeys = keys $hashref; # keys on reference is experimental # liefert aber mehr Werte
 my @hashKeys = keys %hash;

 while( my $key = shift @hashKeys) {

  print( 'key: ', $key, "\n");
  print( 'value: ', $hash{ $key }, "\n");
 }

}

# print( @{{ 1 => 2, 3 => 4 }}{1}, "\n");

# listHash( %{{ 1 => 2, 3 => 4 }});
# listHash( { 1 => 2, 3 => 4 }); # hashref

# hinweis: die folgenden aufrufe funktioniern nicht immer !
# listHash( \%::);
# listHash( \%main::);
# listHash( \%current_test::); # liefert bereits hier auch ox_c, ox_b, ox_e, ox_g, ox_f

checkComplainAndAdjustExpected 0;

my $ox_a=1;
my $ox_b=0;
local $current_test::ox_b= 1;
local $current_test::ox_c= 1;
local $main::ox_d=1;
our $ox_e=1;
our $ox_f=1;

test 1 == $ox_a;
test 0 == $ox_b;
test 1 == $current_test::ox_b;
test 1 == $current_test::ox_c;
test 1 == $main::ox_d;
test 1 == $ox_e;
test 1 == $current_test::ox_e;

{

 test 1 == $ox_a;
 test 0 == $ox_b;
 test 1 == $current_test::ox_b;
 test 1 == $current_test::ox_c;
 test 1 == $main::ox_d;
 test 1 == $ox_e;
 test 1 == $current_test::ox_e;

 my $ox_a=2;
 my $ox_b=1;
 local $current_test::ox_b= 2;
 local $current_test::ox_c= 2;
 local $main::ox_d=2;

 $ox_e=2;
 local $ox_f=2;

 our $ox_g=2;

 test 2 == $ox_a;
 test 1 == $ox_b;
 test 2 == $current_test::ox_b;
 test 2 == $current_test::ox_c;
 test 2 == $main::ox_d;
 test 2 == $ox_e;
 test 2 == $current_test::ox_e;
 test 2 == $ox_f;
 test 2 == $current_test::ox_f;
 test 2 == $ox_g;
 test 2 == $current_test::ox_g;
 

}


test 1 == $ox_a;
test 0 == $ox_b;
test 1 == $current_test::ox_b;
test 1 == $current_test::ox_c;
test 1 == $main::ox_d;
test 2 == $ox_e;
test 2 == $current_test::ox_e;
test 1 == $ox_f;
test 1 == $current_test::ox_f;
# test 2 == $ox_g; # Global symbol "$ox_g" requires explicit package name
test 2 == $current_test::ox_g;


checkComplainAndAdjustExpected 35;

println result()

