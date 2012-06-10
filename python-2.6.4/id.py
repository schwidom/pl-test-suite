#!/usr/bin/python
# -*- coding: utf-8 -*-
# vi:encoding=utf-8

from TestEnv import TestEnv

te= TestEnv()

te.checkComplainAndAdjustExpected( 0)

o1= object()
o2= object()

#te.test( ( '<object object at 0x%08x>' % id( o1)) == repr( o1))
te.test( ( '<object object at 0x%x>' % id( o1)) == repr( o1))

te.test( id( o1) == id( o1))
te.test( id( o1) != id( o2))

te.checkComplainAndAdjustExpected( 3)

s1="string1"
s2="string1"

te.test( id( s1) == id( s2))
te.test( id( s1) == id( "string1"))

te.checkComplainAndAdjustExpected( 2)

class A:
 def __repr__( self):
  return ""

a1= A()
a2= A()

te.test( '' == repr( a1))
te.test( id( a1) == id( a1))
te.test( id( a1) != id( a2))

te.checkComplainAndAdjustExpected( 3)

print te.result()
