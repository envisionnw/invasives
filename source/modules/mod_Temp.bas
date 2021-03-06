Option Compare Database
Option Explicit

' =================================
' MODULE:       mod_Temp
' Level:        Framework module
' Version:      1.00
' Description:  Temporary object related functions & subroutines
' Requires:     -
'
' Source/date:  Bonnie Campbell, April 2017
' Revisions:    BLC, 4/28/2017 - 1.00 - initial version
'                                       removed Delete_All_Records() to mod_Db
'                                       added SetTempVar(), GetTempVarIndex(),
'                                       CreateTempTable(), RemoveTempTable(),
'                                       CreateTempRecordset(), CreateTempRecords()
'                                       from mod_Db
' =================================

' ---------------------------------
'   TempVar Related Methods/Functions
' ---------------------------------

' ---------------------------------
' SUB:          SetTempVar
' Description:  Checks if TempVar exists, creates it if not, & sets value
' Assumptions:  -
' Parameters:   strVar - TempVar name (string)
'               Val - value to set (variant)
' Returns:      -
' Throws:       none
' References:   none
' Source/date:  -
' Adapted:      Bonnie Campbell, January 9, 2017 - for NCPN tools
' Revisions:
'   BLC - 1/9/2017 - initial version
' ---------------------------------
Public Sub SetTempVar(strVar As String, val As Variant)
On Error GoTo Err_Handler

    If Not TempVars(strVar) Is Nothing Then
        TempVars(strVar) = val
    Else
        TempVars.Add strVar, val
    End If
    
Exit_Handler:
    Exit Sub

Err_Handler:
    Select Case Err.Number
      Case Else
        MsgBox "Error #" & Err.Number & ": " & Err.Description, vbCritical, _
            "Error encountered (#" & Err.Number & " - SetTempVar[mod_Db])"
    End Select
    Resume Exit_Handler
End Sub

' ---------------------------------
' FUNCTION:     GetTempVarIndex
' Description:  Retrieves the index of a TempVar item
' Parameters:   strItem - item name(string)
' Returns:      index of item, if found (integer); not found returns -1
' Throws:       -
' References:   -
' Source/date:  Dal Jeanis, 7/11/2013
'               http://www.accessforums.net/modules/demo-module-vba-code-syntax-using-tempvars-36353.html
' Adapted:      Bonnie Campbell, Sep 1, 2014
' Revisions:    BLC, 9/1/2014 - initial version
'               BLC, 4/30/2015 - moved from mod_Utilities to mod_Db
' ---------------------------------
Public Function GetTempVarIndex(strItem) As String
On Error GoTo Err_Handler

Dim i As Integer

    For i = 0 To [TempVars].Count - 1
        If [TempVars].item(i).Name = strItem Then
            'fetch the index and exit
            GetTempVarIndex = i
            Exit Function
        End If
    Next i
    
    'none found -> return -1
    GetTempVarIndex = -1
    
Exit_Handler:
    Exit Function

Err_Handler:
    Select Case Err.Number
      Case Else
        MsgBox "Error #" & Err.Number & ": " & Err.Description, vbCritical, _
            "Error encountered (#" & Err.Number & " - GetTempVarIndex[mod_Db])"
    End Select
    Resume Exit_Handler
End Function

' ---------------------------------
'  Temp Object Methods/Functions
' ---------------------------------

' ---------------------------------
' SUB:          CreateTempTable
' Description:  creates a temp table from an array containing table field definitions
' Assumptions:  field array is 1-dimensional
'               fields are represented with name|type|length/size|required|allowZLS
'               only name|type are required (except for dbText where length/size is also reqd)
'               ex: "col1|CStr(dbText)|2|True|False"
'               data array includes same # of columns as fields array
' Parameters:   tblName - table name (string)
'               aryFields - array containing field definitions (variant)
' Returns:
' References:
' Source/date:  Bonnie Campbell, September 20 2016
' Revisions:    BLC, 9/20/2016 - initial version
' ---------------------------------
Public Sub CreateTempTable(tblName As String, aryFields() As Variant)
On Error GoTo Err_Handler

    'check for blank table name or no fields
    If Not IsArray(aryFields) Or Len(tblName) = 0 Then GoTo Exit_Handler
    
    Dim Db As DAO.Database
    Dim tdf As DAO.TableDef
    Dim fld As DAO.Field
    Dim item As Variant, fldDef As Variant
    Dim i As Integer

    Set Db = CurrentDb()
    
    'delete it if it already exists
    If TableExists(tblName) Then RemoveTempTable (tblName)
    
    Set tdf = Db.CreateTableDef(tblName)
    
    'prepare array
    For Each item In aryFields
    
        'fldDef(0) = name, fldDef(1) = type, fldDef(2) = length (as applicable)
        fldDef = Split(item, "|")
        
        'establish field w/ name & type
        Set fld = tdf.CreateField(fldDef(0), CLng(fldDef(1)))
        
        'add attributes - size (if applicable), required & allow ZLS
        For i = LBound(fldDef) To UBound(fldDef)
            Select Case i
                Case 0  'column name
                Case 1  'column type
                Case 2  'column size
                    fld.Size = fldDef(2)
                Case 3  'column required
                    fld.Required = fldDef(3)
                Case 4  'column allow ZLS
                    fld.AllowZeroLength = fldDef(4)
                Case 5
                Case Else
            End Select
        Next
        tdf.Fields.Append fld
        tdf.Fields.Refresh
    Next
    
    'add table
    Db.TableDefs.Append tdf
    
    'update window
    Db.TableDefs.Refresh
    RefreshDatabaseWindow
    
    'cleanup
'    db.Close

Exit_Handler:
    Exit Sub

Err_Handler:
    Select Case Err.Number
      Case Else
        MsgBox "Error #" & Err.Number & ": " & Err.Description, vbCritical, _
            "Error encountered (#" & Err.Number & " - CreateTempTable[mod_Temp])"
    End Select
    Resume Exit_Handler
End Sub

' ---------------------------------
' SUB:          RemoveTempTable
' Description:  removes a temp table from database
' Assumptions:  -
' Parameters:   tblName - table name (string)
' Returns:      -
' References:   -
' Source/date:  Bonnie Campbell, September 20 2016
' Revisions:    BLC, 9/20/2016 - initial version
' ---------------------------------
Public Sub RemoveTempTable(tblName As String)
On Error GoTo Err_Handler

    'check for blank table name
    If Len(tblName) = 0 Then GoTo Exit_Handler

    'check if table exists
    If TableExists(tblName) Then
    
        'delete table
        DoCmd.DeleteObject acTable, tblName
    
    End If
    
Exit_Handler:
    Exit Sub

Err_Handler:
    Select Case Err.Number
      Case Else
        MsgBox "Error #" & Err.Number & ": " & Err.Description, vbCritical, _
            "Error encountered (#" & Err.Number & " - RemoveTempTable[mod_Temp])"
    End Select
    Resume Exit_Handler
End Sub

' ---------------------------------
' FUNCTION:     CreateTempRecordset
' Description:  creates a temporary DAO recordset
' Parameters:   strTemplate - name of virtual table (string)
'               iCount - number of records (integer)
' Returns:      rs - recordset containing # of records = iCount (DAO.recordset)
' Assumptions:  the temporary recordset is used in limited instances when
'               a recordset is needed but doesn't exist
' Throws:       none
' References:
' Source/date:  Bonnie Campbell, June 2016
' Revisions:    BLC, 6/8/2016 - initial version
' ---------------------------------
Public Function CreateTempRecordset(iCount As Integer) As DAO.Recordset
On Error GoTo Err_Handler

    Dim rs As DAO.Recordset
    Dim strSQL As String
    Dim i As Integer
    
'    strSQL = "SELECT * FROM usys_Temp_Table;"
    
    Set rs = CurrentDb.OpenRecordset("usys_Temp_Table") 'strSQL, dbOpenSnapshot)

    'add records to recordset
    For i = 1 To iCount

        rs.AddNew
        rs.Fields(0) = i 'number integer field
        rs.Update
    Next
       
    Set CreateTempRecordset = rs

Exit_Handler:
    Exit Function

Err_Handler:
    Select Case Err.Number
      Case Else
        MsgBox "Error #" & Err.Number & ": " & Err.Description, vbCritical, _
            "Error encountered (#" & Err.Number & " - CreateTempRecordset[mod_Temp])"
    End Select
    Resume Exit_Handler
End Function

' ---------------------------------
' SUB:          CreateTempRecords
' Description:  fills a temporary table of numbers
'               first clears usys_temp_table of values, then populates w/ desired set of #s
' Parameters:   iCount - number of records (integer)
'               iStart - starting point (integer)
' Returns:      rs - recordset containing # of records = iCount (DAO.recordset)
' Assumptions:  used for reports when a recordset doesn't exist for the report
'               but it is necessary to repeat the report detail
' Throws:       none
' References:
' Source/date:  Bonnie Campbell, June 2016
' Revisions:    BLC, 6/8/2016 - initial version
' ---------------------------------
Public Sub CreateTempRecords(iStart As Integer, iCount As Integer)
On Error GoTo Err_Handler

    Dim strSQL As String, strSQLDelete As String, strSQLInsert As String
    Dim i As Integer
    
    'clear table
    strSQLDelete = GetTemplate("d_usys_temp_table")
    
    DoCmd.SetWarnings False
    DoCmd.RunSQL strSQLDelete
    DoCmd.SetWarnings True
    
    'prep for inserts
    strSQL = GetTemplate("i_usys_temp_table")
     
    'add records to table
    For i = iStart To iCount

        strSQLInsert = Replace(strSQL, "[i]", i)

        DoCmd.SetWarnings False
        DoCmd.RunSQL strSQLInsert
        DoCmd.SetWarnings True
    
    Next

Exit_Handler:
    Exit Sub

Err_Handler:
    Select Case Err.Number
      Case Else
        MsgBox "Error #" & Err.Number & ": " & Err.Description, vbCritical, _
            "Error encountered (#" & Err.Number & " - CreateTempRecords[mod_Temp])"
    End Select
    Resume Exit_Handler
End Sub

' ---------------------------------
'   Temp Db Related Methods/Functions
' ---------------------------------

' ---------------------------------
' SUB:          UpdateTempTable
' Description:
'
' Parameters:   tbl - name of table to update (string)
'               TableQueryOrSQL - query name or SQL (string)
'               TimeLimit - time in minutes table is valid (integer)
'
' Returns:      True or False - whether update was successful or not (boolean)
' Assumptions:  -
' Throws:       none
' References:
'   Dale Fye, March 7, 2012
'   https://www.experts-exchange.com/articles/9753/Creating-and-using-Temporary-Tables-in-Microsoft-Access.html
' Source/date:  Bonnie Campbell, June 2016
' Revisions:    BLC, 6/8/2016 - initial version
' ---------------------------------
Public Function UpdateTempTable(tbl As String, TableQueryOrSQL As String, _
                                Optional InCurrentDb As Boolean = False, _
                                Optional TimeLimit As Integer = 0, _
                                Optional PK_Field As Variant = Null) As Boolean

    On Error GoTo Err_Handler

    Dim Db As DAO.Database
    Dim tdf As DAO.TableDef
    Dim strTempFile As String
    Dim strSQL As String, strMsg As String
    Dim strError As String
    Dim varExtDB As Variant
    Dim intMousePointer As Integer
        
    intMousePointer = Screen.MousePointer
    DoCmd.Hourglass True
    
    'set function default return value
    UpdateTempTable = False

    'check duration
    strError = "Deleting existing table in currendDb"
    
    'check duration
    If TableExists(tbl) Then

        If DateDiff("n", CurrentDb.TableDefs(tbl).Properties("DateCreated"), Now()) <= TimeLimit Then
            'duration not yet expired
            UpdateTempTable = True
            GoTo Exit_Handler
        Else
            'duration expired - drop table
            DropTable tbl
        End If
    End If
    
    'If the temp table is supposed to be created in an external database, then make sure it exists
    'Make sure the temp database exists in the same folder as the current project
    'if external db check that it exists
    If InCurrentDb = False Then
        strError = "Creating the temp database..."
        strTempFile = CurrentProject.Path & "\" _
                    & Left(CurrentProject.Name, InStrRev(CurrentProject.Name, ".") - 1) _
                    & "_Temp.accdb"
        If mod_File.FileExists(strTempFile) = False Then
            DBEngine.CreateDatabase strTempFile, dbLangGeneral, dbVersion120
        End If
    
        'Check to see whether the table already exists in the temp.accdb file.  If so, delete it
        strError = "Dropping the table in the temp database"
        Set Db = DBEngine.OpenDatabase(strTempFile)
        'If TableExists(tbl, db) = True Then
        If TableExists(tbl) = True Then
            Db.Execute "Drop Table [" & tbl & "]", dbFailOnError
        End If
        Set Db = Nothing
    End If
    
    'Define the SQL to insert the records from TableQueryOrSQL into the temp table
    strSQL = "SELECT zz.* INTO [" & tbl & "] "
    If InCurrentDb = False Then
        strSQL = strSQL & "IN " & Wrap(strTempFile)
    End If
    strSQL = strSQL & " FROM "
     
    '-------------------------
    ' TableQueryOrSQL Check
    '-------------------------
    '   If contains/is:
    '   SELECT INTO statement --> display message and exit
    '   SELECT statement      --> wrap it in () as a subquery
    '   query or table        --> insert value of TableQueryOrSQL into SQL string
    
    '   If table exists & is a SharePoint list
    '   (db field in mSysObjects contains http:// or https://) --> ignore the table
    '-------------------------
    'SELECT
    If InStr(TableQueryOrSQL, "SELECT") > 0 And InStr(TableQueryOrSQL, "INTO") > 0 Then
        strMsg = "Cannot pass a MakeTable or Append query to this function."
        MsgBox strMsg, vbOKOnly, "Invalid argument for TableQueryOrSQL"
        strSQL = ""
    
    'SELECT INTO
    ElseIf InStr(TableQueryOrSQL, "SELECT") = 1 And InStr(TableQueryOrSQL, "INTO") = 0 Then
        strSQL = strSQL & "(" & TableQueryOrSQL & ") as zz"
        
    'Query/Table
    ElseIf QueryExists(TableQueryOrSQL) Then
        strSQL = strSQL & TableQueryOrSQL & " as zz"
    
    'Table Exists & is Sharepoint List
    ElseIf TableExists(TableQueryOrSQL) Then
        varExtDB = DLookup("Database", "mSysObjects", "[Name] = " & Wrap(TableQueryOrSQL))
        If InStr(Nz(varExtDB, ""), "http") Then
            strMsg = "Unable to use Sharepoint list names directly because of potential " _
                   & "field type conflicts with earlier versions of Access.  To include " _
                   & "as SharePoint list in this function, pass it a SELECT query that " _
                   & "includes the specific fields to be used from the list."
            MsgBox strMsg, vbOKOnly, "Invalid argument for strSQL"
            strSQL = ""
        Else
            strSQL = strSQL & TableQueryOrSQL & " as zz"
        End If
    
    'Invalid SQL
    Else
        MsgBox "Invalid syntax for the SQL string", vbOKOnly, "Invalid argument for TableQueryorsQL"
        strSQL = ""
    End If

    'SQL Empty --> Exit
    If strSQL = "" Then GoTo Exit_Handler
            
    'Otherwise --> Execute SQL to create empty table in temp.accdb
    strError = "Writing data to the temp table in the temp db"
    CurrentDb.Execute strSQL, dbFailOnError
            
    'Primary key field defined? --> Alter table structure
    If IsNull(PK_Field) = False Then
        If InCurrentDb = True Then
            Set Db = CurrentDb
        Else
            Set Db = DBEngine.OpenDatabase(strTempFile)
        End If
        strSQL = "ALTER TABLE [" & tbl & "] " _
               & "ALTER COLUMN [" & PK_Field & "] Long " _
               & "CONSTRAINT PrimaryKey PRIMARY KEY;"
        Db.Execute strSQL, dbFailOnError
        Set Db = Nothing
    End If
    
    'External db? --> Link temp table to current project
    If InCurrentDb = False Then
        strError = "Linking table to the current database"
        
        Set tdf = CurrentDb.CreateTableDef(tbl)
        tdf.connect = ";DATABASE=" & strTempFile
        tdf.SourceTableName = tbl
        CurrentDb.TableDefs.Append tdf
        'DisplayNavPane (False)
    End If
    CurrentDb.TableDefs.Refresh
    
    UpdateTempTable = True
    
Exit_Handler:
    If Not Db Is Nothing Then Set Db = Nothing
    DoCmd.Hourglass False
    Screen.MousePointer = intMousePointer
    Exit Function

Err_Handler:
    Select Case Err.Number
      Case Else
        MsgBox "Error #" & Err.Number & ": " & Err.Description, vbCritical, _
            "Error encountered (#" & Err.Number & " - UpdateTempTable[mod_Temp])"
    End Select
    Resume Exit_Handler
End Function

Public Sub DropTable(tableName As String)

    If TableExists(tableName) Then
        DoCmd.DeleteObject acTable, tableName
    End If
    
End Sub

'Public Function TableExists(Tablename As String, Optional db As DAO.Database) As Boolean
'
'    Dim intFields As Integer
'    Dim ReleaseDB As Boolean
'
'    On Error GoTo ProcError
'
'    'The default database is the currentdb, but if one is passed, use it
'    If db Is Nothing Then
'        Set db = CurrentDb
'        ReleaseDB = True
'    End If
'
'    'If the table exists, then the next line will determine how many fields are in the table
'    'If it doesn't exist, then this will raise an error
'    intFields = db.TableDefs(Tablename).Fields.Count
'    TableExists = True
'
'ProcExit:
'    If ReleaseDB Then Set db = Nothing
'    Exit Function
'
'ProcError:
'    TableExists = False
'    Resume ProcExit
'
'End Function
'
'Public Function QueryExists(QueryName As String, Optional db As DAO.Database) As Boolean
'
'    Dim intFields As Integer
'    Dim ReleaseDB As Boolean
'
'    On Error GoTo ProcError
'
'    'The default database is the currentdb, but if one is passed, use it
'    If db Is Nothing Then
'        Set db = CurrentDb
'        ReleaseDB = True
'    End If
'
'    'If the query exists, then the next line will determine how many fields are in the table
'    'If it doesn't exist, then this will raise an error
'    intFields = db.QueryDefs(QueryName).Fields.Count
'    QueryExists = True
'
'ProcExit:
'    If ReleaseDB Then Set db = Nothing
'    Exit Function
'
'ProcError:
'    QueryExists = False
'    Resume ProcExit
'
'End Function
'


Public Function Wrap(WrapWhat As Variant, Optional WrapWith As String = """") As String

    'Created by Dale Fye, 2000-03-10
    
    'This function is used to wrap some value with some sort of wrapping character.
    
    'Accepts a variant and wraps that with whatever character or group of characters
    'are passed in the optional WrapWith argument.
    
    'It also replaces all values equal to the WrapWith text with duplicates of that character
    'which enables wrapping a text string that contains quotes.
    
    'If the WrapWhat value is NULL, then the function returns a empty string wrapped in quotes
    'I generally use this to wrap text in quotes or date values in the #
    
    Wrap = WrapWith & Replace(WrapWhat & "", WrapWith, WrapWith & WrapWith) & WrapWith
    
End Function