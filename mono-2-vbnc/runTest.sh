#!/bin/bash

test $# -eq 1 || { echo "usage $0 <test>.vb; <test>.vb has to reside in registered-tests.lst; exiting"; exit 1;}

FILE_VB=$1

test "${FILE_VB}" = "${FILE_VB/%.vb}" && { echo "${FILE_VB} does not end with '.vb'; exiting"; exit 1;}

test -f "${FILE_VB}" || { echo "$FILE_VB does not exist; exiting"; exit 1;}

grep >/dev/null "${FILE_VB}" registered-tests.lst || { echo "${FILE_VB} not registered in registered-tests.lst; exiting"; exit 1;}

MODULE="${FILE_VB/%.vb}"

FILE_MAIN="${MODULE}_Main.vb"
FILE_EXE="${MODULE}_Main.exe"

test -f "${FILE_MAIN}" ||
{

 cat <<EOF >"${FILE_MAIN}"
'generated from ${0}

Module Main

    Sub Main()
        Dim test As Test = New Test()
        ${MODULE}.Tests(test)
        test.CheckComplainAndAdjustExpected(0)
        Console.WriteLine( test.Result())
    End Sub

End Module
EOF
}

test "${FILE_VB}" -nt "${FILE_EXE}" &&
{
 
 rm -f "${FILE_EXE}"
 vbnc "${FILE_MAIN}" TestEnv.vb "${FILE_VB}"
}

mono "${FILE_EXE}"

