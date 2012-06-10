
load( 'testenv.js')

te= testenv()

te.checkComplainAndAdjustExpected( 0)

a= new Array( 1, 2, 3)

te.test( 1 == a[0])
te.test( 2 == a[1])
te.test( 3 == a[2])

te.checkComplainAndAdjustExpected( 3)

for( i in a)
{
 te.test( -1 < i && i < 3)
}

te.checkComplainAndAdjustExpected( 3)

te.test( 3==a.length)
te.test( 101==new Array( 101).length)

te.checkComplainAndAdjustExpected( 2)

// te.test( new Array( 1, 2, 3) == a)
te.test( a == a)
te.test( a != a.concat( new Array()))
te.test( a != new Array( 1, 2, 3))
te.test( a.join( ' ') == a.concat( new Array()).join( ' '))
te.test( a.join( ' ') == new Array( 1, 2, 3).join( ' '))

te.checkComplainAndAdjustExpected( 5)

aa= new Object()

aa[ 'a']='z'

for( i in aa)
{
 te.test( 'a' == i )
 te.test( 'z' == aa[ i] )
}

te.test( 'z' == aa.a)

te.checkComplainAndAdjustExpected( 3)

print( te.result())

