
source( 'testEnv.R')

te = TestEnv()

te$checkComplainAndAdjustExpected( 0)

te$test( "table" == class( table( 1)))

te$test( identical( as.integer( c( 1)), dim( table( 1))))
te$test( identical( as.integer( c( 1, 1)), dim( table( 1, 1))))
te$test( identical( as.integer( c( 1, 1)), dim( table( 1, 2))))
te$test( identical( as.integer( c( 1, 1, 1)), dim( table( 1, 1, 1))))
te$test( identical( as.integer( c( 1, 1, 1)), dim( table( 1, 2, 3))))

te$test( identical( list( "1"), unname( dimnames( table( 1))) ))
te$test( identical( list( "1", "1"), unname( dimnames( table( 1, 1))) ))
te$test( identical( list( "1", "2"), unname( dimnames( table( 1, 2))) ))
te$test( identical( list( "1", "1", "1"), unname( dimnames( table( 1, 1, 1))) ))
te$test( identical( list( "1", "2", "3"), unname( dimnames( table( 1, 2, 3))) ))

te$test( identical( as.integer( c( 1)), dim( table( c( 1, 1, 1)))))

te$test( 1 == table( c( 1)))
te$test( 2 == table( c( 1, 1)))
te$test( 3 == table( c( 1, 1, 1)))

te$test( identical( as.integer( c( 2, 2)), dim( table( 1:2, 1:2))))

te$test( all( table( 1:2, 1:2) == diag( 2)))
te$test( all( table( 1:2, 2:1) == diag( 2)[2:1,]))

te$test( all( table( 1:3, 1:3) == diag( 3)))
te$test( all( table( 1:2, 1:2, 1:2) == c( 1, 0, 0, 0, 0, 0, 0, 1)))

te$test( identical( as.integer( c( 1, 2)), dim( table( c( 1, 1), 1:2))))
te$test( identical( as.integer( c( 2, 1)), dim( table( 1:2, c( 1, 1)))))

te$test( all( table( c( 1, 1), 1:2) == c( 1, 1)))
te$test( all( table( 1:2, c( 1, 1)) == c( 1, 1)))

te$test( all( table( c( 1, 1, 2, 2), c( 1, 1, 1, 2)) == c( 2, 1, 0, 1)))

te$test( identical( table( c( 1, 2, 1, 2, 3)), table( factor( c( 1, 2, 1, 2, 3), levels=1:3))) )
te$test( all( table( factor( c( 1, 2, 1, 2, 3), levels=1:3)) == c( 2, 2, 1)))
te$test( all( table( factor( c( 1, 2, 1, 2, 3), levels=1:4)) == c( 2, 2, 1, 0)))

te$checkComplainAndAdjustExpected( 28)

# see also:

print( te$result())

