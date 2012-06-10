#!/usr/bin/python
# -*- coding: utf-8 -*-
# vi:encoding=utf-8

from TestEnv import TestEnv

te= TestEnv()

te.checkComplainAndAdjustExpected( 0)


te.test( "- a -" == "- %s -" % 'a')
te.test( "- 2 -" == "- %d -" % 2)

te.test( "- {'a': 'b'} -" == "- %s -" % {'a': 'b'})
te.test( "- b -" == "- %(a)s -" % {'a': 'b'})

try:
 "- %(c)s -" % {'a': 'b'}
 te.test( False)
except KeyError:
 te.test( True)
 
te.test( "011" == "%03x" % 0x11)
te.test( hex( 17) == "0x%x" % 0x11)
te.test( oct( 17) == "0%o" % 021)

te.checkComplainAndAdjustExpected( 8)

# see also: hex.py, oct.py, topic-format-string.py, 

print te.result()
