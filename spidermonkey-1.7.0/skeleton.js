
load( 'testenv.js')

te= testenv()

te.checkComplainAndAdjustExpected( 0)

te.test( true)

te.checkComplainAndAdjustExpected( 1)

print( te.result())

