
source( 'testEnv.R')

te = TestEnv()

te$checkComplainAndAdjustExpected( 0)

l1= list( a=2)
l1$b= 3

te$test( 2 == l1$a)
te$test( 3 == l1$b)

l2 <- l1 # by value

#te$test( all( l1 == l2)) # not implemented
te$test( all( format( l1) == format( l2)))

te$test( 2 == l2$a)
te$test( 3 == l2$b)

l2$b <- 4

te$test( any( format( l1) != format( l2)))

te$test( 4 == l2$b)
te$test( 3 == l1$b)

te$test( 4 == l2['b']) # darstellung auf console unterscheidet sich
te$test( 4 == l2[['b']])
te$test( format( list( b=4)) == format( l2['b'])) # darstellung auf console unterscheidet sich
te$test( format( list( b=4)) == format( l2[['b']])) 

te$test( all( tryCatch( c( 2, 3) == list( 2, 3), error= function( x) x)))
te$test( "comparison of these types is not implemented" == tryCatch( list( 2, 3) == list( 2, 3), error= function( x) x)$message)
te$test( "comparison of these types is not implemented" == tryCatch( as.vector( list( 2, 3)) == list( 2, 3), error= function( x) x)$message)
te$test( all( tryCatch( as.vector( mode='numeric', list( 2, 3)) == list( 2, 3), error= function( x) x)))

te$checkComplainAndAdjustExpected( 16)

l= vector( "list", 5)

te$test( 5 == length( l))

te$test( "list" == mode( l))
te$test( "list" == mode( c( 1, l)))

te$checkComplainAndAdjustExpected( 3)

print( te$result())

