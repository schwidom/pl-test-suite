Namespace Operators

    Module Operators

        Sub Tests( ByVal test As Test)
            test.CheckComplainAndAdjustExpected(0)
            test.Test(True)
            test.Test(3 = 2 + 1)
            test.Test(3 = 8 Mod 5)
            test.Test(-2 = -2 Mod 5)
            test.Test(3 = 6 / 2)
            test.Test("ab" = "a" & "b")
            test.Test(3 <> 4)
            test.Test(4 <> 3)
            test.Test(3 < 4)
            test.Test(4 > 3)
            test.Test(3 = 3.0)
            test.Test("a3" = "a" & 3)
            test.CheckComplainAndAdjustExpected(12)
        End Sub


    End Module
End Namespace

