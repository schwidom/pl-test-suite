#include <stdio.h>

#include "testenv.h"

int main( int argc, char** argv)
{
 
 checkComplainAndAdjustExpected( 0);

 printf( "Hello World\n");

 checkComplainAndAdjustExpected( 0);

 printf( "%s\n", result());

 return 0;
}
