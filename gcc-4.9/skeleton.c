#include <stdio.h>

#include "testenv.h"

int main( int argc, char** argv)
{
 
 checkComplainAndAdjustExpected( 0);

 test( 1);

 checkComplainAndAdjustExpected( 1);

 printf( "%s\n", result());

 return 0;
}
