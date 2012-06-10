#!/usr/bin/python
# -*- coding: utf-8 -*-
# vi:encoding=utf-8

from TestEnv import TestEnv

import sys

te= TestEnv()

te.checkComplainAndAdjustExpected( 0)

class MyException (Exception):

 def __init__( self, value):
  self.value= value
 
 def __str__( self):
  return "value of MyException is "+ self.value

try:
 raise MyException( "hi")
 te.test( False)
except MyException:
 te.test( isinstance( sys.exc_info()[ 1], MyException))
 te.test( "hi" == sys.exc_info()[ 1].value)

try:
 raise MyException( "hi")
 te.test( False)
except MyException, e:
 te.test( "hi" == e.value)
 te.test( isinstance( e, MyException))
 te.test( "value of MyException is hi" == str( e))

te.checkComplainAndAdjustExpected( 5)

print te.result()
