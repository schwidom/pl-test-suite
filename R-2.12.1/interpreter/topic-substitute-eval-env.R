
source( 'testEnv.R')

te = TestEnv()

te$checkComplainAndAdjustExpected( 0)

local(
{
 a=10
 e= new.env( parent= parent.frame( 2))
 with( e, te$test( ! exists( 'a')))
 eval( envir=e, substitute( { b= a+1}))
 te$test( 11 == with( e, b))
})

local( 
{
 e1= new.env()
 with( e1, { a=10})
 e2= new.env()
 te$test( ! exists( 'a'))
 eval( envir=e2, substitute({ b= a+1}, e1))
 te$test( 11 == with( e2, b))
})

te$checkComplainAndAdjustExpected( 4)

# see also:

print( te$result())

