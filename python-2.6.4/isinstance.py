#!/usr/bin/python
# -*- coding: utf-8 -*-
# vi:encoding=utf-8

import sys
from TestEnv import TestEnv

te= TestEnv()

te.checkComplainAndAdjustExpected( 0)

te.test( isinstance( str(), str))
te.test( isinstance( "", str))
te.test( isinstance( '', str))
te.test( isinstance( int(), int))
te.test( isinstance( 1, int))
te.test( isinstance( float(), float))
te.test( isinstance( 1., float))
te.test( isinstance( long(), long))
te.test( isinstance( 1L, long))
te.test( isinstance( complex(), complex))
te.test( isinstance( 3+7j, complex))

te.test( isinstance( dict(), dict))
te.test( isinstance( {}, dict))
te.test( isinstance( list(), list))
te.test( isinstance( [], list))
te.test( isinstance( tuple(), tuple))
te.test( isinstance( (), tuple))
te.test( not isinstance( (1), tuple))
te.test( isinstance( (1), int))
te.test( isinstance( (1,), tuple))
te.test( isinstance( (1,2), tuple))

te.test( isinstance( set(), set))

te.test( isinstance( sys.stdin, file))

te.test( 'NoneType' == type( None).__name__)
NoneType= type( None)
te.test( isinstance( None, NoneType))
te.test( isinstance( NoneType, type))

te.test( 'module' == type( __builtins__).__name__)
module= type( __builtins__)
te.test( isinstance( __builtins__, module))
te.test( isinstance( module, type))

te.checkComplainAndAdjustExpected( 29)

def f():
 pass

te.test( 'function' == type( f).__name__)
function= type( f)

def g():
 pass


te.test( isinstance( g, function))
te.test( isinstance( function, type))

te.test( isinstance( (lambda x: x), function))

class A:
 pass

te.test( 'classobj' == type( A).__name__)
classobj= type(A)

class B:
 pass

class C( B):
 pass

te.test( isinstance( B, classobj))
te.test( isinstance( C, classobj))
te.test( isinstance( classobj, type))

te.test( isinstance( super( object, A), super))

c=C()

te.test( isinstance( c, C))
te.test( isinstance( c, B))

te.test( isinstance( type, type))

te.checkComplainAndAdjustExpected( 12)

objects= [ str(), "", '', int(), 1, float(), 1., long(), 1L, complex(), 3+7j, dict(), {}, list(), [], tuple(), (), (1), (1,), (1,2), g, C, c, function, classobj, type, None, NoneType]

for i in objects:
 te.test( isinstance( i, object))

te.checkComplainAndAdjustExpected( len( objects))

te.test( isinstance( 1, (str, int)))
te.test( isinstance( '', (str, int)))

te.checkComplainAndAdjustExpected( 2)

print te.result()
