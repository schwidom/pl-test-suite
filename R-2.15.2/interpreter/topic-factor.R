
source( 'testEnv.R')

te = TestEnv()

te$checkComplainAndAdjustExpected( 0)

f1 <- factor( 1:2)
f2 <- factor( 3:4)

f3 <- factor( c( '1:3', '2:4'), levels= c("1:3", "1:4", "2:3", "2:4"))

te$test( identical( f3, f1:f2))

te$checkComplainAndAdjustExpected( 1)

# see also: interaction

print( te$result())

