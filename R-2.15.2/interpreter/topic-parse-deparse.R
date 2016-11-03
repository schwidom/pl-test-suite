
source( 'testEnv.R')

te = TestEnv()

te$checkComplainAndAdjustExpected( 0)

f <- function( a=1) 1+a

te$test( 2 == f())
te$test( 3 == f( 2))

fp <- parse( text= deparse( f))

te$test( deparse( fp[[1]]) == "function(a = 1) 1 + a")
te$test( deparse( fp[[1]][[1]]) == "function")
te$test( deparse( fp[[1]][[2]]) == "list(a = 1)")
te$test( deparse( fp[[1]][[3]]) == "1 + a")
te$test( deparse( fp[[1]][[3]][[2]]) == "1")
te$test( deparse( fp[[1]][[3]][[3]]) == "a")

te$test( 2 == eval( fp)())
te$test( 3 == eval( fp)( 2))

te$checkComplainAndAdjustExpected( 10)

# see also:

print( te$result())

