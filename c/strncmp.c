#include <stdio.h>

#include "testenv.h"

int main( int argc, char** argv)
{
 
 checkComplainAndAdjustExpected( 0);

 test( 0==strncmp( "abc", "abc", 3));
 test( 0==strncmp( "ab", "abc", 2));
 test( -1==strncmp( "ab", "abc", 3));
 test( 0==strncmp( "abc", "abd", 2));
 test( -1==strncmp( "abc", "abd", 3));
 test( 0==strncmp( "abc", "ab", 2));
 test( 1==strncmp( "abc", "ab", 3));
 test( 0==strncmp( "abd", "abc", 2));
 test( 1==strncmp( "abd", "abc", 3));

 checkComplainAndAdjustExpected( 9);

 printf( "%s\n", result());

 return 0;
}
