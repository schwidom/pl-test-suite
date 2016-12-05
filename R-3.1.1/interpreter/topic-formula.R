
source( 'testEnv.R')

te = TestEnv()

te$checkComplainAndAdjustExpected( 0)

f= y ~ a * b + c * d

te$test( "call" == mode( f))
te$test( "language" == typeof( f))

te$test( ( y ~ a * b + c * d) == f)

te$test( all( c( "y", "a", "b", "c", "d") == all.vars( f)))

te$test( "~" == as.character( f[1]))
te$test( (~z)[1] == f[1])
te$test( "y" == as.character( f[2]))
te$test( (~y)[2] == f[2])

te$test( "a * b + c * d" == as.character( f[3]))
te$test( all( c( "+", "a * b", "c * d") == as.character( f[[3]])))

te$test( (~a * b + c * d)[2] == f[3]) 


te$test( all( (~a * b + c * d)[[2]] == f[[3]]))

te$test( "+" == as.character( f[[3]][1]))
te$test( "a * b" == as.character( f[[3]][2]))
te$test( "c * d" == as.character( f[[3]][3]))

te$test( all( c( "*", "c", "d") == as.character( f[[3]][[3]])))


te$checkComplainAndAdjustExpected( 16)

# see also: topic-formula.R, topic-substitute-eval.R
# see also:

print( te$result())

