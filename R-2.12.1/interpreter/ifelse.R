
source( 'testEnv.R')

te = TestEnv()

te$checkComplainAndAdjustExpected( 0)

te$test( all( c( 4, 5, 4) == ifelse( c( 1, 0, 1), 4, 5)))

te$test( all( c( 1, 4, 3, 2) == ifelse( c( 1, 0, 0, 1), c( 1, 2), c( 3, 4))))

te$test( all( c( 1, 2, 1, 3, 4, 5) == ifelse( c( 1, 1, 1, 0, 0, 0), c( 1, 2), c( 3, 4, 5))))

te$checkComplainAndAdjustExpected( 1)

invisible( {
 ifelse( TRUE, te$test( TRUE), te$test( FALSE))
 ifelse( FALSE, te$test( FALSE), te$test( TRUE))
})

te$checkComplainAndAdjustExpected( 2)

invisible( {
 ifelse( c( TRUE, TRUE), te$test( TRUE), te$test( FALSE))
 ifelse( c( FALSE, FALSE), te$test( FALSE), te$test( TRUE))
})

te$checkComplainAndAdjustExpected( 2)

invisible(
 ifelse( c( TRUE, FALSE), te$test( TRUE), te$test( TRUE))
)

te$checkComplainAndAdjustExpected( 2)

# see also:

print( te$result())

