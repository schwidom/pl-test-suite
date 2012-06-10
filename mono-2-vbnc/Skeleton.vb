Namespace Skeleton

    Module Skeleton

        Sub Tests( ByRef test As Test)

            test.CheckComplainAndAdjustExpected(0)
            test.Test(True)
            test.CheckComplainAndAdjustExpected(1)

        End Sub
    End Module
End Namespace

