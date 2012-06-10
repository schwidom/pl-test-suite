#!/usr/bin/python
# -*- coding: utf-8 -*-
# vi:encoding=utf-8

from TestEnv import TestEnv

te= TestEnv()

te.checkComplainAndAdjustExpected( 0)


class A(object):
 def f( self):
  te.test( True)
 
class B( A):
 def f( self):
  super( B, self).f()
  te.test( True)

B().f()

te.checkComplainAndAdjustExpected( 2)

class C:
 def f( self):
  te.test( True)
 
class D( C):
 def f( self):
  C.f( self)
  te.test( True)

D().f()

te.checkComplainAndAdjustExpected( 2)

print te.result()
