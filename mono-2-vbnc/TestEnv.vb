Module TestEnv

    Class Test

        Protected countOk As Integer = 0
        Protected countFail As Integer = 0
        Protected countLatest As Integer = 0
        Protected countRelativeExpected As Integer = 0

        Sub Test( ByVal value As Boolean)
            If (value) Then
                countOK += 1
            Else
                countFail += 1
                Console.WriteLine("fail")
                'Console.WriteLine(New Exception().ToString())
                'Console.WriteLine("" & New Exception().Source()) 'nicht verfuegbar
                'Console.WriteLine("" & New Exception().StackTrace()) 'nicht verfuegbar
                'Console.WriteLine("fail")

            End If

        End Sub

        Sub CheckComplainAndAdjustExpected( ByRef count As Integer)
            Dim countTests As Integer = countOk + countFail
            Dim countTestsLocal As Integer = countTests - countLatest

            countLatest = countTests

            If Not count = countTestsLocal Then
                Console.WriteLine("Expected Test Count doesn't match:" & " countTestsLocal : " & countTestsLocal & " count: " & count)
            End If

        End Sub

        Function Result() As String
            Return "Tests: countOK: " & countOk & " countFail: " & countFail & " countLatest: " & countLatest
        End Function

    End Class

End Module
