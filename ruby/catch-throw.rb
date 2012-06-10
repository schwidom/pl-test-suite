#!/usr/bin/ruby

load "TestEnv.rb"

te= TestEnv.new()

te.checkComplainAndAdjustExpected( 0)

te.test( catch( :ex){ throw :ex, true})

te.checkComplainAndAdjustExpected( 1)

print( te.result+ "\n")
