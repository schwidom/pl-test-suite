
source( 'testEnv.R')

te = TestEnv()

te$checkComplainAndAdjustExpected( 0)

te$test( all( c( 1, 2, 3) == eval( call( 'c', 1, 2, 3))))

dcl= eval( call( 'list', c=1, a=2, b=3))

te$test( all( c( 1, 2, 3) == dcl))

te$test( all( c( "c", "a", "b") == names( dcl)))

te$checkComplainAndAdjustExpected( 3)

# see also: do.call.R, topic-substitute-eval.R, call.R
# see also: call.R, topic-call-eval.R
# see also: 

print( te$result())

