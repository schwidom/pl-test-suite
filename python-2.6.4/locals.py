#!/usr/bin/python
# -*- coding: utf-8 -*-
# vi:encoding=utf-8

from TestEnv import TestEnv

te= TestEnv()

te.checkComplainAndAdjustExpected( 0)

te.test( not locals().has_key( 'a'))
te.test( not globals().has_key( 'a'))

a=3

te.test( locals().has_key( 'a'))
te.test( globals().has_key( 'a'))

te.test( 3==locals()['a'])
te.test( 3==globals()['a'])

globals()['a']=4

te.test( 4==locals()['a'])
te.test( 4==globals()['a'])

locals()['a']=5

te.test( 5==locals()['a'])
te.test( 5==globals()['a'])

te.test( not locals().has_key( 'f'))
te.test( not globals().has_key( 'f'))

def f():
 a=7
 te.test( 7==locals()['a'])
 te.test( 5==globals()['a'])
 te.test( not locals()==globals())


te.test( locals().has_key( 'f'))
te.test( globals().has_key( 'f'))

te.checkComplainAndAdjustExpected( 14)

te.test( locals()==globals())

f()

te.checkComplainAndAdjustExpected( 4)

print te.result()
