drop table test;
create table test ( i NUMBER, k NUMBER);

declare 

 td testenv.TESTDATA;

begin

 insert into test values ( 1, 4);
 insert into test values ( 2, 5);
 insert into test values ( 3, 6);

 testenv.checkComplainAndAdjustExpected( td, 0);

 testenv.test( td, true);

 declare
  
  cursor c_test1 is select i, k from test;

  cursor c_test2 (v_i NUMBER) is select i, k from test where i >= v_i;

  v_test test%ROWTYPE;
  v_c_test1 c_test1%ROWTYPE;
  v_i NUMBER;
  v_k NUMBER;

 begin
  
  open c_test1;

  testenv.test( td, 0= c_test1%ROWCOUNT);
  testenv.test( td, c_test1%NOTFOUND is null);
  testenv.test( td, c_test1%FOUND is null);

  fetch c_test1 into v_i, v_k;

  testenv.test( td, 1= c_test1%ROWCOUNT);
  testenv.test( td, not c_test1%NOTFOUND);
  testenv.test( td, c_test1%FOUND);
  testenv.test( td, 1= v_i);
  testenv.test( td, 4= v_k);

  fetch c_test1 into v_test;

  testenv.test( td, 2= c_test1%ROWCOUNT);
  testenv.test( td, not c_test1%NOTFOUND);
  testenv.test( td, c_test1%FOUND);
  testenv.test( td, 2= v_test.i);
  testenv.test( td, 5= v_test.k);

  fetch c_test1 into v_c_test1;

  testenv.test( td, 3= c_test1%ROWCOUNT);
  testenv.test( td, not c_test1%NOTFOUND);
  testenv.test( td, c_test1%FOUND);
  testenv.test( td, 3= v_c_test1.i);
  testenv.test( td, 6= v_c_test1.k);

  fetch c_test1 into v_i, v_k;

  testenv.test( td, 3= c_test1%ROWCOUNT);
  testenv.test( td, c_test1%NOTFOUND);
  testenv.test( td, not c_test1%FOUND);
  testenv.test( td, 1= v_i);
  testenv.test( td, 4= v_k);

  close c_test1;

  open c_test2( 3);
  
  fetch c_test2 into v_i, v_k;

  testenv.test( td, 1= c_test2%ROWCOUNT);
  testenv.test( td, not c_test2%NOTFOUND);
  testenv.test( td, c_test2%FOUND);
  testenv.test( td, 3= v_i);
  testenv.test( td, 6= v_k);

  close c_test2;

  declare

   type t is ref cursor;
   v_cursor t;
  begin

   open v_cursor for 'select i, k from test where i=:drei ' using 3;

   -- see also execute-immediate.sql

   fetch v_cursor into v_i, v_k;

   testenv.test( td, 1= v_cursor%ROWCOUNT);
   testenv.test( td, not v_cursor%NOTFOUND);
   testenv.test( td, v_cursor%FOUND);
   testenv.test( td, 3= v_i);
   testenv.test( td, 6= v_k);

   close v_cursor;

  end;

 end;


 testenv.checkComplainAndAdjustExpected( td, 34);

 dbms_output.put_line( testenv.result( td));

end;
/
