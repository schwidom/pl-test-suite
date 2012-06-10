#!/usr/bin/ruby

load "TestEnv.rb"

te= TestEnv.new()

te.checkComplainAndAdjustExpected( 0)

print( "Hello World\n")

print( te.result+ "\n")
