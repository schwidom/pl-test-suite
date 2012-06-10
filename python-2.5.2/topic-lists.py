#!/usr/bin/python
# -*- coding: utf-8 -*-
# vi:encoding=utf-8

from TestEnv import TestEnv

te= TestEnv()

te.checkComplainAndAdjustExpected( 0)

te.test( [1, 2, 3] == range( 1, 4))
te.test( [0, 2, 4] == range( 0, 5, 2))

te.test( 2 == [1, 2, 3][1])
te.test( 3 == [1, 2, 3][-1])
te.test( [1, 2, 3] == [1, 2, 3][0:3])
te.test( [2, 3] == [1, 2, 3][1:])
te.test( [1] == [1, 2, 3][:1])
te.test( [1, 2] == [1, 2, 3][:-1])

te.test( [1, 2, 3] == [ x for x in [1, 2, 3]])
te.test( [[1, 3], [1, 4], [2, 3], [2, 4]] == [[x,y] for x in [1, 2] for y in [3, 4]])
te.test( [[1, 3], [2, 4]] == [[x,y] for x in [1, 2] for y in [3, 4] if (x+2)==y])

te.checkComplainAndAdjustExpected( 11)

print te.result()
