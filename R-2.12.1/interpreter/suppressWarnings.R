
source( 'testEnv.R')

te = TestEnv()

te$checkComplainAndAdjustExpected( 0)

te$test( 'a warning' == suppressWarnings( warning( 'a warning')))
te$test( 2 == suppressWarnings( ( function(){ warning( 'a warning'); 2})()))

te$checkComplainAndAdjustExpected( 2)

# see also:

print( te$result())

