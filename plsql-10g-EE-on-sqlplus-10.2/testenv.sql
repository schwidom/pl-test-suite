create or replace package testenv
as

 type TESTDATA is record ( countOk NUMBER, countFail NUMBER, countLatest NUMBER);

 function checkComplainAndAdjustExpected( td IN OUT NOCOPY TESTDATA, cnt NUMBER) return BOOLEAN;
 procedure checkComplainAndAdjustExpected( td IN OUT NOCOPY TESTDATA, cnt NUMBER);

 procedure test( td IN OUT NOCOPY TESTDATA, b BOOLEAN);

 procedure testOk( td IN OUT NOCOPY TESTDATA);
 procedure testFail( td IN OUT NOCOPY TESTDATA);

 function result( td TESTDATA) return VARCHAR2;

end testenv;
/


create or replace package body testenv
as

 function checkComplainAndAdjustExpected( td IN OUT NOCOPY TESTDATA, cnt NUMBER) return BOOLEAN is 

  countTests NUMBER := nvl( td.countOk, 0) + nvl( td.countFail, 0);
  countTestsLocal NUMBER := countTests - nvl( td.countLatest, 0);

 begin

  td.countLatest := countTests;
 
  if cnt= countTestsLocal then return true; 

  else
   dbms_output.put_line( 'Expected Test Count (from last checkpoint to here) doesn''t match: countTestsLocal:' || countTestsLocal || ' count: ' || cnt);
   return false;
  end if;

 end;

 procedure checkComplainAndAdjustExpected( td IN OUT NOCOPY TESTDATA, cnt NUMBER) is
  tmp BOOLEAN;
 begin
  tmp := checkComplainAndAdjustExpected( td, cnt);
 end;

 procedure test( td IN OUT NOCOPY TESTDATA, b BOOLEAN)
 is
 begin

  if b then
   td.countOk := 1+ nvl( td.countOk, 0);
  else
   td.countFail := 1+ nvl( td.countFail, 0);
   dbms_output.put_line( 'test failed');
  end if;
 end;
 
 procedure testOk( td IN OUT NOCOPY TESTDATA) is begin test( td, true); end;
 procedure testFail( td IN OUT NOCOPY TESTDATA) is begin test( td, false); end;

 function result( td TESTDATA) return VARCHAR2 is 
 begin
  return 'tests: ok: '|| nvl( td.countOk, 0)|| ' fail: '|| nvl( td.countFail, 0)|| ' countLatest: '|| nvl( td.countLatest, 0);
 end;

end testenv;
/

