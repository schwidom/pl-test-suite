#!/bin/bash

cat <<EOF >AllTests_Main.vb
'generated from ${0}

Module Main

    Sub Main()
        Dim test As Test = New Test()
$( for i in $( cat registered-tests.lst); do 
 echo "        ${i/%.vb}.Tests(test)"
done)
        test.CheckComplainAndAdjustExpected(0)
        Console.WriteLine( test.Result())
    End Sub

End Module
EOF

vbnc AllTests_Main.vb TestEnv.vb $(cat registered-tests.lst)

mono AllTests_Main.exe

