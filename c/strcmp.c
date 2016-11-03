#include <stdio.h>
#include <string.h>

#include "testenv.h"



int main( int argc, char** argv)
{
 
 checkComplainAndAdjustExpected( 0);

 test( 0==strcmp( "abc", "abc"));
 test( -1==strcmp( "ab", "abc"));
 test( -1==strcmp( "abc", "abd"));
 test( 1==strcmp( "abc", "ab"));
 test( 1==strcmp( "abd", "abc"));

 checkComplainAndAdjustExpected( 5);

 printf( "%s\n", result());

 return 0;
}
