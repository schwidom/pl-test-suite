#!/usr/bin/python
# -*- coding: utf-8 -*-
# vi:encoding=utf-8

from TestEnv import TestEnv

te= TestEnv()

te.checkComplainAndAdjustExpected( 0)

class A:
 pass

a=A()

te.test( ( '<__main__.A instance at 0x%x>' % id( a)) == repr( a))

A.__name__='B'

te.test( ( '<__main__.B instance at 0x%x>' % id( a)) == repr( a))

class C( object):
 pass

c=C()

te.test( ( '<__main__.C object at 0x%x>' % id( c)) == repr( c))

C.__name__='D'

te.test( ( '<__main__.D object at 0x%x>' % id( c)) == repr( c))

te.checkComplainAndAdjustExpected( 4)

# see also: 

print te.result()
