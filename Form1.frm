VERSION 4.00
Begin VB.Form Form1 
   BackColor       =   &H00000000&
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "StartMenu Jokes"
   ClientHeight    =   1065
   ClientLeft      =   1140
   ClientTop       =   1515
   ClientWidth     =   2730
   Height          =   1470
   Left            =   1080
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1065
   ScaleWidth      =   2730
   ShowInTaskbar   =   0   'False
   Top             =   1170
   Width           =   2850
   Begin VB.CommandButton Command4 
      Caption         =   "Show Bar"
      Height          =   375
      Left            =   1440
      TabIndex        =   3
      Top             =   600
      Width           =   1215
   End
   Begin VB.CommandButton Command3 
      Caption         =   "Hide Bar"
      Height          =   375
      Left            =   120
      TabIndex        =   2
      Top             =   600
      Width           =   1215
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Show Button"
      Height          =   375
      Left            =   1440
      TabIndex        =   1
      Top             =   120
      Width           =   1215
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Hide Button"
      Height          =   375
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   1215
   End
End
Attribute VB_Name = "Form1"
Attribute VB_Creatable = False
Attribute VB_Exposed = False
Private Sub Command1_Click()
StartButton_Hide
End Sub


Private Sub Command2_Click()
StartButton_Show
End Sub


Private Sub Command3_Click()
Startmenu_Hide
End Sub


Private Sub Command4_Click()
Startmenu_Show
End Sub


