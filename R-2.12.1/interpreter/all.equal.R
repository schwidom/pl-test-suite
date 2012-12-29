
source( 'testEnv.R')

te = TestEnv()

te$checkComplainAndAdjustExpected( 0)

te$test( TRUE == all.equal( 1:2, 1:2))

res1= all.equal( 1:2, 2:1)

te$test( "character"== typeof( res1))
te$test( "character"== mode( res1))
te$test( "character"== class( res1))

res2= all.equal( 1:2, 1:3)

te$test( "character"== typeof( res2))
te$test( "character"== mode( res2))
te$test( "character"== class( res2))

te$test( "TRUE" == TRUE) 

te$test( all( 1:2 == 1:2))
te$test( ! all( 1:2 == 2:1))
te$test( ! suppressWarnings( all( 1:2 == 1:3)))

te$checkComplainAndAdjustExpected( 11)

# see also: suppressWarnings.R, all.equal.R

print( te$result())

