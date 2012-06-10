#include <stdio.h>
#include <stdlib.h>

#include "testenv.h"

int main( int argc, char** argv)
{
 
 checkComplainAndAdjustExpected( 0);

 {
  int cnt_copy= 0;
  int cnt_extend= 0;
  size_t copy_state= 0;

  size_t size= 1;
  unsigned char *p= (unsigned char *)malloc( size);

  {

   int i= 0;

   for( ; i< size; i++)
    p[i ]= ( 0xaa + i);
  }

  if( NULL!=p)
  {

   while( 1)
   {
    size_t oldsize= size;
    unsigned char *oldp= p;

    size *= 2;

    p= realloc( p, size);

    if( p== oldp) cnt_extend++;
    else
    {
     cnt_copy++;
     if( 0 == copy_state)
      copy_state= size;
    }

    if( NULL==p) { p= oldp; break;}
    
    {

     int tst= 1;
     int i= 0;

     for( ; i< oldsize; i++)
      if( p[i ] != (unsigned char)( 0xaa + i) ) tst= 0;

     test( tst);
     checkComplainAndAdjustExpected( 1);

    }


    {

     int i= oldsize;

     for( ; i< size; i++)
      p[i ]= ( 0xaa + i);
    }

   }

   free( p);
  }

  test( 0< cnt_extend);
  checkComplainAndAdjustExpected( 1);

  printf( "additional info:\n");
  printf( "cnt_extend: %u (extended memory instead of copying, better)\n", cnt_extend);
  printf( "cnt_copy: %u (copied memory)\n", cnt_copy);
  printf( "copy_state: %lu (the size when copying was first needed to realloc memory)\n", copy_state);
 }

 checkComplainAndAdjustExpected( 0);

 printf( "%s\n", result());

 return 0;
}
