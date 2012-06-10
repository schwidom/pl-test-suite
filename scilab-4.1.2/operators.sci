exec( 'testenv.sci', -1)

checkComplainAndAdjustEx( 0)

tst_test( 'a1' == 'a' + string( 1))
tst_test( 'aT' == 'a' + string( %T))

tst_test( %T == %T)
tst_test( %T==(%T == %T))
tst_test( ~ %T == %F)
tst_test( ~ %F == %T)
tst_test( %F == %F)

tst_test( 3 == 2+ 1)

checkComplainAndAdjustEx( 8)

[a, b]=(1, 2)
tst_test( 1 == a)
tst_test( 2 == b)
clear a b

checkComplainAndAdjustEx( 2)

tst_test( -1 == %i ** 2)
tst_test( 1 == %i ** 4)

checkComplainAndAdjustEx( 2)

m= [5 6; 7 8]

tst_test( 5==m(1, 1))
tst_test( 6==m(1, 2))
tst_test( 8==m(2, 2))

tst_test( [5; 7]==m(:,1))
tst_test( [6; 8]==m(:,2))
tst_test( [7 8]==m(2,:))
tst_test( m==m(:,:))
tst_test( [5;7;6;8]==m(:))
tst_test( [8]==m(4))

tst_test( [5 5; 7 7]==m(:,[1 1]))
tst_test( [5 5; 5 5]==m([1 1],[1 1]))

tst_test( [5 6; 7 8]==m)
tst_test( [6 7; 8 9]==1+ m)
tst_test( [10 12; 14 16]==2* m)

checkComplainAndAdjustEx( 14)

printf( tst_result())

exit
