Sub exportList()

Dim tasks As Collection
Set tasks = getTasks

Dim dates As Collection
Set dates = getDates(tasks)

Dim records As Collection
Set records = timeStampTasks(tasks, dates)

End Sub
Function timeStampTasks(ByRef tasks As Collection, ByRef dates As Collection) As Collection

Set timeStampTasks = New Collection

Dim temp As Collection
Dim task As Range
Dim timeStamp As Integer
timeStamp = 1
For Each task In tasks
    Set temp = flattenArray(task.Value2, dates.item(timeStamp))
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

Function flattenArray(ByRef list As Variant, ByRef timeStamp As String) As Collection

Set flattenArray = New Collection
 Dim record As Collection
   
   For i = 1 To UBound(list)
        Set record = New Collection
        
        For j = 1 To UBound(list, 2)
            record.Add list(i, j)
        Next j

        record.Add (timeStamp)
        
        flattenArray.Add record
    Next i

End Function

