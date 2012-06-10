drop table test;
create table test ( i NUMBER);

declare 

 td testenv.TESTDATA;

begin

 insert into test values ( 1);
 insert into test values ( 2);
 insert into test values ( 3);

 testenv.checkComplainAndAdjustExpected( td, 0);

 for i in (select level l, sys_connect_by_path( i, '/') cbp, prior i x, i y, connect_by_root i z
  from test connect by prior i < i start with i=2)
 loop

  if i.x is null then
   testenv.test( td, 1=i.l and '/2'=i.cbp and i.x is null and 2=i.y and 2= i.z);
  else
   testenv.test( td, 2=i.l and '/2/3'=i.cbp and 2=i.x and 3=i.y and 2= i.z);
  end if;

 end loop;

 testenv.checkComplainAndAdjustExpected( td, 2);

 dbms_output.put_line( testenv.result( td));

end;
/
