
source( 'testEnv.R')

te = TestEnv()

te$checkComplainAndAdjustExpected( 0)

combn2of3= combn(1:3, 2)

te$test( 'numeric' == mode( combn2of3))

te$test( all( matrix( nrow=2, ncol=3, data=c( 1, 2, 1, 3, 2, 3)) == combn2of3))

combn2of3= combn(1:3, 2, simplify = FALSE)

te$test( 'list' == mode( combn2of3))

te$test( all( c( 1, 3) == combn2of3[[ 2]]))

te$test( all( c( '1,2', '1,3', '2,3') == combn( 1:3, 2, FUN= function( x){ paste( x, collapse=',')})))

te$test( '1,2;1,3;2,3' == paste( combn( 1:3, 2, FUN= function( x){ paste( x, collapse=',')}), collapse=';'))

te$test( '1,2;1,3;1,4;2,3;2,4;3,4' == paste( combn( 1:4, 2, FUN= function( x){ paste( c( x), collapse=',')}), collapse=';'))

te$test( '1;2;3;4' == paste( combn( 1:4, 1, FUN= function( x){ paste( c( x), collapse=',')}), collapse=';'))

te$test( '1,2,3;1,2,4;1,3,4;2,3,4' == paste( combn( 1:4, 3, FUN= function( x){ paste( c( x), collapse=',')}), collapse=';'))

te$checkComplainAndAdjustExpected( 9)

unused <- combn( 1:3, 2, FUN= function( x, n){ te$test( 99==n); x}, n=99)

te$checkComplainAndAdjustExpected( 3)

# see also:

print( te$result())

