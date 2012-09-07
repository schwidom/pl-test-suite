
source( 'testEnv.R')

te = TestEnv()

te$checkComplainAndAdjustExpected( 0)

code= substitute( a + b)

te$test( 'call' == mode( code))
te$test( 'language' == typeof( code))
te$test( 'call' == class( code))

te$test( all( c( '+', 'a', 'b') == as.character( code)))
te$test( 'a + b' == format( code))

a= 2; b= 3

te$test( 5 == eval( code))

a= 4; b= 5

te$test( 9 == eval( code))

te$checkComplainAndAdjustExpected( 7)

# see also: topic-formula.R, topic-substitute-eval.R
# see also: do.call.R, topic-substitute-eval.R
# see also:

print( te$result())

