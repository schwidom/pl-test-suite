
source( 'testEnv.R')

te = TestEnv()

te$checkComplainAndAdjustExpected( 0)

#te$test( TRUE)

a= 10

te$test( !is.object( a))
te$test( inherits( a, class( a)))
te$test( !inherits( a, class( 'first')))
te$test( !inherits( a, class( 'second')))
te$test( !inherits( a, c( 'first', 'second')))
te$test( inherits( a, 'numeric'))

te$checkComplainAndAdjustExpected( 6)

class( a) <- c( 'first', 'second')

te$test( is.object( a))
te$test( inherits( a, class( a)))
te$test( !inherits( a, class( 'first')))
te$test( !inherits( a, class( 'second')))
te$test( inherits( a, c( 'first', 'second')))

te$checkComplainAndAdjustExpected( 5)

f.default <- function( i){ te$test( TRUE);}
f <- function( i){ UseMethod( 'f', i)}

f( a)

te$checkComplainAndAdjustExpected( 1)

f.default <- function( i){ te$test( FALSE);}
f.first <- function( i){ te$test( TRUE);}

f( a)

te$checkComplainAndAdjustExpected( 1)

f.default <- function( i){ te$test( FALSE);}
f.first <- function( i){ te$test( TRUE); NextMethod( 'f', i);}
f.second <- function( i){ te$test( TRUE);}

f( a)

te$checkComplainAndAdjustExpected( 2)

rm( f.first)

f( a)

te$checkComplainAndAdjustExpected( 1)

# see also:

print( te$result())

