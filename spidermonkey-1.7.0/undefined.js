
load( 'testenv.js')

te= testenv()

te.checkComplainAndAdjustExpected( 0)

te.test( 'undefined'==typeof a)

a= new Object()

te.test( 'undefined'!=typeof a)
te.test( 'object'==typeof a)
te.test( undefined==a.a)

a.a=1

te.test( undefined!=a.a)

te.test( delete a.a)
te.test( delete a.a)

te.test( undefined==a.a)

te.test( delete a)

te.test( 'undefined'==typeof a)

te.checkComplainAndAdjustExpected( 10)

print( te.result())

