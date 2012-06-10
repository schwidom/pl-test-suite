
source testenv.vim

call CheckComplainAndAdjustExpected( 0)

call Test( TRUE)
call Test( TRUE)

call CheckComplainAndAdjustExpected( 2)

call Test( TRUE)
call Test( TRUE)
call Test( TRUE)

call CheckComplainAndAdjustExpected( 3)

echo (Result())

echo "type q and return"

