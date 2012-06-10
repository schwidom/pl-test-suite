#include <stdio.h>

#include "testenv.h"

int main( int argc, char** argv)
{
 
 checkComplainAndAdjustExpected( 0);

 test( 1);
 test( 1);

 checkComplainAndAdjustExpected( 2);

 test( 1);
 test( 1);
 test( 1);

 checkComplainAndAdjustExpected( 3);
 
 printf( "%s\n", result());

 return 0;
}
