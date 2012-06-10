
source testenv.vim

call CheckComplainAndAdjustExpected( 0)

call Test( TRUE)
call Test( ! FALSE)

call CheckComplainAndAdjustExpected( 2)


call Test( "a"=="a")
call Test( ! ("a"!="a"))
call Test( ! ("a"=="A"))
call Test( ! ("a"=="b"))

call CheckComplainAndAdjustExpected( 4)

call Test( ("ab"== "a" . "b"))
call Test( ("abc"== "a" . "b" . "c"))
call Test( ("a3"== "a" . 3))
call Test( ("3a"== 3 . "a"))
call Test( ("a"== ("a"*3)))
call Test( (0 == ("a"*3)))
call Test( (0 == "a"))
call Test( (1 == "a"+ 1))

call CheckComplainAndAdjustExpected( 8)

call Test( ("579" == "123"+ "456"))
call Test( ("6" == "1a2" + 5))

call CheckComplainAndAdjustExpected( 2)

call Test( 1==1)
call Test( ! (1==1.0))
call Test( 1 < 2)

call CheckComplainAndAdjustExpected( 3)

call Test( 3 == 8 % 5)

call CheckComplainAndAdjustExpected( 1)

echo (Result())

echo "type q and return"

