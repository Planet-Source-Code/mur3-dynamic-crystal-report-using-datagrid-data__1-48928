VERSION 5.00
Object = "{CDE57A40-8B86-11D0-B3C6-00A0C90AEA82}#1.0#0"; "MSDATGRD.OCX"
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   6225
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   6855
   LinkTopic       =   "Form1"
   ScaleHeight     =   6225
   ScaleWidth      =   6855
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command2 
      Caption         =   "Print"
      Height          =   495
      Left            =   5400
      TabIndex        =   4
      Top             =   5520
      Width           =   1215
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Filter"
      Height          =   495
      Left            =   2760
      TabIndex        =   2
      Top             =   240
      Width           =   1215
   End
   Begin VB.TextBox Text2 
      Height          =   375
      Left            =   1440
      TabIndex        =   1
      Top             =   240
      Width           =   1215
   End
   Begin VB.TextBox Text1 
      Height          =   375
      Left            =   120
      TabIndex        =   0
      Top             =   240
      Width           =   1215
   End
   Begin MSDataGridLib.DataGrid DG1 
      Height          =   4575
      Left            =   120
      TabIndex        =   3
      Top             =   840
      Width           =   6615
      _ExtentX        =   11668
      _ExtentY        =   8070
      _Version        =   393216
      HeadLines       =   1
      RowHeight       =   15
      BeginProperty HeadFont {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ColumnCount     =   2
      BeginProperty Column00 
         DataField       =   ""
         Caption         =   ""
         BeginProperty DataFormat {6D835690-900B-11D0-9484-00A0C91110ED} 
            Type            =   0
            Format          =   ""
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1033
            SubFormatType   =   0
         EndProperty
      EndProperty
      BeginProperty Column01 
         DataField       =   ""
         Caption         =   ""
         BeginProperty DataFormat {6D835690-900B-11D0-9484-00A0C91110ED} 
            Type            =   0
            Format          =   ""
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1033
            SubFormatType   =   0
         EndProperty
      EndProperty
      SplitCount      =   1
      BeginProperty Split0 
         BeginProperty Column00 
         EndProperty
         BeginProperty Column01 
         EndProperty
      EndProperty
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim cn As Connection
Dim Rs1 As Recordset

Private Sub Command1_Click()

'open new recordset & assign that to datagrid
Set Rs1 = New Recordset
Rs1.Open "select id,code,date from receipts where id between " & Text1.Text & " and " & Text2.Text, cn, adOpenDynamic, adLockOptimistic
Set DG1.DataSource = Rs1

End Sub

Private Sub Command2_Click()
'set public recordset rsglobal = rs1 , then show report form.
'* rsglobal is declared in module1
Set rsGlobal = Rs1
Form2.Show
End Sub

Private Sub Form_Load()
Set cn = New Connection
Dim path As String
path = App.path & "\db1.mdb"
cn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & path & ";Persist Security Info=False"
cn.CursorLocation = adUseClient
Text1.Text = 17300 'sample values
Text2.Text = 17310 'sample values
End Sub

