#!/usr/bin/python
# -*- coding: utf-8 -*-
# vi:encoding=utf-8

from TestEnv import TestEnv

te= TestEnv()

te.checkComplainAndAdjustExpected( 0)

te.test( 0==reduce( None, [], 0))
te.test( 0==reduce( (lambda x, y: x+y), [], 0))
te.test( 1==reduce( None, [ 1]))
try:
 te.test( 1==reduce( None, [ 1]), 0)
 te.test( False)
except TypeError: # TypeError: 'NoneType' object is not callable
 te.test( True)
te.test( 1==reduce( (lambda x, y: x+y), [ 1], 0))
te.test( (1+ 1)==reduce( (lambda x, y: x+y), [ 1], 1))
te.test( 1==reduce( (lambda x, y: x+y), [ 1]))
te.test( (1+ 2)==reduce( (lambda x, y: x+y), [ 1, 2]))
te.test( (1+ 2+ 3)==reduce( (lambda x, y: x+y), [ 1, 2, 3]))

te.checkComplainAndAdjustExpected( 9)

# reducing of different types:

te.test( ( 1+ 2+ 3)==reduce( (lambda x, y: x+ int( y)), [ 1, "2", "3"]))
te.test( ( 1+ 1)==reduce( (lambda x, y: x+ int( y)), [ "1"], 1))


te.checkComplainAndAdjustExpected( 2)

print te.result()
