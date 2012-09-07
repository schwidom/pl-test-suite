
source( 'testEnv.R')

te = TestEnv()

te$checkComplainAndAdjustExpected( 0)

res= 0

delayedAssign( 'x', { res= 1+ res; 9})

te$test( 0 == res)
te$test( 9 == x)
te$test( 1 == res)
te$test( 9 == x)
te$test( 1 == res)


te$checkComplainAndAdjustExpected( 5)

# see also: clisp: force, delay

print( te$result())

