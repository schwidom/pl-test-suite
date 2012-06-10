
source( 'testEnv.R')

te = TestEnv()

te$checkComplainAndAdjustExpected( 0)


f <- function() x

x= 9

te$test( 9==f())

formals( f) <- list( x= 1)

te$test( 1==f())
te$test( 2==f( 2))

te$checkComplainAndAdjustExpected( 3)

# see also: help( list)#examples

print( te$result())

