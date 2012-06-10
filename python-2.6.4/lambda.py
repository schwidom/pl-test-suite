#!/usr/bin/python
# -*- coding: utf-8 -*-
# vi:encoding=utf-8

from TestEnv import TestEnv

te= TestEnv()

te.checkComplainAndAdjustExpected( 0)

te.test( 1==(lambda x: x)(1))
te.test( 3==(lambda x, y: x+ y)(1, 2))

te.checkComplainAndAdjustExpected( 2)

print te.result()
