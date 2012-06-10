#!/usr/bin/python
# -*- coding: utf-8 -*-
# vi:encoding=utf-8

from TestEnv import TestEnv

te= TestEnv()

te.checkComplainAndAdjustExpected( 0)

def f( a, b):
 te.test( True)
 return ( a, b)

te.test( (1, 2)==f(1, 2))
te.test( (1, 2)==f( b=2, a=1))

te.checkComplainAndAdjustExpected( 4)

te.test( (1, 2)==apply( f, (1, 2)))

te.test( (1, 2)==apply( f, (1, 2), dict()))
te.test( (1, 2)==apply( f, (1, 2), {}))

te.test( (1, 2)==apply( f, (1,), { 'b': 2}))
te.test( (1, 2)==apply( f, [1], { 'b': 2}))

te.test( (1, 2)==apply( f, [], { 'b': 2, 'a': 1}))

te.test( (1, 2)==f( *[1, 2], **{}))
te.test( (1, 2)==f( *[1], **{'b': 2}))
te.test( (1, 2)==f( *[], **{ 'b': 2, 'a': 1}))

te.checkComplainAndAdjustExpected( 18)

def g( *l, **kw):
 return f( *l, **kw)

te.test( (1, 2)==g(1, 2))
te.test( (1, 2)==g( b=2, a=1))

te.checkComplainAndAdjustExpected( 4)

print te.result()
