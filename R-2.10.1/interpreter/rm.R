
source( 'testEnv.R')

te = TestEnv()

te$checkComplainAndAdjustExpected( 0)

te$test( ! exists( 'a'))
te$test( ! exists( 'b'))

a= 1
b= 2

te$test( exists( 'a'))
te$test( exists( 'b'))

te$test( 1== get( 'a'))
te$test( 2== get( 'b'))

rm( a, b)

te$test( ! exists( 'a'))
te$test( ! exists( 'b'))

te$checkComplainAndAdjustExpected( 8)

# see also: rm.R, exists.R, get.R

print( te$result())

