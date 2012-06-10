
source( 'testEnv.R')

te = TestEnv()

te$checkComplainAndAdjustExpected( 0)

'%my-own-infix-operator%' <- function( x, y) 1+x+y

te$test( 6 == 2 %my-own-infix-operator% 3)

te$checkComplainAndAdjustExpected( 1)

# see also:

print( te$result())

