
source testenv.vim

call CheckComplainAndAdjustExpected( 0)

call Test( TRUE)

call CheckComplainAndAdjustExpected( 1)

echo (Result())

echo "type q and return"

