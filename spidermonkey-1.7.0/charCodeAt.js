
load( 'testenv.js');

te= testenv();

te.checkComplainAndAdjustExpected( 0);

te.test( 97 == 'abc'.charCodeAt( 0));
te.test( 98 == 'abc'.charCodeAt( 1));
te.test( 99 == 'abc'.charCodeAt( 2));

te.checkComplainAndAdjustExpected( 3);

print( te.result());

// see also: charCodeAt.js, fromCharCode.js

