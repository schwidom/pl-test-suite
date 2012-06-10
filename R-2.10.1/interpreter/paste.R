
source( 'testEnv.R')

te = TestEnv()

te$checkComplainAndAdjustExpected( 0)

te$test( 0 == length( paste()))

te$test( '' == paste( ''))

te$test( 'a b c' == paste( 'a', 'b', 'c'))
te$test( 'abc' == paste( 'a', 'b', 'c', sep=''))
te$test( 'a/b/c' == paste( 'a', 'b', 'c', sep='/'))

te$test( '1:2:3:4' == paste( 1, 2, 3, 4, sep=':'))

te$test( all( c( 'a1', 'a2', 'a3', 'a4') == paste( 'a', 1:4, sep='')))
te$test( all( c( '1a2', '2a3', '3a4', '4a5') == paste( 1:4, 'a', 2:5, sep='')))

te$test( all( c( '1a2', '2b3', '3a4', '1b5', '2a6') == paste( 1:3, c( 'a', 'b'), 2:6, sep='')))

te$test( '1a2,2b3,3a4,1b5,2a6' == paste( 1:3, c( 'a', 'b'), 2:6, sep='', collapse=','))


te$checkComplainAndAdjustExpected( 10)

# see also:

print( te$result())

