
source( 'testEnv.R')

te = TestEnv()

te$checkComplainAndAdjustExpected( 0)

te$test( 3 == eval( parse( text='1 + 2')))
a= 1
te$test( 3 == eval( parse( text='a + 2')))

te$checkComplainAndAdjustExpected( 1)

# see also:

print( te$result())

