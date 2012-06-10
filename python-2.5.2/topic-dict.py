#!/usr/bin/python
# -*- coding: utf-8 -*-
# vi:encoding=utf-8

from TestEnv import TestEnv

te= TestEnv()

te.checkComplainAndAdjustExpected( 0)

f= dict()
f[ 'c']= 'd'
d= { 'a' : 'b'}

e= dict( d)

te.test( e == d)

e.update( f)

te.test( e != d)
te.test( { 'a' : 'b', 'c': 'd'} == e)
te.test( { 'c': 'd', 'a' : 'b'} == e)

tmp= []

for i in e:
 tmp += [i]

tmp.sort()

te.test( [ 'a', 'c'] == tmp)

tmp=[]

for i, k in e.iteritems():
 tmp += [i]
 tmp += [k]

tmp.sort()

te.test( [ 'a', 'b', 'c', 'd'] == tmp)

tmp=[]
tmp2=dict()

for i in e.iteritems():
 tmp += [i]
 tmp2.update( [ i])

te.test( [ ('a', 'b'), ('c', 'd')] == tmp)
te.test( e== dict( tmp))
te.test( e== tmp2)

te.checkComplainAndAdjustExpected( 9)

print te.result()
