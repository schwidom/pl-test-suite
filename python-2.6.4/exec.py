#!/usr/bin/python
# -*- coding: utf-8 -*-
# vi:encoding=utf-8

from TestEnv import TestEnv

te= TestEnv()

te.checkComplainAndAdjustExpected( 0)

exec 'a=3'

te.test( 3==a)

g=dict()

exec 'a=4' in g

te.test( 4==g['a'])

g2=dict()

exec 'b=1+a' in g, g2

te.test( 5==g2['b'])

te.test( not g.has_key( 'b'))
te.test( not g2.has_key( 'a'))

te.checkComplainAndAdjustExpected( 5)

print te.result()
