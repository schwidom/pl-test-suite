
source( 'testEnv.R')

te = TestEnv()

te$checkComplainAndAdjustExpected( 0)

te$test( format( globalenv()) == format( environment()))
te$test( format( .GlobalEnv) == format( environment()))

f1 <- function()
{ v=2; environment( f2)= environment()
 te$test( format( .GlobalEnv) != format( environment( f2)))
 f2(); v
}

f2 <- function(){ v<<-3}

te$test( 3 == f1())

te$test( ! exists( 'v'))

te$test( format( .GlobalEnv) == format( environment( f2)))

f2()

te$test( exists( 'v'))

te$checkComplainAndAdjustExpected( 7)

# see also:

print( te$result())

