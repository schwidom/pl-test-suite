#include <stdio.h>

#include "testenv.h"

#include "lambda.h"

void y( struct stacklist * sl) // y f = f (y f)
{

 struct stacklist * sl_p_f= sl_search_type_and_key( sl, 0, SL_P, "f");

 struct stacklist * sl_y= sl_push( sl, SL_F, "y", y);
 sl_y= sl_push( sl_y, SL_P, "f", sl_p_f->value);

 struct stacklist * sl_f= sl_push( sl, SL_F, "f", sl_p_f->value);
 sl_f= sl_push( sl_f, SL_P, "(y f)", sl_y);

 sl_call( sl_f);

 sl_insert( sl, SL_R, "y-ret", sl_search_type( sl_f, 0, SL_R)->value);
}

// stack: variable, variable, variable, ..., function, parameter, parameter, parameter ..., sf_current
// sl_call( sf_current)
// stack: variable, variable, variable, ..., function, parameter, parameter, parameter ... retvalue, retvalue, ..., sf_current

void fac( struct stacklist * sl) // fac= (\f n -> if (n==0) then 1 else n * f (n-1))
{

 struct stacklist * sl_p_sl_y= sl_search_type_and_key( sl, 0, SL_P, "(y f)");
 struct stacklist * sl_p_n= sl_search_type_and_key( sl, 0, SL_P, "n");

 struct stacklist * sl_y= (struct stacklist *) sl_p_sl_y->value;
 int n= (int) sl_p_n->value;

 int ret;

 if( 0==n)
 {
  sl_insert( sl, SL_R, "fac-ret", (void*)1);
 }
 else 
 {
  sl_y= sl_push( sl_y, SL_P, "n", (void*) n - 1);
  sl_call( sl_y);
  struct stacklist * sl_y_ret= sl_search_type_and_key( sl_y, 0, SL_R, "y-ret");
  sl_insert( sl, SL_R, "fac-ret", (void*)( n * (int) sl_y_ret->value));
 }
}

int main( int argc, char** argv)
{
 
 checkComplainAndAdjustExpected( 0);

 { // ((y fac) n)

  struct stacklist * sl2call= NULL;
  struct stacklist * sl = sl_make( SL_P, "root", NULL);
  sl= sl_push( sl, SL_F, "y", y);
  sl= sl_push( sl, SL_P, "f", fac);

  sl2call= sl_push( sl, SL_P, "n", (void *) 5);
  sl_call( sl2call);
  test( 120==(int)sl_search_type_and_key( sl2call, 0, SL_R, "y-ret")->value);
  
  sl2call= sl_push( sl, SL_P, "n", (void *) 3);
  sl_call( sl2call);
  test( 6==(int)sl_search_type_and_key( sl2call, 0, SL_R, "y-ret")->value);
  
  sl2call= sl_push( sl, SL_P, "n", (void *) 4);
  sl_call( sl2call);
  test( 24==(int)sl_search_type_and_key( sl2call, 0, SL_R, "y-ret")->value);
  
 }

 checkComplainAndAdjustExpected( 3);

 printf( "%s\n", result());

 return 0;
}
