Function runExport() As Boolean

     Dim answer As VbMsgBoxResult
    answer = MsgBox("Are you sure you want to export worksheet to table?", vbYesNo + vbQuestion)

    If answer = vbYes Then
        runExport = True
    Else
        runExport = False
    End If

End Function

Sub exportList()

If runExport = False Then Exit Sub
If isDateFound = True Then Exit Sub

Dim tasks As Collection
Set tasks = getTasks

Dim dates As Collection
Set dates = getDates(tasks)

Dim records As Collection
Set records = timeStampTasks(tasks, dates)

Dim day As Collection

For Each day In records
     addRecordsToTable day
Next day

MsgBox ("Worksheet has been exported to table")

End Sub

Sub addRecordsToTable(ByRef record As Collection)

Dim summaryWorkSheet As Worksheet
Set summaryWorkSheet = Worksheets("Tables")

Dim beautificationLog As ListObject
Set beautificationLog = summaryWorkSheet.ListObjects("BEAUTIFICATIONLOG")

Dim newRow As ListRow

Dim g As Collection
For Each g In record
    
    Set newRow = beautificationLog.ListRows.Add
        
    newRow.Range(1, 1).value = g.item(1)
    newRow.Range(1, 2).value = g.item(2)
    
    If g.item(3) = Empty Then
        newRow.Range(1, 3).value = "incomplete"
    Else
        newRow.Range(1, 3).value = "complete"
    End If
    
   newRow.Range(1, 4).value = sliceDate(g.item(4))

    
Next g


End Sub

Function sliceDate(ByVal val As String) As String
        
        Dim s As Variant
        s = Split(val, "-")
        sliceDate = Trim(s(1))
        
End Function


Function timeStampTasks(ByRef tasks As Collection, ByRef dates As Collection) As Collection

Set timeStampTasks = New Collection

Dim temp As Collection
Dim task As Range
Dim timeStamp As Integer
timeStamp = 1
For Each task In tasks
    Set temp = extractTasks(task.Value2, dates.item(timeStamp))
    timeStampTasks.Add temp
    timeStamp = timeStamp + 1
Next task

End Function


Function getDates(ByRef tasks As Collection)

    Set getDates = New Collection
    
    Dim i As Range
    For Each i In tasks
       getDates.Add i.Value2(1, 1)
    Next i

End Function


Function generateTaskRanges() As Collection

Set generateTaskRanges = New Collection
generateTaskRanges.Add "B4:D9"
generateTaskRanges.Add "B10:D19"
generateTaskRanges.Add "B20:D25"
generateTaskRanges.Add "B26:D31"
generateTaskRanges.Add "B32:D42"
generateTaskRanges.Add "B43:D49"
generateTaskRanges.Add "B50:D57"

End Function

Function getTasks() As Collection

Dim bcklist As Worksheet
Set bcklist = Worksheets("BeautificationCheckList")

Dim taskRanges As Collection
Set taskRanges = generateTaskRanges

Set getTasks = New Collection

Dim taskRange As Variant
For Each taskRange In taskRanges
       getTasks.Add bcklist.Range(taskRange)
Next taskRange


End Function

Function extractTasks(ByRef list As Variant, ByRef timeStamp As String) As Collection

Set extractTasks = New Collection
 Dim record As Collection
   
   For i = 2 To UBound(list)
        Set record = New Collection
        
        For j = 1 To UBound(list, 2)
            record.Add list(i, j)
        Next j

        record.Add (timeStamp)
        
        extractTasks.Add record
    Next i

End Function

Function isDateFound() As Boolean

Dim currentDate As String
 currentDate = Worksheets("BeautificationChecklist").Range("E2").Text

Dim beautificationLog As ListObject
Set beautificationLog = Worksheets("Tables").ListObjects("BEAUTIFICATIONLOG")

Dim assignmentDates As Range
Set assignmentDates = beautificationLog.ListColumns(4).Range

Dim dateToFind As Range
For Each dateToFind In assignmentDates
    If dateToFind.value = currentDate Then
        isDateFound = True
        MsgBox ("Date found in table. Worksheet was not exported")
        Exit Function
    End If
 Next dateToFind
 

End Function
