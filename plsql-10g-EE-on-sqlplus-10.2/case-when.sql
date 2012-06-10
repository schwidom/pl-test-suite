declare 

 td testenv.TESTDATA;

 tmp NUMBER;

begin

 testenv.checkComplainAndAdjustExpected( td, 0);

 testenv.test( td, (case when true then true end));
 testenv.test( td, (case when true then true when true then false end));
 testenv.test( td, (case when false then false when true then true end));
 testenv.test( td, (case when false then false else true end));

 testenv.test( td, (case 1 when 1 then true end));
 testenv.test( td, (case 1 when 2 then false when 1 then true end));
 testenv.test( td, (case 1 when 2 then false else true end));

 select (case when 1=1 then 1 else 2 end) into tmp from dual; -- no boolean datatype in oracle-sql possible
 testenv.test( td, 1=tmp);

 select (case 1 when 1 then 1 else 2 end) into tmp from dual; -- no boolean datatype in oracle-sql possible
 testenv.test( td, 1=tmp);

 case
  when true then testenv.test( td, true);
  else testenv.test( td, false);
 end case;

 case 1
  when 1 then testenv.test( td, true);
  else testenv.test( td, false);
 end case;

 testenv.checkComplainAndAdjustExpected( td, 11);

 dbms_output.put_line( testenv.result( td));

end;
/
