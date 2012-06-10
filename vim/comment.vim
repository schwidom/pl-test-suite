
source testenv.vim

call CheckComplainAndAdjustExpected( 0)

" this is a comment

call Test( TRUE) |" this is a comment

call CheckComplainAndAdjustExpected( 1)

echo (Result())

echo "type q and return"

