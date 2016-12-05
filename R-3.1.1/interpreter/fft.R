
source( 'testEnv.R')

te = TestEnv()

te$checkComplainAndAdjustExpected( 0)

#v= as.complex( 1:10)
v= as.complex( 3:29)

te$test( TRUE == all.equal( v*length( v), fft( fft( v, inverse=FALSE), inverse=TRUE)))

te$test( TRUE == all.equal( v*length( v), fft( fft( v, inverse=TRUE), inverse=FALSE)))

te$test( TRUE == all.equal( fft( fft( v, inverse=TRUE), inverse=TRUE), fft( fft( v, inverse=FALSE), inverse=FALSE)))

te$test( TRUE == all.equal( c( v[1], v[ length( v):2])* length( v), fft( fft( v, inverse=FALSE), inverse=FALSE)))

rm( v)

te$checkComplainAndAdjustExpected( 4)

# see also:

print( te$result())

