#include <stdio.h>

#include "testenv.h"

#include "lambda.h"

int main( int argc, char** argv)
{
 
 checkComplainAndAdjustExpected( 0);

 {
  struct stacklist * sl_root= sl_make( "F", "main", main);
 
  struct stacklist * sl_top= sl_root;

  sl_top= sl_push( sl_top, "A", "a", NULL);

  sl_top= sl_push( sl_top, "B", "b", NULL);

  sl_insert( sl_top, "C", "c", NULL);

  test( sl_search_type( sl_top, 0, "A") == sl_search_key( sl_top, 0, "a"));
  test( sl_search_type( sl_top, 0, "B") == sl_search_key( sl_top, 0, "b"));
  test( sl_search_type( sl_top, 0, "B") != sl_search_key( sl_top, 0, "a"));

  checkComplainAndAdjustExpected( 3);

  test( NULL != sl_search_type( sl_top, 0, "C"));
  test( NULL != sl_search_type( sl_top, 0, "B"));
  test( NULL == sl_search_type( sl_search_type( sl_top, 0, "C"), 0, "B"));
  test( NULL != sl_search_type( sl_search_type( sl_top, 0, "B"), 0, "C"));

  checkComplainAndAdjustExpected( 4);
 }

 checkComplainAndAdjustExpected( 0);

 printf( "%s\n", result());

 return 0;
}
