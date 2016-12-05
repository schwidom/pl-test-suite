
source( 'testEnv.R')

te = TestEnv()

te$checkComplainAndAdjustExpected( 0)

te$test( 'bcd' == substring( 'abcde', 2, 4))
te$test( 'abcd' == substring( 'abcde', 1, 4))
te$test( 'abcd' == substring( 'abcde', 0, 4))
te$test( 'abcd' == substring( 'abcde', -1, 4))
te$test( 'bcde' == substring( 'abcde', 2, 5))
te$test( 'bcde' == substring( 'abcde', 2, 6))
te$test( '' == substring( 'abcde', 2, -1))
te$test( '' == substring( 'abcde', 2, 1))
te$test( 'b' == substring( 'abcde', 2, 2))

te$checkComplainAndAdjustExpected( 9)

# see also:

print( te$result())

