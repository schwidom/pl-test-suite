#!/usr/bin/python
# -*- coding: utf-8 -*-
# vi:encoding=utf-8

from TestEnv import TestEnv

te= TestEnv()

te.checkComplainAndAdjustExpected( 0)

class A:
 def __init__( self):
  A_self=self
  class B:
   def getOuter( self):
    return A_self
  A_self.B=B

a1=A()
b11=a1.B()
b12=a1.B()

a2=A()
b21=a2.B()
b22=a2.B()

te.test( a1== b11.getOuter())
te.test( a1== b12.getOuter())

te.test( a2== b21.getOuter())
te.test( a2== b22.getOuter())

te.checkComplainAndAdjustExpected( 4)

# see also: 

print te.result()
