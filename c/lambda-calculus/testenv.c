
#include <stdio.h>
#include <stdarg.h>
#include <stdlib.h>

#include "testenv.h"

static int countOk= 0;
static int countFail= 0;
static int countLatest= 0;

void init()
{
 countOk= 0;
 countFail= 0;
 countLatest= 0;
}

void test( int b)
{
 if( b)
 {
  countOk+= 1;
 }
 else
 {
  countFail+= 1;
 }
}

int checkComplainAndAdjustExpected( int count) 
{ 
 int countTests= countOk + countFail; 
 int countTestsLocal= countTests - countLatest; 

 countLatest= countTests; 

 if( count == countTestsLocal) 
 { 
  return 1; 
 } 
 else 
 { 
  printf( "Expected Test Count (from last checkpoint to here) doesn't match: countTestsLocal:%d count: %d\n", countTestsLocal, count);
  return 0; 
 } 
} 

static char result_ret[1024]= "\n";

char* result()
{
 char* ret= result_ret;
 sprintf( result_ret, "tests: ok: %d fail: %d countLatest: %d", countOk, countFail, countLatest);
 return ret;
}



