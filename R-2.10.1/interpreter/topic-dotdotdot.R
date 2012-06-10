
source( 'testEnv.R')

te = TestEnv()

te$checkComplainAndAdjustExpected( 0)

f1 <- function( b) b+ 1
f2 <- function( a, ...) a+ f1( ...)

te$test( 6 == f2( 3, 2))

f2 <- function( a, ..., z=1) a+ f1( ...)+ z

te$test( 7 == f2( 3, 2))
te$test( 8 == f2( 3, 2, z=2))

te$checkComplainAndAdjustExpected( 3)

# see also:

print( te$result())

