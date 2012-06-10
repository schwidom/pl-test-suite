
source( 'testEnv.R')

te = TestEnv()

te$checkComplainAndAdjustExpected( 0)

te$test( ! exists( 'v1'))
te$test( ! exists( 'v2'))
te$test( ! exists( 'v3'))

res= within( list( v1=2), {
 te$test( 2 == v1)
 te$test( ! exists( 'v2'))
 v3=3
})

te$test( 2 == res$v1)
te$test( 3 == res$v3)

te$test( ! exists( 'v1'))
te$test( ! exists( 'v2'))
te$test( ! exists( 'v3'))

env= NA
l2= NA

l1= within( list( a=1), {
 l2 <<- within( list( a=2), {
  env <<- environment()
  te$test( 2 == a)
  with( parent.env( env),
   te$test( 1 == a)
  )

  a <<- 3
  a <- 4
 })
})

with( parent.env( env),
 te$test( 3 == a)
)

with( env,
 te$test( 4 == a)
)

te$test( 3 == l1$a)
te$test( 4 == l2$a)

rm( l2, env)

te$checkComplainAndAdjustExpected( 16)

# see also: within.R, with.R
# see also: 

print( te$result())

