
source( 'testEnv.R')

te = TestEnv()

te$checkComplainAndAdjustExpected( 0)

te$test( "logical"==mode( FALSE))
te$test( "logical"==mode( TRUE))
te$test( "logical"==typeof( TRUE))
te$test( "logical"==class( TRUE))
te$test( "NULL"==mode( NULL))
te$test( "NULL"==typeof( NULL))
te$test( "NULL"==class( NULL))
te$test( "numeric"==mode( 1))
te$test( "double"==typeof( 1))
te$test( "numeric"==class( 1))
te$test( "numeric"==mode( 1.5))
te$test( "double"==typeof( 1.5))
te$test( "numeric"==class( 1.5))
te$test( "numeric"==mode( 1L))
te$test( "integer"==typeof( 1L))
te$test( "integer"==class( 1L))
te$test( "character"==mode( "ab"))
te$test( "character"==typeof( "ab"))
te$test( "character"==class( "ab"))
te$test( "character"==mode( 'ab'))
te$test( "character"==typeof( 'ab'))
te$test( "character"==class( 'ab'))

te$test( "NULL"==mode( c()))
te$test( "NULL"==mode( c( NULL, NULL)))
te$test( "NULL"==typeof( c( NULL, NULL)))
te$test( "logical"==mode( c( TRUE, FALSE)))
te$test( "logical"==mode( c( TRUE, FALSE, NULL)))
te$test( "logical"==typeof( c( TRUE, FALSE, NULL)))
te$test( "numeric"==mode( c( 2, 3, 4)))
te$test( "numeric"==mode( c( 2, 3, 4, TRUE, NULL)))
te$test( "double"==typeof( c( 2, 3, 4, TRUE, NULL)))
te$test( "double"==typeof( c( 2L, 3L, 4, TRUE, NULL)))
te$test( "integer"==typeof( c( 2L, 3L, 4L, TRUE, NULL)))
te$test( "character"==mode( c( 2, "3", 4)))
te$test( "character"==mode( c( 2, "3", 4, TRUE, NULL)))
te$test( "character"==typeof( c( 2, "3", 4, TRUE, NULL)))
te$test( "character"==class( c( 2, "3", 4, TRUE, NULL)))

te$test( "list" == mode( list()))
te$test( "list" == typeof( list()))
te$test( "list" == mode( list( 1L, 1.1, NULL, TRUE, 'abc')))
te$test( "list" == typeof( list( 1L, 1.1, NULL, TRUE, 'abc')))
te$test( "list" == class( list( 1L, 1.1, NULL, TRUE, 'abc')))

te$test( "call"==mode( y ~ a + b))
te$test( "language"==typeof( y ~ a + b))
te$test( "formula"==class( y ~ a + b))

te$test( "2" == c( 2, "3", 4, NULL)[ 1])
te$test( 2 == c( 2, "3", 4, NULL)[ 1])
#te$test( c( 2, "3", 4, NULL) == c( 2, "3", 4, NULL)[ 0]) # Argument hat Laenge 0
#te$test( NULL != NULL) # Argument hat Laenge 0
te$test( "2" == c( 2, "3", 4, NULL)[ 1])
te$test( "TRUE" == c( 2, "3", 4, TRUE)[ 4])
te$test( TRUE == c( 2, "3", 4, TRUE)[ 4])


te$test( TRUE == "TRUE")
te$test( TRUE == 1)
te$test( "TRUE" != 1)

te$test( 2 == "2")

te$test( is.null( NULL))

te$test( 1 == as.numeric( TRUE))
te$test( 0 == as.numeric( FALSE))

te$test( 1 == c( 2, 3, 4, TRUE)[ 4])

te$test( all( logical( 3) == c( FALSE, FALSE, FALSE)))

te$test( all( numeric( 4) == c( 0, 0, 0, 0)))

te$test( all( character( 5) == c( '', '', '', '', '')))


te$checkComplainAndAdjustExpected( 61)

print( te$result())

