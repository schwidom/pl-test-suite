
source( 'testEnv.R')

te <- TestEnv()

te$checkComplainAndAdjustExpected( 0)

lRes <- list()

local( {

 lRes$ loc1 <<- environment() # pe

 f <- function()
 {

  lRes$ pe <<- parent.env( environment()) # loc1
  lRes$ pf <<- parent.frame() # loc2
 }

 local( {

  lRes$ loc2 <<- environment() # pf

  f()
 })
})


te$test( with( lRes, identical( loc1, pe)))
te$test( with( lRes, identical( loc2, pf)))
te$test( ! with( lRes, identical( loc1, pf)))
te$test( ! with( lRes, identical( loc2, pe)))


te$checkComplainAndAdjustExpected( 4)

# see also:

print( te$result())

