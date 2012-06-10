#!/usr/bin/python
# -*- coding: utf-8 -*-
# vi:encoding=utf-8

from TestEnv import TestEnv

te= TestEnv()

te.checkComplainAndAdjustExpected( 0)

te.test( True)
te.test( True)

te.checkComplainAndAdjustExpected( 2)

te.test( True)
te.test( True)
te.test( True)

te.checkComplainAndAdjustExpected( 3)

print te.result()
