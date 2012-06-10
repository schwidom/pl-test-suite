
source( 'testEnv.R')

te = TestEnv()

te$checkComplainAndAdjustExpected( 0)

te$test( 4 == switch( 'b', a=3, b=4, c=5, d=6))
te$test( 5 == switch( 'b', a=3, b= , c=5, d=6))
te$test( 6 == switch( 'b', a=3, b= , c= , d=6))

cnt= 0
cntInc <- function( ret){ cnt<<- 1+ cnt; ret;}

te$test( 4 == switch( 'b', a=3, b=4, c=5, d=cntInc()))

te$test( 0 == cnt)

te$test( 4 == switch( 'b', a=3, b= , c= , d=cntInc( 4)))

te$test( 1 == cnt)

te$test( 4 == switch( 'd', a=3, b=4, c=5, d=cntInc( 4)))

te$test( 2 == cnt)

te$checkComplainAndAdjustExpected( 9)

# see also:

print( te$result())

