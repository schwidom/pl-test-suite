
source( 'testEnv.R')

te = TestEnv()

te$checkComplainAndAdjustExpected( 0)


'%/=%' <- function( lval, rval)
{
 lvalName= match.call()$lval
 envir= parent.frame( 1)
 lvalNameExists= exists( as.character( lvalName), where= envir)
 eval( envir= envir, substitute({ if( ! lvalNameExists){ lval= rval}}, environment()))
}

'%\\=%' <- function( lval, rval)
{
 lvalName= match.call()$lval
 envir= parent.frame( 1)
 lvalNameExists= exists( as.character( lvalName), where= envir)
 eval( envir= envir, substitute({ if( lvalNameExists){ lval= rval}}, environment()))
}


te$test( ! exists( 'x'))


x %\=% 1 # if set, then set

te$test( ! exists( 'x'))

x %/=% 1 # if not set, then set

te$test( exists( 'x'))
te$test( 1==x)


x %/=% 2 # if not set, then set

te$test( 1==x)


x %\=% 2 # if set, then set

te$test( 2==x)

te$checkComplainAndAdjustExpected( 6)

# see also: pl-test-suite/icon/operators.icn

print( te$result())

