#!/usr/bin/python
# -*- coding: utf-8 -*-
# vi:encoding=utf-8

from TestEnv import TestEnv

te= TestEnv()

te.checkComplainAndAdjustExpected( 0)

te.test( "ab" == "ab")
te.test( "ab" == "a" + "b")
te.test( "ab" == str( "ab"))
te.test( "101" == str( 101))
te.test( "101.0" == str( 101.))

class C:
 def __repr__( self):
  return "aadebdf7-9cbb-494b-a4ea-496aa32c5702"

te.test( "aadebdf7-9cbb-494b-a4ea-496aa32c5702" == str( C()))
te.test( "aadebdf7-9cbb-494b-a4ea-496aa32c5702" == repr( C()))
te.test( not( "aadebdf7-9cbb-494b-a4ea-496aa32c5702" == C()))


te.checkComplainAndAdjustExpected( 8)

print te.result()
