
source( 'testEnv.R')

te = TestEnv()

te$checkComplainAndAdjustExpected( 0)

f <- function( p) p+ g

ev1= call( 'f', 2)

g= 3

te$test( 5 == eval( ev1))

g= 4

te$test( 6 == eval( ev1))

rm( g)

error= try( 
 {
  eval( ev1)
  te$test( FALSE)
 }
, silent=TRUE
)

if( ! is.null( error))
{
 te$test( "Error in f(2) : object 'g' not found\n" == error)
} else
{
  te$test( FALSE)
}

te$checkComplainAndAdjustExpected( 3)

# see also: call.R, topic-call-eval.R
# see also:

print( te$result())

