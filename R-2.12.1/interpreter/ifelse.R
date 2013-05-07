
source( 'testEnv.R')

te = TestEnv()

te$checkComplainAndAdjustExpected( 0)

te$test( all( c( 4, 5, 4) == ifelse( c( 1, 0, 1), 4, 5)))

te$checkComplainAndAdjustExpected( 1)

invisible( {
 ifelse( TRUE, te$test( TRUE), te$test( FALSE))
 ifelse( FALSE, te$test( FALSE), te$test( TRUE))
})

te$checkComplainAndAdjustExpected( 2)

invisible( {
 ifelse( c( TRUE, TRUE), c( te$test( TRUE), te$test( TRUE)), c( te$test( FALSE), te$test( FALSE)))
 ifelse( c( FALSE, FALSE), c( te$test( FALSE), te$test( FALSE)), c( te$test( TRUE), te$test( TRUE)))
})

te$checkComplainAndAdjustExpected( 4)

invisible(
 ifelse( c( TRUE, FALSE), c( te$test( TRUE), te$test( TRUE)), c( te$test( TRUE), te$test( TRUE)))
)

te$checkComplainAndAdjustExpected( 4)

# see also:

print( te$result())

