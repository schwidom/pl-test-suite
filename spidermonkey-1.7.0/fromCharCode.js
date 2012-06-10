
load( 'testenv.js');

te= testenv();

te.checkComplainAndAdjustExpected( 0);

te.test( 'abc'==String.fromCharCode( 97, 98, 99));

te.checkComplainAndAdjustExpected( 1);

print( te.result());

// see also: charCodeAt.js, fromCharCode.js

