
source( 'testEnv.R')

te = TestEnv()

te$checkComplainAndAdjustExpected( 0)

te$test( all( c( 0, 1, 1, 1, 1) == cumsum( c( 0, 1, 0, 0, 0))))
te$test( all( c( 0, 1, 1, 0, 0) == cumsum( c( 0, 1, 0, -1, 0))))
te$test( all( c( 0, 1, 3, 6, 10) == cumsum( 0:4)))
te$test( all( 26:100 == diff( cumsum( 25:100))))
te$test( all( 1:75 == cumsum( diff( 25:100))))

te$checkComplainAndAdjustExpected( 5)

# see also: diff.R, cumsum.R, cumprod.R

print( te$result())

