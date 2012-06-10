declare 

 td testenv.TESTDATA;

begin

 testenv.checkComplainAndAdjustExpected( td, 0);

 begin 
  execute immediate 'select 1 from dual';
  testenv.test( td, true);
 end;

 declare
  res NUMBER;
 begin null;
  execute immediate 'select 1 from dual' into res;
  testenv.test( td, 1=res);
 end;

 declare
  res NUMBER;
 begin null;
  execute immediate 'select 1 from dual where 2=:zwei' into res using 2 ;
  testenv.test( td, 1=res);
 end;

 declare
  res NUMBER;
 begin null;
  execute immediate 'select 1 from dual where 2=:zwei' into res using 3 ;
  testenv.test( td, false);
 exception
  when NO_DATA_FOUND then
   testenv.test( td, true);
 end;

 testenv.checkComplainAndAdjustExpected( td, 4);

 dbms_output.put_line( testenv.result( td));

end;
/
