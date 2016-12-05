
source( 'testEnv.R')

te = TestEnv()

te$checkComplainAndAdjustExpected( 0)

f_model= y ~ a+ b* sin( c+ d*x)

x= seq( 0, 2*pi*10, length.out=100)
y= sin( x)
f_error= 0.01
y[ 1]= y[ 1]+ f_error # avoid exact match (its an error)

res1= nls( f_model, start= list( a=0, b=1, c=0, d=1))
data= list( x=x, y=y)
rm( x, y)
res2= nls( f_model, data= data, start= list( a=0, b=1, c=0, d=1))

te$test( f_model == formula( res2))

res2_deviance_expected= f_error**2
res2_deviance_expected_tolerance= 9e-6
res2_deviance= 9.135179e-05
res2_deviance_tolerance= 1e-10

te$test( all.equal( res2_deviance, res2_deviance_expected, scale=1, tolerance= res2_deviance_expected_tolerance))
te$test( all.equal( res2_deviance, deviance( res2), scale=1, tolerance= res2_deviance_tolerance))

res2_coef= coef( res2)

te$test( all( c( 'a', 'b', 'c', 'd') == names( res2_coef)))

te$test( all.equal( c( 0, 1, 0, 1), as.double( res2_coef), scale= 1, tolerance= 3e-4))

res2_fitted= fitted( res2)

te$test( "Fitted values" == attributes( res2_fitted)$label)
te$test( all.equal( data$y, c( res2_fitted), scale= 1, tolerance= 4e-4))

res2_residuals= residuals( res2)
te$test( all.equal( sum( res2_residuals ** 2), deviance( res2)))

te$checkComplainAndAdjustExpected( 8)

# see also: nls.R

print( te$result())

