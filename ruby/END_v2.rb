#!/usr/bin/ruby


$te.checkComplainAndAdjustExpected( 0)
b= 2

$te.test( 1 == $a)
$te.test( 2 == b)


END {

 $te.test( 1 == $a)
 $te.test( 2 == b)
 $te.test( 3 == $c)

 $te.checkComplainAndAdjustExpected( 6)

 print( $te.result+ "\n")

}

$te.test( 1 == $a)
$te.test( 2 == b)

BEGIN{
 load "TestEnv.rb"
 $te= TestEnv.new()

 $te.checkComplainAndAdjustExpected( 0)

 $a=1 # global

 $te.test( 1 == $a)
}

$te.test( 1 == $a)
$te.test( 2 == b)

END{
 $te.checkComplainAndAdjustExpected( 0)

 $c=3

 $te.test( 1 == $a)
 $te.test( 2 == b)
 $te.test( 3 == $c)
}

$te.test( 1 == $a)
$te.test( 2 == b)
$te.test( nil == $c)

BEGIN {

 $te.test( 1 == $a)

 begin
  b
 rescue
  $te.test( true)
 else
  $te.test( false)
 end


 $te.test( nil == $c)
 $te.checkComplainAndAdjustExpected( 4)
}

$te.test( 1 == $a)
$te.test( 2 == b)

$te.checkComplainAndAdjustExpected( 11)

#te.checkComplainAndAdjustExpected( 0)

#te.test( true)

#te.checkComplainAndAdjustExpected( 1)

