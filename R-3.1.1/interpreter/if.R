
source( 'testEnv.R')

te = TestEnv()

te$checkComplainAndAdjustExpected( 0)

te$test( 2 == ( if( TRUE) 2))
te$test( 2 == ( if( TRUE) 2 else 3))
te$test( 3 == ( if( FALSE) 2 else 3))

te$test( 1 == length( ( if( TRUE) 2)))
te$test( 0 == length( ( if( FALSE) 2)))

te$checkComplainAndAdjustExpected( 5)

# see also:

print( te$result())

