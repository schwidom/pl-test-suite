Namespace TestTest

    Module TestTest

        Sub Tests( ByRef test As Test)

            test.CheckComplainAndAdjustExpected(0)
            test.Test(True)
            test.Test(True)
            test.CheckComplainAndAdjustExpected(2)
            test.Test(True)
            test.Test(True)
            test.Test(True)
            test.CheckComplainAndAdjustExpected(3)

        End Sub
    End Module
End Namespace

