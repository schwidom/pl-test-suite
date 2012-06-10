declare 

 td testenv.TESTDATA;

begin

 testenv.checkComplainAndAdjustExpected( td, 0);

 declare
  type table_of_number is table of number;
  ton table_of_number;
 begin

  ton:= table_of_number();
  for i in 3..8 loop
   ton.extend;
   ton( ton.COUNT) := i;
  end loop;
  testenv.test( td, 3= ton( ton.FIRST));
  testenv.test( td, 8= ton( ton.LAST));
  testenv.test( td, 6= ton.COUNT);
  testenv.test( td, table_of_number( 3, 4, 5, 6, 7, 8)=ton);
 end;

 testenv.checkComplainAndAdjustExpected( td, 4);

 dbms_output.put_line( testenv.result( td));

end;
/
