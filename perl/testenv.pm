package testenv;

use strict;

my $countOk= 0;
my $countFail= 0;
my $countLatest= 0;

sub println
{
 print @_;
 print "\n"
}

sub test
{

 my $ox_b= shift @_; # b kollidiert, siehe perlvar, ox_ ist sicher

 shift @_ && die "test: more than 1 parameter, exiting";

 if( $ox_b)
 {
  $countOk+= 1;
 }
 else
 {
  $countFail+= 1;
  println "FAIL"
 }

}

sub checkComplainAndAdjustExpected
{
 
 my $ox_count= shift @_;

 my $countTests= $countOk + $countFail;
 my $countTestsLocal= $countTests - $countLatest;

 $countLatest= $countTests;

 if( $ox_count == $countTestsLocal)
 {
  return 1
 }
 else
 {
  println "Expected Test Count (from last checkpoint to here) doesn't match: \$countTestsLocal: $countTestsLocal \$count: $ox_count";
  return 0
 }
 
}

sub result
{
 "tests: ok: $countOk fail: $countFail \$countLatest: $countLatest\n"
}

1

