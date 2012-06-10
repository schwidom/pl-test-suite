drop table test;
create table test ( i NUMBER, k NUMBER);

declare 

 td testenv.TESTDATA;

begin

 insert into test values ( 1, 4);
 insert into test values ( 2, 5);
 insert into test values ( 3, 6);

 testenv.checkComplainAndAdjustExpected( td, 0);

 <<loop_mark_outer>>
 loop
  <<loop_mark_inner>>
  testenv.test( td, true);
  exit loop_mark_outer;
  goto loop_mark_inner;
 end loop;

 for i in (select 1 k from dual) loop
  testenv.test( td, 1=i.k);
 end loop;

 declare
  type table_of_number is table of number;
  ton table_of_number;
 begin

  ton:= table_of_number();
  for i in 3..8 loop
   ton.extend;
   ton( ton.COUNT) := i;
  end loop;
  testenv.test( td, table_of_number( 3, 4, 5, 6, 7, 8)=ton);
 end;

 declare
  type table_of_number is table of number;
  ton table_of_number;
 begin

  ton:= table_of_number();
  for i in reverse 3..8 loop
   ton.extend;
   ton( ton.COUNT) := i;
  end loop;
  testenv.test( td, table_of_number( 8, 7, 6, 5, 4, 3)=ton);
 end;

 testenv.checkComplainAndAdjustExpected( td, 4);

 testenv.checkComplainAndAdjustExpected( td, 0);
 for i in (select rownum, i, k from test) loop
  testenv.test( td, i.rownum=i.i and (3+i.rownum)=i.k);
 end loop;
 testenv.checkComplainAndAdjustExpected( td, 3);

 

 declare
  cursor c_test is select i, k from test;
 begin
  testenv.checkComplainAndAdjustExpected( td, 0);
  for i in c_test loop
   testenv.test( td, c_test%ROWCOUNT=i.i and (3+c_test%ROWCOUNT)=i.k);
  end loop;
  testenv.checkComplainAndAdjustExpected( td, 3);
 end;

 testenv.checkComplainAndAdjustExpected( td, 0);

 dbms_output.put_line( testenv.result( td));

end;
/
