#!/usr/bin/python
# -*- coding: utf-8 -*-
# vi:encoding=utf-8

import os
import gdbm
from TestEnv import TestEnv

if not os.path.isdir( 'work'):
 os.mkdir( 'work')

try:
 os.remove( 'work/dbm_db')
except:
 pass

dbm_db= gdbm.open( 'work/dbm_db', 'c')

te= TestEnv()

te.checkComplainAndAdjustExpected( 0)

te.test( True)

te.checkComplainAndAdjustExpected( 1)

print te.result()

dbm_db.close()

# see also:

