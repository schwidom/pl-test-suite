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

te.test( None == dbm_db.firstkey())

keysPut= []

for x in range( 1, 10): # 8bb46c596f2b47f8a36eae9da5bdbca9
 key= str( x)
 dbm_db[ key]= key # 387533fff7d649cf8d8689cbe9e81307
 keysPut.append( key)

keysCmp= []
key= dbm_db.firstkey()

try: 
 while not None == key:
  if not key == dbm_db[ key]: # 387533fff7d649cf8d8689cbe9e81307
   raise Exception( 'not key == dbm_db[ key]')
  keysCmp.append( key)
  key= dbm_db.nextkey( key)
except:
 te.test( False)

# print 'keys are unsorted: '+ str( keysCmp)

#keysPut.sort()
#keysCmp.sort()
keysCmp.sort( (lambda x, y : cmp( int( x), int( y)))) # sort strings of ints as ints 8bb46c596f2b47f8a36eae9da5bdbca9

te.test( keysPut == keysCmp)

te.checkComplainAndAdjustExpected( 2)

print te.result()

dbm_db.close()

# see also:

