#!/usr/bin/python
# -*- coding: utf-8 -*-
# vi:encoding=utf-8

from TestEnv import TestEnv

te= TestEnv()

te.checkComplainAndAdjustExpected( 0)

te.test( oct( 17) == "021")

te.checkComplainAndAdjustExpected( 1)

# see also: hex.py, oct.py, topic-format-string.py, 

print te.result()
