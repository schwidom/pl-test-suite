#!/usr/bin/python
# -*- coding: utf-8 -*-
# vi:encoding=utf-8

class TestEnv:

 def __init__( self):

  self. countOk= 0
  self. countFail= 0
  self. countLatest= 0
  self. countRelativeExpected= 0


 def test ( self, b):
  
  if( b):
   
   self. countOk += 1

  else:
   
   self. countFail += 1

   print "test failed"
   import traceback
   traceback.print_stack()
 
 def checkComplainAndAdjustExpected( self, count):

  countTests= self. countOk + self. countFail
  countTestsLocal= countTests - self. countLatest

  self. countLatest= countTests

  if count == countTestsLocal:
   
   return True
  
  else:

   print "Expected Test Count (from last checkpoint to here) doesn't match: countTestsLocal:" + str( countTestsLocal) + " count: "+ str( count)
   import traceback
   traceback.print_stack()

   return False

 def result( self):
  
  return "tests: ok: "+ str( self. countOk)+ " fail: "+ str( self. countFail)+ " countLatest: "+ str( self. countLatest)



