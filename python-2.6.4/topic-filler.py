#!/usr/bin/python
# -*- coding: utf-8 -*-
# vi:encoding=utf-8

from TestEnv import TestEnv

te= TestEnv()

te.checkComplainAndAdjustExpected( 0)

te.test( "000a" == "a".zfill( 4))
te.test( "a" == "a".zfill( 0))

te.test( "   a" == "a".rjust( 4))
te.test( "a" == "a".rjust( 0))

te.test( "a   " == "a".ljust( 4))
te.test( "a" == "a".ljust( 0))

te.checkComplainAndAdjustExpected( 6)

print te.result()
