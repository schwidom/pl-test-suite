#!/usr/bin/python
# -*- coding: utf-8 -*-
# vi:encoding=utf-8

from TestEnv import TestEnv

te= TestEnv()

te.checkComplainAndAdjustExpected( 0)

def f( self):
 return self

te.test( 1==f( 1))

class A:
 pass

A.f= f

a=A()

te.test( a==a.f())

te.test( f==a.f.im_func)
te.test( a==a.f.im_self)
te.test( A==a.f.im_class)


def g():
 return 1

A.g= g

try:
 A.g()
 te.test( False)
except TypeError:
 te.test( True)

te.test( 1==A.__dict__[ 'g']())

te.checkComplainAndAdjustExpected( 7)

print te.result()
