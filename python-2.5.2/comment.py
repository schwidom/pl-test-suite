#!/usr/bin/python
# -*- coding: utf-8 -*-
# vi:encoding=utf-8

from TestEnv import TestEnv

te= TestEnv()

te.checkComplainAndAdjustExpected( 0)

# this is a comment

"""
 this is a comment
"""

te.checkComplainAndAdjustExpected( 0)

print te.result()
