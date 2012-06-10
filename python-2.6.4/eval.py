#!/usr/bin/python
# -*- coding: utf-8 -*-
# vi:encoding=utf-8

from TestEnv import TestEnv

te= TestEnv()

te.checkComplainAndAdjustExpected( 0)

te.test( 5==eval( '2+3'))

a=7

te.test( 9==eval( '2+a'))

def f(): return 1

te.test( 1==eval( 'f()'))
te.test( 1==eval( 'f')())

g={ 'a': 3} # globals

te.test( 5==eval( '2+a', g))

l={ 'a': 5} # locals

te.test( 7==eval( '2+a', g, l))

try:
 eval( '2+a', {})
 te.test( False)
except NameError:
 te.test( True)
 pass


te.checkComplainAndAdjustExpected( 7)

print te.result()
