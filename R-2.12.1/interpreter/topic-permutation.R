
source( 'testEnv.R')

te = TestEnv()

te$checkComplainAndAdjustExpected( 0)

v5= 1:5

te$test( all( v5 == sort( sample( v5)))) # sorted permutation
te$test( all( v5 == sort( sample( v5, length( v5))))) # sorted permutation

te$checkComplainAndAdjustExpected( 2)

# see also:

print( te$result())

