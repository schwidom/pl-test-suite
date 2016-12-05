
source( 'testEnv.R')

te = TestEnv()

te$checkComplainAndAdjustExpected( 0)

v= c()

te$test( is.null( v[2]))
te$test( is.null( v[10]))

te$test( all( 1:3 == append( v, 1:3)))
te$test( 0 == length( v))

v[ 1]= 9

te$test( all( c( 9, 1:3) == append( v, 1:3)))
te$test( all( c( 1:3, 9) == append( 1:3, v)))
te$test( all( c( 1:2, 9, 3:3) == append( 1:3, v, after= 2)))
te$test( all( c( 1:1, 9, 2:3) == append( 1:3, v, after= 1)))
te$test( all( c( 9, 1:3) == append( 1:3, v, after= 0)))

te$test( !is.null( v[2]))
te$test( !is.null( v[10]))

te$test( is.na( v[2]))
te$test( is.na( v[10]))


te$checkComplainAndAdjustExpected( 13)

# see also:

print( te$result())

