
source( 'testEnv.R')

te = TestEnv()

te$checkComplainAndAdjustExpected( 0)

v3= 1:3
te$test( 0 == length( ( for( i in v3) i)))

v3res= c()
for( i in v3) v3res= append( v3res, c( i+ 4))
te$test( all( v3 == v3res- 4))


res= 0

for( i in v3)
{
 res= i
 if( 2 == i) break
 next
 te$test( FALSE)
}

te$test( 2== res)




te$checkComplainAndAdjustExpected( 3)

# see also:

print( te$result())

