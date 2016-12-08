#include <stdio.h>

#include "testenv.h"

typedef void* (*fpv) (void*);
typedef void* (*fpv2) (void*,void*);

void* y( fpv2 fl, fpv flreturn) { // Y-Combinator

 void* fret( void* p){

  void* callwithP( void* f) { fpv fl= f; return fl( p); }

  return fl( fret, callwithP);
 }

 return flreturn( fret);
}

void* fak( void* f, void* freturn) { // factorial

 fpv fl= f;
 fpv flreturn= freturn;

 void* fret( void* n) {
  
  long nl= (long) n;

  if( 0L==nl) return (void*) 1L;
  return (void*) ( nl * ( (long)fl( (void*) (nl - 1)))) ;
 }

 return flreturn( fret);
}

int main( int argc, char** argv) {

 void* callwith0( void* f) {
  fpv fl= f;
  return fl( 0);
 }

 void* callwith1( void* f) {
  fpv fl= f;
  return fl( (void*) 1);
 }

 void* callwith2( void* f) {
  fpv fl= f;
  return fl( (void*) 2);
 }

 void* callwith3( void* f) {
  fpv fl= f;
  return fl( (void*) 3);
 }

 void* callwith4( void* f) {
  fpv fl= f;
  return fl( (void*) 4);
 }

 checkComplainAndAdjustExpected( 0);

 test( 1 == (long)y( fak, callwith0));
 test( 1 == (long)y( fak, callwith1));
 test( 2 == (long)y( fak, callwith2));
 test( 6 == (long)y( fak, callwith3));
 test( 24 == (long)y( fak, callwith4));

 checkComplainAndAdjustExpected( 5);

 printf( "%s\n", result());

 return 0;
}

