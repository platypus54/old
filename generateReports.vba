
Function runReportRequest() As Boolean

     Dim answer As VbMsgBoxResult
    answer = MsgBox("Generate new employee assignments?", vbYesNo + vbQuestion)

    If answer = vbYes Then
        runReportRequest = True
    Else
        runReportRequest = False
    End If

End Function

Sub Button1_Click()

If runReportRequest = False Then Exit Sub

Dim bcklist As Worksheet
Set bcklist = Worksheets("BeautificationCheckList")

Dim wednesday As Range
Set wednesday = bcklist.Range("C5:C9")

Dim thursday As Range
Set thursday = bcklist.Range("C11:C19")

Dim friday As Range
Set friday = bcklist.Range("C21:C25")

Dim saturday As Range
Set saturday = bcklist.Range("C27:C31")

Dim sunday As Range
Set sunday = bcklist.Range("C33:C42")

Dim monday As Range
Set monday = bcklist.Range("C44:C49")

Dim tuesday As Range
Set tuesday = bcklist.Range("C51:C57")

'lazy approach - definitely should clean up'
generateAssignments monday
generateAssignments tuesday
generateAssignments wednesday
generateAssignments thursday
generateAssignments friday
generateAssignments saturday
generateAssignments sunday

MsgBox ("New assignments generated!")

End Sub

Sub generateAssignments(ByRef day As Range)

Dim bcklist As Worksheet
Set bcklist = Worksheets("Tables")

Dim empTable As ListObject
Set empTable = bcklist.ListObjects("EMPLOYEES")

Dim var As Range
For Each var In day.Cells
    var.value = lookUpEmployee(Int((empTable.ListRows.Count * Rnd) + 1))
Next var

End Sub

Function lookUpEmployee(ByVal id As Integer) As String

Dim bcklist As Worksheet
Set bcklist = Worksheets("Tables")

Dim empTable As ListObject
Set empTable = bcklist.ListObjects("EMPLOYEES")

Dim val As ListRow
For Each val In empTable.ListRows

    If id = val.Range.item(1, 2) Then
        lookUpEmployee = val.Range.item(1, 1)
    End If

Next val

End Function




