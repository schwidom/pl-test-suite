#!/usr/bin/ruby

load "TestEnv.rb"

te= TestEnv.new()

te.checkComplainAndAdjustExpected( 0)

te.test( true)
te.test( true)

te.checkComplainAndAdjustExpected( 2)

te.test( true)
te.test( true)
te.test( true)

te.checkComplainAndAdjustExpected( 3)

print( te.result+ "\n")
