
source( 'testEnv.R')

te = TestEnv()

te$checkComplainAndAdjustExpected( 0)

te$test( 0 == length( logical( 0)))
te$test( 0 == length( numeric( 0)))
te$test( 0 == length( double( 0)))
te$test( 0 == length( integer( 0)))
te$test( 0 == length( character( 0)))

te$test( 1 == length( integer( 1)))
te$test( 2 == length( double( 2)))
te$test( 1 == length( 1))
te$test( 2 == length( c( 3, 4)))
te$test( 3 == length( c( 3, c( 4, 5))))

te$checkComplainAndAdjustExpected( 10)

# see also:

print( te$result())

