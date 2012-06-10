#!/usr/bin/python
# -*- coding: utf-8 -*-
# vi:encoding=utf-8

from TestEnv import TestEnv

te= TestEnv()

te.checkComplainAndAdjustExpected( 0)

class Z:
 pass

class A1( Z):
 pass

class A2( Z):
 pass

class B( A1, A2):
 pass

class C:
 pass

te.test( issubclass( B, A1))
te.test( issubclass( B, A2))
te.test( not issubclass( C, A1))
te.test( issubclass( A1, A1))
te.test( not issubclass( A1, A2))
te.test( issubclass( B, Z))

te.checkComplainAndAdjustExpected( 6)

print te.result()
