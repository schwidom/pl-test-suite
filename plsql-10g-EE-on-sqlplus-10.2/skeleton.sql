declare 

 td testenv.TESTDATA;

begin

 testenv.checkComplainAndAdjustExpected( td, 0);

 testenv.test( td, true);

 testenv.checkComplainAndAdjustExpected( td, 1);

 dbms_output.put_line( testenv.result( td));

end;
/
