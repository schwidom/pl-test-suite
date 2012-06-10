declare 

 td testenv.TESTDATA;

begin

 testenv.checkComplainAndAdjustExpected( td, 0);

 for f in ( select count(*) cnt from dual where '%' like '\%' escape '\')
 loop

  testenv.test( td, 1= f.cnt);

 end loop;

 for f in ( select count(*) cnt from dual where '%' like '\%')
 loop

  testenv.test( td, 0= f.cnt);

 end loop;

 testenv.checkComplainAndAdjustExpected( td, 2);

 dbms_output.put_line( testenv.result( td));

end;
/
