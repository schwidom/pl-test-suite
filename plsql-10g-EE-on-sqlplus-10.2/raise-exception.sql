declare 

 td testenv.TESTDATA;

begin

 testenv.checkComplainAndAdjustExpected( td, 0);

 declare
  MY_EXCEPTION exception;
 begin
  testenv.test( td, true);
  raise MY_EXCEPTION;
  testenv.test( td, false);
 exception
  when MY_EXCEPTION then
   testenv.test( td, true);
 end;

 testenv.checkComplainAndAdjustExpected( td, 2);

 dbms_output.put_line( testenv.result( td));

end;
/
