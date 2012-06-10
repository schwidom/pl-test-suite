#!/usr/bin/ruby

load "TestEnv.rb"

te= TestEnv.new()

te.checkComplainAndAdjustExpected( 0)

# this is a comment


=begin
 this is a comment
=end

te.checkComplainAndAdjustExpected( 0)

print( te.result+ "\n")
