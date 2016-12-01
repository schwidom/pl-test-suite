
source testenv.source

tst_checkComplainAndAdjustExpected 0

(
 declare -n B=A

 tst_test test "" == "$A"
 tst_test test "" == "$B"

 A="i"

 tst_test test "i" == "$A"
 tst_test test "i" == "$B"

 B="k"

 tst_test test "k" == "$A"
 tst_test test "k" == "$B"

 declare -n C=B

 B="l"

 tst_test test "l" == "$A"
 tst_test test "l" == "$B"
 tst_test test "l" == "$C"

 C="m"

 tst_test test "m" == "$A"
 tst_test test "m" == "$B"
 tst_test test "m" == "$C"

 A="o"

 tst_test test "o" == "$A"
 tst_test test "o" == "$B"
 tst_test test "o" == "$C"

 ARRAY=( a b c)

 tst_test test "a b c" == "${ARRAY[*]}"

 declare -n Z="ARRAY[1]"

 Z=x

 tst_test test "a x c" == "${ARRAY[*]}"
 tst_test test "x" == "$Z"

 ARRAY[1]=y

 tst_test test "a y c" == "${ARRAY[*]}"
 tst_test test "y" == "$Z"
 
 tst_state_save
)
tst_state_load

tst_checkComplainAndAdjustExpected 20

echo $(tst_result)

