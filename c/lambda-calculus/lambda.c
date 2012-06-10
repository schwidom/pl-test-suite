#include <stdlib.h>
#include <string.h>
#include <stdio.h>

#include "lambda.h"

const char const * SL_P = "P";
const char const * SL_V = "V";
const char const * SL_R = "R";
const char const * SL_F = "F";

struct stacklist *sl_make( const char const * type, char* key, void* value)
{
 struct stacklist *ret= (struct stacklist*) malloc( sizeof( struct stacklist));
 ret->type= type;
 ret->key= key;
 ret->value= value;
 return ret;
}

struct stacklist *sl_push( struct stacklist * sl_previous, const char const * type, char* key, void* value)
{
 struct stacklist *ret= sl_make( type, key, value);
 ret->previous= sl_previous;
 return ret;
}

struct stacklist *sl_insert( struct stacklist *sl_current, const char const * type, char* key, void* value)
{
 struct stacklist* sl_previous= sl_current->previous;
 struct stacklist *ret= sl_push( sl_previous, type, key, value);
 sl_current->previous= ret;
 return ret;
}

struct stacklist* sl_search_type( struct stacklist *sl_current, int nth, const char const * type)
{

 struct stacklist * ret;

 for( ret= sl_current; ret; ret=ret->previous)
 {
  if( 0==strcmp( type, ret->type))
   if( 0==nth) return ret;
   else nth--;
 }

 fprintf( stderr, "sl_search_type: not found: %d %s\n", nth, type);
 return NULL;
}

struct stacklist* sl_search_key( struct stacklist *sl_current, int nth, const char const * key)
{

 struct stacklist * ret;

 for( ret= sl_current; ret; ret=ret->previous)
 {
  if( 0==strcmp( key, ret->key))
   if( 0==nth) return ret;
   else nth--;
 }

 fprintf( stderr, "sl_search_key: not found: %d %s\n", nth, key);
 return NULL;
}

struct stacklist* sl_search_type_and_key( struct stacklist *sl_current, int nth, const char const * type, const const char const * key)
{

 struct stacklist * ret;

 for( ret= sl_current; ret; ret=ret->previous)
 {
  if( 0==strcmp( type, ret->type) && 0==strcmp( key, ret->key))
   if( 0==nth) return ret;
   else nth--;
 }

 fprintf( stderr, "sl_search_type_and_key: not found: %d %s %s\n", nth, type, key);
 return NULL;
}

int sl_call( struct stacklist *sl_current)
{
 struct stacklist * sl_f= sl_search_type( sl_current, 0, SL_F);
 if( ! sl_f ) return 0;
 ((void (*) (struct stacklist *)) sl_f->value) (sl_current); // na hoffentlich ist es dasselbe
 //void (*f) (struct stacklist *) = sl_f->value;
 //f( sl_current);
 return 1;
}

