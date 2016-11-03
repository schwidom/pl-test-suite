#include <stdio.h>

#include "testenv.h"

int main( int argc, char** argv)
{
 
 checkComplainAndAdjustExpected( 0);

 // char s1[]="1\0

 test( 0 == '\0');
 test( 0 == '\00');
 test( 0 == '\000');
 // test( 0 == '\0000'); // warning: multi-character character constant [-Wmultichar]

 test( '1' == "1\0"[0]);

 test( 0 == "1\0"[2]);

 checkComplainAndAdjustExpected( 5);

 test( 0 == "1\0"[1]);
 test( 0 == "1\00"[1]);
 test( 0 == "1\000"[1]);
 test( 0 == "1\0000"[1]);
 test( 0 == "1\0000000000000000000"[1]);

 checkComplainAndAdjustExpected( 5);

 test( 2 == "1\2"[1]);
 test( 2 == "1\02"[1]);
 test( 2 == "1\002"[1]);
 test( 8 == "1\010"[1]); // oktal
 test( '2' == "1\0002"[2]); // oktal 0, danach char 2

 checkComplainAndAdjustExpected( 5);

 test( 2 == "1\x2"[1]);
 test( 2 == "1\x02"[1]);
 test( 2 == "1\x002"[1]);
 test( 0 == "1\x00""2"[1]); // "" ist die Lösung zum eindeutigen Begrenzen von Hexwerten
 test( '2' == "1\x00""2"[2]); // "" ist die Lösung zum eindeutigen Begrenzen von Hexwerten
 test( 2 == "1\x0002"[1]);
 test( 2 == "1\x00002"[1]);
 test( 2 == "1\x000002"[1]);
 test( 2 == "1\x00000000000000000000000002"[1]);
 test( 0 == "1\x00000000000000000000000002"[2]);

 checkComplainAndAdjustExpected( 10);

 // test( 2 == "1\u2"[1]); // warning: universal character names are only valid in C++ and C99
 // test( 2 == "1\U2"[1]); // warning: universal character names are only valid in C++ and C99
 // test( 2 == "1\X2"[1]); // warning: unknown escape sequence: '\X'

 checkComplainAndAdjustExpected( 0);

 test( 15 == "1\x0000000000000000000000000F"[1]);
 test( -1 == "1\x000000000000000000000000FF"[1]);

 test( -1 == (signed char) 255);
 test( -1 != (signed int) 255);
 test( (unsigned char) 255 != (signed char) 255);
 test( (unsigned char) 1 == (signed char) 1);
 test( (unsigned char) 127 == (signed char) 127);
 test( (unsigned char) 128 != (signed char) 128);
 test( (unsigned char) -1 != (signed char) -1);

 checkComplainAndAdjustExpected( 9);

 test( 15 == "1\xF"[1]);
 test( 0 == "1\xF"[2]);

 test( -1 == "1\xFF"[1]);
 test( 255 != "1\xFF"[1]);
 test( 0 == "1\xFF"[2]);

 // test( -1 == "1\xFFF"[1]); // warning: hex escape sequence out of range

 checkComplainAndAdjustExpected( 5);

 test( 7 == '\a'); // bell
 test( 8 == '\b'); // backspace
 test( 9 == '\t'); // horizontal tab
 test( 10 == '\n'); // new line
 test( 11 == '\v'); // vertical tab
 test( 12 == '\f'); // form feed
 test( 13 == '\r'); // carriage ret

 // test( 3 == '\cD'); // warning: unknown escape sequence: '\c' (exists in bash)

 test( 92 == '\\'); // backslash '\' in bash
 test( 39 == '\''); // single quote "'" in bash
 test( 34 == '"'); // double quote '"' in bash

 checkComplainAndAdjustExpected( 10);

 printf( "%s\n", result());

 return 0;
}
