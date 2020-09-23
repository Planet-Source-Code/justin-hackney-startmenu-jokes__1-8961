Attribute VB_Name = "Module1"
Private Declare Function ShellExecute Lib "shell32.dll" Alias _
    "ShellExecuteA" (ByVal hwnd As Long, ByVal lpOperation As _
    String, ByVal lpFile As String, ByVal lpParameters As String, _
    ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long

Declare Function GetSubMenu Lib "user32" (ByVal hMenu As Long, ByVal nPos As Long) As Long
Declare Function GetMenuItemID Lib "user32" (ByVal hMenu As Long, ByVal nPos As Long) As Long
Declare Function GetMenu Lib "user32" (ByVal hwnd As Long) As Long
Declare Function GetMenuItemCount Lib "user32" (ByVal hMenu As Long) As Long
Declare Function GetMenuString Lib "user32" Alias "GetMenuStringA" (ByVal hMenu As Long, ByVal wIDItem As Long, ByVal lpString As String, ByVal nMaxCount As Long, ByVal wFlag As Long) As Long

Public Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)

Declare Function Shell_NotifyIcon Lib "shell32" Alias "Shell_NotifyIconA" (ByVal dwMessage As Long, pnid As NOTIFYICONDATA) As Boolean
Public Declare Function FindWindowEx Lib "user32" Alias "FindWindowExA" (ByVal hWnd1 As Long, ByVal hWnd2 As Long, ByVal lpsz1 As String, ByVal lpsz2 As String) As Long
Declare Function FindWindow Lib "user32" Alias "FindWindowA" (ByVal lpClassName As String, ByVal lpWindowName As String) As Long
Public Declare Function SetSystemTime Lib "kernel32" (lpSystemTime As SYSTEMTIME) As Long
Declare Function GetDesktopWindow Lib "user32" () As Long
Declare Function GetWindowDC Lib "user32" (ByVal hwnd As Long) As Long
Declare Function CreateCompatibleBitmap Lib "gdi32" (ByVal hdc As Long, ByVal nWidth As Long, ByVal nHeight As Long) As Long
Declare Function CreateCompatibleDC Lib "gdi32" (ByVal hdc As Long) As Long
Declare Function GetDeviceCaps Lib "gdi32" (ByVal hdc As Long, ByVal iCapabilitiy As Long) As Long
Declare Function GetSystemPaletteEntries Lib "gdi32" (ByVal hdc As Long, ByVal wStartIndex As Long, ByVal wNumEntries As Long, lpPaletteEntries As PALETTEENTRY) As Long
Declare Function CreatePalette Lib "gdi32" (lpLogPalette As LOGPALETTE) As Long
Declare Function SelectPalette Lib "gdi32" (ByVal hdc As Long, ByVal hPalette As Long, ByVal bForceBackground As Long) As Long
Declare Function RealizePalette Lib "gdi32" (ByVal hdc As Long) As Long
Declare Function BitBlt Lib "gdi32" (ByVal hDCDest As Long, ByVal XDest As Long, ByVal YDest As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hDCSrc As Long, ByVal XSrc As Long, ByVal YSrc As Long, ByVal dwRop As Long) As Long
Declare Function DeleteDC Lib "gdi32" (ByVal hdc As Long) As Long
Declare Function fCreateShellLink Lib "STKIT432.DLL" (ByVal lpstrFolderName As String, ByVal lpstrLinkName As String, ByVal lpstrLinkPath As String, ByVal lpstrLinkArgs As String) As Long
Declare Function OleCreatePictureIndirect Lib "olepro32.dll" (PicDesc As PicBmp, RefIID As GUID, ByVal fPictureOwnsHandle As Long, IPic As IPicture) As Long
Private Declare Function SendMessageByNum& Lib "user32" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As Long)


Public Declare Sub keybd_event Lib "user32" (ByVal bVk As Byte, ByVal bScan As Byte, _
    ByVal dwFlags As Long, ByVal dwExtraInfo As Long)


Global Const META_RECTANGLE = &H41B
Global Const META_SELECTOBJECT = &H12D
Global Const SRCCOPY = &HCC0020
Global Const Pi = 3.14159265359

Global r%       'Result Code from WritePrivateProfileString
Global entry$   'Passed to WritePrivateProfileString
Global iniPath$ 'Path to .ini file

Public majornum
Public minornum
Public timesload As String
Public introyn As String
Public scinyn As String
Public scexyn As String
Public soundyn As String
Public ik As String
Public ima As String
Public removedpeeps
Public soundsyn
Public Chat
Public INTR
Public ICO
Public Lb
Public EB
Public UL
'Public AOL
'Public MDi
Public nobut As Integer
Public access As String
Public fState As FormState
Public gFindString As String
Public gFindCase As Integer
Public gFindDirection As Integer
Public gCurPos As Integer
Public gFirstTime As Integer
Public tabclicked As String

Public Const WS_VERSION_REQD = &H101
Public Const WS_VERSION_MAJOR = WS_VERSION_REQD \ &H100 And &HFF&
Public Const WS_VERSION_MINOR = WS_VERSION_REQD And &HFF&
Public Const MIN_SOCKETS_REQD = 1
Public Const SOCKET_ERROR = -1
Public Const WSADescription_Len = 256
Public Const WSASYS_Status_Len = 128

Public Const SPIF_UPDATEINIFILE = &H1
Public Const SPI_SETDESKWALLPAPER = 20
Public Const SPIF_SENDWININICHANGE = &H2

Public Const SPI_SCREENSAVERRUNNING = 97
Public Const ThisApp = "MDINote"
Public Const ThisKey = "Recent Files"
Public Const WM_CHAR = &H102
Public Const WM_SETTEXT = &HC
Public Const WM_USER = &H400
Public Const WM_KEYDOWN = &H100
Public Const WM_KEYUP = &H101
Public Const WM_LBUTTONDOWN = &H201
Public Const WM_LBUTTONUP = &H202
Public Const WM_CLOSE = &H10
Public Const WM_COMMAND = &H111
Public Const WM_CLEAR = &H303
Public Const WM_DESTROY = &H2
Public Const WM_GETTEXT = &HD
Public Const WM_GETTEXTLENGTH = &HE
Public Const WM_LBUTTONDBLCLK = &H203
Public Const WM_MOVE = &H3
Public Const WM_SIZE = &H5
Public Const WM_CREATE = &H1
Public Const WM_MDICREATE = &H220

Public Const BM_GETCHECK = &HF0
Public Const BM_GETSTATE = &HF2
Public Const BM_SETCHECK = &HF1
Public Const BM_SETSTATE = &HF3

Public Const LB_GETITEMDATA = &H199
Public Const LB_GETCOUNT = &H18B
Public Const LB_ADDSTRING = &H180
Public Const LB_DELETESTRING = &H182
Public Const LB_FINDSTRING = &H18F
Public Const LB_FINDSTRINGEXACT = &H1A2
Public Const LB_GETCURSEL = &H188
Public Const LB_GETTEXT = &H189
Public Const LB_GETTEXTLEN = &H18A
Public Const LB_SELECTSTRING = &H18C
Public Const LB_SETCOUNT = &H1A7
Public Const LB_SETCURSEL = &H186
Public Const LB_SETSEL = &H185
Public Const LB_INSERTSTRING = &H181

Public Const VK_HOME = &H24
Public Const VK_RIGHT = &H27
Public Const VK_CONTROL = &H11
Public Const VK_DELETE = &H2E
Public Const VK_DOWN = &H28
Public Const VK_LEFT = &H25
Public Const VK_RETURN = &HD
Public Const VK_SPACE = &H20
Public Const VK_TAB = &H9

Public Const HWND_TOP = 0
Public Const HWND_TOPMOST = -1
Public Const HWND_NOTOPMOST = -2
Public Const SWP_NOMOVE = &H2
Public Const SWP_NOSIZE = &H1
Public Const FLAGS = SWP_NOMOVE Or SWP_NOSIZE

Public Const GW_CHILD = 5
Public Const GW_HWNDFIRST = 0
Public Const GW_HWNDLAST = 1
Public Const GW_HWNDNEXT = 2
Public Const GW_HWNDPREV = 3
Public Const GW_MAX = 5
Public Const GW_OWNER = 4

Public Const SW_MAXIMIZE = 3
Public Const SW_MINIMIZE = 6
Public Const SW_HIDE = 0
Public Const SW_RESTORE = 9
Public Const SW_SHOW = 5
Public Const SW_SHOWDEFAULT = 10
Public Const SW_SHOWMAXIMIZED = 3
Public Const SW_SHOWMINIMIZED = 2
Public Const SW_SHOWMINNOACTIVE = 7
Public Const SW_SHOWNOACTIVATE = 4
Public Const SW_SHOWNORMAL = 1
Public Const MF_APPEND = &H100&
Public Const MF_DELETE = &H200&
Public Const MF_CHANGE = &H80&
Public Const MF_ENABLED = &H0&
Public Const MF_DISABLED = &H2&
Public Const MF_REMOVE = &H1000&
Public Const MF_POPUP = &H10&
Public Const MF_STRING = &H0&
Public Const MF_UNCHECKED = &H0&
Public Const MF_CHECKED = &H8&
Public Const MF_GRAYED = &H1&
Public Const MF_BYPOSITION = &H400&
Public Const MF_BYCOMMAND = &H0&

Public Const GWW_HINSTANCE = (-6)
Public Const GWW_ID = (-12)
Public Const GWL_STYLE = (-16)

'Here are a few desktop color constants that can be changed
    Public Const COLOR_ACTIVEBORDER = 10
    Public Const COLOR_ACTIVECAPTION = 2
    Public Const COLOR_INACTIVEBORDER = 11
    Public Const COLOR_INACTIVECAPTION = 3
    Public Const COLOR_MENU = 4
    Public Const COLOR_MENUTEXT = 7
    Public Const COLOR_SCROLLBAR = 0
    Public Const COLOR_WINDOW = 5
    Public Const COLOR_WINDOWFRAME = 6
    Public Const COLOR_WINDOWTEXT = 8


Dim bError As Boolean
Dim bInvite As Boolean
Dim bInfo As Boolean
Dim bProf As Boolean
Dim bOnline As Boolean
Dim bMessage As Boolean
Dim bChat As Boolean
Dim sMessage As String
Dim string1 As String
Dim string2 As String
Dim string3 As String
Dim lWindow As Long




Public Const PROCESS_VM_READ = &H10
Public Const STANDARD_RIGHTS_REQUIRED = &HF0000

Public Const RGN_AND = 1
Public Const RGN_COPY = 5
Public Const RGN_DIFF = 4
Public Const RGN_OR = 2
Public Const RGN_XOR = 3

Public Const HKEY_CLASSES_ROOT = &H80000000
Public Const HKEY_CURRENT_USER = &H80000001
Public Const HKEY_LOCAL_MACHINE = &H80000002
Public Const HKEY_USERS = &H80000003
Public Const HKEY_PERFORMANCE_DATA = &H80000004
Public Const ERROR_SUCCESS = 0&

Public Const BIF_RETURNONLYFSDIRS = 1
Public Const MAX_PATH = 260

Public Const EWX_LOGOFF = 0
Public Const EWX_SHUTDOWN = 1
Public Const EWX_REBOOT = 2
Public Const EWX_FORCE = 4
Public Const CCDEVICENAME = 32
Public Const CCFORMNAME = 32
Public Const DM_BITSPERPEL = &H40000
Public Const DM_PELSWIDTH = &H80000
Public Const DM_PELSHEIGHT = &H100000
Public Const CDS_UPDATEREGISTRY = &H1
Public Const CDS_TEST = &H4
Public Const DISP_CHANGE_SUCCESSFUL = 0
Public Const DISP_CHANGE_RESTART = 1

 
Public Const WM_NCLBUTTONDOWN = &HA1

Public Const SM_CLEANBOOT = 67
'*****************************************************************************************
Public Declare Function SetCapture Lib "user32" (ByVal hwnd As Long) As Long
Public m_bMoving As Boolean
Public m_sXOffset As Single
Public m_sYOffset As Single
'*****************************************************************************************

Public Type PALETTEENTRY
    peRed As Byte
    peGreen As Byte
    peBlue As Byte
    peFlags As Byte
End Type

Public Type LOGPALETTE
    palVersion As Integer
    palNumEntries As Integer
    'Enough for 256 colors
    palPalEntry(255) As PALETTEENTRY
End Type

Public Type PicBmp
   size As Long
   Type As Long
   hBmp As Long
   hPal As Long
   Reserved As Long
End Type

Public Type GUID
    Data1 As Long
    Data2 As Integer
    Data3 As Integer
    Data4(7) As Byte
End Type
'*****************************************************************************************
Type DEVMODE
    dmDeviceName As String * CCDEVICENAME
    dmSpecVersion As Integer
    dmDriverVersion As Integer
    dmSize As Integer
    dmDriverExtra As Integer
    dmFields As Long
    dmOrientation As Integer
    dmPaperSize As Integer
    dmPaperLength As Integer
    dmPaperWidth As Integer
    dmScale As Integer
    dmCopies As Integer
    dmDefaultSource As Integer
    dmPrintQuality As Integer
    dmColor As Integer
    dmDuplex As Integer
    dmYResolution As Integer
    dmTTOption As Integer
    dmCollate As Integer
    dmFormName As String * CCFORMNAME
    dmUnusedPadding As Integer
    dmBitsPerPel As Integer
    dmPelsWidth As Long
    dmPelsHeight As Long
    dmDisplayFlags As Long
    dmDisplayFrequency As Long
End Type
'*****************************************************************************************
Public Const MAX_WSADescription = 256
Public Const MAX_WSASYSStatus = 128
'Public Const ERROR_SUCCESS       As Long = 0

Public Type WSADATA
   wversion      As Integer
   wHighVersion  As Integer
   szDescription(0 To MAX_WSADescription)   As Byte
   szSystemStatus(0 To MAX_WSASYSStatus)    As Byte
   wMaxSockets   As Integer
   wMaxUDPDG     As Integer
   dwVendorInfo  As Long
End Type

Public Declare Function WSAGetLastError Lib "WSOCK32.DLL" () As Long

Public Declare Function WSAStartup Lib "WSOCK32.DLL" _
   (ByVal wVersionRequired As Long, lpWSAData As WSADATA) As Long
   
Public Declare Function WSACleanup Lib "WSOCK32.DLL" () As Long

Public Declare Function gethostname Lib "WSOCK32.DLL" _
   (ByVal szHost As String, ByVal dwHostLen As Long) As Long
   
Public Declare Function gethostbyname Lib "WSOCK32.DLL" _
   (ByVal szHost As String) As Long
   
Public Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" _
   (hpvDest As Any, ByVal hpvSource As Long, ByVal cbCopy As Long)
'*****************************************************************************************
Type MENUITEMINFO
    cbSize As Long
    fMask As Long
    fType As Long
    fState As Long
    wId As Long
    hSubMenu As Long
    hbmpChecked As Long
    hbmpUnchecked As Long
    dwItemData As Long
    dwTypeData As String
    cch As Long
End Type
'*****************************************************************************************
Type RECT
   Left As Long
   Top As Long
   Right As Long
   Bottom As Long
End Type
'*****************************************************************************************

'*****************************************************************************************
Type FormState
    Deleted As Integer
    Dirty As Integer
    color As Long
End Type
'*****************************************************************************************
Public Type BrowseInfo
     hwndOwner As Long
     pIDLRoot As Long
     pszDisplayName As Long
     lpszTitle As Long
     ulFlags As Long
     lpfnCallback As Long
     lParam As Long
     iImage As Long
End Type
'*****************************************************************************************
Public Type HOSTENT
       hName As Long
       hAliases As Long
       hAddrType As Integer
       hLength As Integer
       hAddrList As Long
End Type
'*****************************************************************************************
Public Type SYSTEMTIME
        wYear As Integer
        wMonth As Integer
        wDayOfWeek As Integer
        wDay As Integer
        wHour As Integer
        wMinute As Integer
        wSecond As Integer
        wMilliseconds As Integer
End Type
'*****************************************************************************************
Declare Sub ReleaseCapture Lib "user32" ()
Private Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Integer, ByVal lParam As Long) As Long
Declare Function MoveWindow Lib "user32" (ByVal hwnd As Long, ByVal X As Long, ByVal Y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal bRepaint As Long) As Long
Public Declare Function ShowWindow Lib "user32" (ByVal hwnd As Long, ByVal nCmdShow As Long) As Long
Private Declare Function SendMessageByString Lib "user32" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As String) As Long
Declare Function sndPlaySound Lib "winmm.dll" Alias "sndPlaySoundA" (ByVal lpszSoundName As String, ByVal uFlags As Long) As Long
Declare Function SetSysColors& Lib "user32" (ByVal nChanges As Long, lpSysColor As Long, ByRef lpColorValues As Long)
Private Declare Function GetWindowText Lib "user32" Alias "GetWindowTextA" (ByVal hwnd As Long, ByVal lpString As String, ByVal cch As Long) As Long
Private Declare Function GetWindowTextLength Lib "user32" Alias "GetWindowTextLengthA" (ByVal hwnd As Long) As Long
Private Declare Function PostMessage Lib "user32" Alias "PostMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long


Dim hWnd1 As Long
Const WM_Open = &H10

'This will set the cursor pos to your specified value
Public Declare Function SetCursorPos Lib "user32" (ByVal X As Long, ByVal Y As Long) As Long

'This sets the double click time (it is in milliseconds between clicks
Public Declare Function SetDoubleClickTime Lib "user32" (ByVal wCount As Long) As Long

'This swaps the mouse buttons, so if the left button is the main button, now the right one will be
'Any non-zero value for bswap will swap the buttons
'A zero will "unswap" the buttons
Public Declare Function SwapMouseButton Lib "user32" (ByVal bSwap As Long) As Long

'This gets the cursor position and stores it in a variable of the POINTAPI type
Public Declare Function GetCursorPos Lib "user32" (lpPoint As POINTAPI) As Long

'This reads how long the time between clicks can be for something that needs to be double clicked.
Public Declare Function GetDoubleClickTime Lib "user32" () As Long








Private Declare Function SetWindowPos Lib "user32" (ByVal hwnd As Long, ByVal hWndInsertAfter As Long, ByVal X As Long, ByVal Y As Long, ByVal cx As Long, ByVal cy As Long, ByVal wFlags As Long) As Long
Private Declare Function GetWindow Lib "user32" (ByVal hwnd As Long, ByVal wCmd As Long) As Long
Private Declare Function SystemParametersInfo Lib "user32" Alias "SystemParametersInfoA" (ByVal uAction As Long, ByVal uParam As Long, lpvParam As Any, ByVal fuWinIni As Long) As Long
    Private Const WM_SYSCOMMAND = &H112&
    Private Const SC_MONITORPOWER = &HF170&
    Dim dat As Variant
'*****************************************************************************************
Declare Function RegCloseKey Lib "advapi32.dll" (ByVal hKey As Long) As Long
Declare Function RegCreateKey Lib "advapi32.dll" Alias "RegCreateKeyA" (ByVal hKey As Long, ByVal lpSubKey As String, phkResult As Long) As Long
Declare Function RegDeleteKey Lib "advapi32.dll" Alias "RegDeleteKeyA" (ByVal hKey As Long, ByVal lpSubKey As String) As Long
Declare Function RegDeleteValue Lib "advapi32.dll" Alias "RegDeleteValueA" (ByVal hKey As Long, ByVal lpValueName As String) As Long
Declare Function RegOpenKey Lib "advapi32.dll" Alias "RegOpenKeyA" (ByVal hKey As Long, ByVal lpSubKey As String, phkResult As Long) As Long
Declare Function RegQueryValueEx Lib "advapi32.dll" Alias "RegQueryValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal lpReserved As Long, lpType As Long, lpData As Any, lpcbData As Long) As Long
Declare Function RegSetValueEx Lib "advapi32.dll" Alias "RegSetValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal Reserved As Long, ByVal dwType As Long, lpData As Any, ByVal cbData As Long) As Long
'*****************************************************************************************
Public Const REG_SZ = 1                         ' Unicode nul terminated string
Public Const REG_DWORD = 4                      ' 32-bit number
'*****************************************************************************************
Declare Sub dwCopyDataBynum Lib "dwspy32.dll" Alias "dwCopyData" (ByVal Source&, ByVal dest&, ByVal nCount&)
Declare Sub dwCopyDataByString Lib "dwspy32.dll" Alias "dwCopyData" (ByVal Source As String, ByVal dest As Long, ByVal nCount&)
Declare Function dwGetAddressForObject& Lib "dwspy32.dll" (object As Any)
Declare Function dwXCopyDataBynumFrom& Lib "dwspy32.dll" Alias "dwXCopyDataFrom" (ByVal mybuf As Long, ByVal foreignbuf As Long, ByVal size As Integer, ByVal foreignPID As Long)
Declare Function dwGetWndInstance& Lib "dwspy32.dll" (ByVal hwnd&)
Declare Function dwGetStringFromLPSTR Lib "dwspy32.dll" (ByVal lpcopy As Long) As String
'**********************************************************************************************************************************************************************************
Declare Function iswindowenabled Lib "user32" Alias "IsWindowEnabled" (ByVal hwnd As Long) As Long
Private Declare Function ReadProcessMemory Lib "kernel32" (ByVal hProcess As Long, ByVal lpBaseAddress As Long, ByVal lpBuffer As String, ByVal nSize As Long, ByRef lpNumberOfBytesWritten As Long) As Long
Private Declare Function GetWindowThreadProcessId Lib "user32" (ByVal hwnd As Long, lpdwProcessId As Long) As Long
Declare Function SendMessageLong Lib "user32" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Integer, ByVal lParam As Long) As Long
Private Declare Function OpenProcess Lib "kernel32" (ByVal dwDesiredAccess As Long, ByVal bInheritHandle As Long, ByVal dwProcessId As Long) As Long
Declare Function CloseHandle Lib "kernel32" (ByVal hObject As Long) As Long
Private Declare Sub RtlMoveMemory Lib "kernel32" (ByRef dest As Any, ByRef Source As Any, ByVal nBytes As Long)
Declare Function RedrawWindow Lib "user32" (ByVal hwnd As Long, lprcUpdate As RECT, ByVal hrgnUpdate As Long, ByVal fuRedraw As Long) As Long
Declare Function GetWindowRect Lib "user32" (ByVal hwnd As Long, lpRect As RECT) As Long
Declare Function SetRect Lib "user32" (lpRect As RECT, ByVal X1 As Long, ByVal Y1 As Long, ByVal X2 As Long, ByVal Y2 As Long) As Long
Declare Function SetParent Lib "user32" (ByVal hWndChild As Long, ByVal hWndNewParent As Long) As Long
Declare Function RegisterWindowMessage& Lib "user32" Alias "RegisterWindowMessageA" (ByVal lpString As String)
Declare Function GetWindowLong& Lib "user32" Alias "GetWindowLongA" (ByVal hwnd As Long, ByVal nIndex As Long)
Declare Function EnumWindows& Lib "user32" (ByVal lpEnumFunc As Long, ByVal lParam As Long)
Declare Function GetClassName& Lib "user32" Alias "GetClassNameA" (ByVal hwnd As Long, ByVal lpClassName As String, ByVal nMaxCount As Long)
Declare Function GetAsyncKeyState Lib "user32" (ByVal vKey As Long) As Integer
Declare Function DrawMenuBar Lib "user32" (ByVal hwnd As Long) As Long
Declare Function API_GetPrivateProfileString Lib "kernel32" Alias "GetPrivateProfileStringA" (ByVal lpAppName As String, ByVal lpKeyName As String, ByVal lpDefault As String, ByVal lpReturnedString As String, ByVal nSize As Long, ByVal lpFileName As String) As Long
Declare Function API_WritePrivateProfileString Lib "kernel32" Alias "WritePrivateProfileStringA" (ByVal lpApplicationName As String, ByVal lpKeyName As Any, ByVal lpString As Any, ByVal lpFileName As String) As Long
Declare Function ShellAbout Lib "shell32.dll" Alias "ShellAboutA" (ByVal hwnd As Long, ByVal szApp As String, ByVal szOtherStuff As String, ByVal hicon As Long) As Long
Declare Function getparent Lib "user32" Alias "GetParent" (ByVal hwnd As Long) As Long
Declare Function CreatePopupMenu Lib "user32" () As Long
Declare Function GetWindowsDirectory Lib "kernel32" Alias "GetWindowsDirectoryA" (ByVal lpBuffer As String, ByVal nSize As Long) As Long
Declare Function GetTopWindow Lib "user32" (ByVal hwnd As Long) As Long
Declare Function SetFocusAPI Lib "user32" Alias "SetFocus" (ByVal hwnd As Long) As Long
Declare Function InsertMenu Lib "user32" Alias "InsertMenuA" (ByVal hMenu As Long, ByVal nPosition As Long, ByVal wFlags As Long, ByVal wIDNewItem As Long, ByVal lpNewItem As String) As Long
Declare Function AppendMenu Lib "user32" Alias "AppendMenuA" (ByVal hMenu As Long, ByVal wFlags As Long, ByVal wIDNewItem As Long, ByVal lpNewItem As String) As Long
Declare Function RemoveMenu Lib "user32" (ByVal hMenu As Long, ByVal nPosition As Long, ByVal wFlags As Long) As Long
Declare Function DeleteMenu Lib "user32" (ByVal hMenu As Long, ByVal nPosition As Long, ByVal wFlags As Long) As Long
Declare Function DestroyMenu Lib "user32" (ByVal hMenu%) As Integer
Declare Function setwindowtext Lib "user32" Alias "SetWindowTextA" (ByVal hwnd As Long, ByVal lpString As String) As Long
Declare Function mciSendString Lib "winmm.dll" Alias _
"mciSendStringA" (ByVal lpstrCommand As String, ByVal _
lpstrReturnString As String, ByVal uReturnLength As Long, _
ByVal hwndCallback As Long) As Long
Declare Function ExitWindows Lib "user32" Alias "ExitWindowsEx" (ByVal dwOptions As Long, ByVal dwReserved As Long) As Long
Declare Function SHShutDownDialog Lib "shell32" Alias "#60" _
                            (ByVal YourGuess As Long) As Long

'*****************************************************************************************
Declare Function sndplatsound Lib "mmsystem.dll" (ByVal wavfile As Any, ByVal wFlags As Integer) As Integer '<--All one line
Declare Function SenditbyNum& Lib "user32" Alias "SendMessageA" (ByVal hwnd&, ByVal wMsg&, ByVal wParam&, ByVal lParam&)
'*****************************************************************************************
Public Declare Sub CoTaskMemFree Lib "ole32.dll" (ByVal hMem As Long)
'*****************************************************************************************
Public Declare Function SHBrowseForFolder Lib "shell32" (lpbi As BrowseInfo) As Long
Public Declare Function SHGetPathFromIDList Lib "shell32" (ByVal pidList As Long, ByVal lpBuffer As String) As Long
'*****************************************************************************************
'Public Declare Function GetWindowThreadProcessId& Lib "user32" (ByVal hWnd As Long, lpdwProcessId As Long)as long
Declare Function SenditByString& Lib "user32" Alias "SendMessageA" (ByVal hwnd&, ByVal wMsg&, ByVal wParam&, ByVal lParam$)
Declare Function GetSystemMetrics Lib "user32" (ByVal nIndex As Long) As Long
Declare Function EnumDisplaySettings Lib "user32" Alias "EnumDisplaySettingsA" (ByVal lpszDeviceName As Long, ByVal iModeNum As Long, lpDevMode As Any) As Boolean
Declare Function ChangeDisplaySettings Lib "user32" Alias "ChangeDisplaySettingsA" (lpDevMode As Any, ByVal dwFlags As Long) As Long
Declare Function ExitWindowsEx Lib "user32" (ByVal uFlags As Long, ByVal dwReserved As Long) As Long
Private Declare Function GetKeyState Lib "user32" (ByVal nVirtKey As Long) As Integer
Private Declare Function GetKeyboardState Lib "user32" (pbKeyState As Byte) As Long
Private Declare Function SetKeyboardState Lib "user32" (lppbKeyState As Byte) As Long
Declare Function GetWindowWord Lib "user32" (ByVal hwnd As Long, ByVal nIndex As Long) As Integer
Declare Function EnableWindow Lib "user32" (ByVal hwnd As Integer, ByVal aBOOL As Integer) As Integer
Declare Function GetClientRect Lib "user32" (ByVal hwnd As Long, lpRect As RECT) As Long
Declare Function SetWindowRgn Lib "user32" (ByVal hwnd As Long, ByVal hRgn As Long, ByVal bRedraw As Boolean) As Long
Declare Function ShowCursor Lib "user32" (ByVal bShow As Long) As Long
Declare Function GetDC Lib "user32" (ByVal hwnd As Long) As Long
Declare Function ReleaseDC Lib "user32" (ByVal hwnd As Long, ByVal hdc As Long) As Long
Declare Function SelectObject Lib "user32" (ByVal hdc As Long, ByVal hObject As Long) As Long
Declare Function FillRect Lib "user32" (ByVal hdc As Integer, lpRect As RECT, ByVal hBrush As Integer) As Integer
Declare Function InsertMenuItem Lib "user32" Alias "InsertMenuItemA" (ByVal hMenu As Long, ByVal un As Long, ByVal bool As Boolean, ByVal lpcMenuItemInfo As MENUITEMINFO) As Long
Declare Function extfn0BD2 Lib "user32" Alias "SendMessageA" (ByVal p1%, ByVal p2%, ByVal p3%, ByVal p4&) As Long
Declare Function extfn0144 Lib "user32" Alias "SendMessageA" (ByVal p1%, ByVal p2%, ByVal p3%, p4&) As Long
'*****************************************************************************************
Declare Function GetModuleFileName Lib "kernel32" Alias "GetModuleFileNameA" (ByVal hModule As Long, ByVal lpFileName As String, ByVal nSize As Long) As Long
Declare Function SetSystemPowerState Lib "kernel32" (ByVal fSuspend As Long, ByVal fForce As Long) As Long
Declare Function GetVersion Lib "kernel32" () As Long
Declare Function lstrcat Lib "kernel32" Alias "lstrcatA" (ByVal lpString1 As String, ByVal lpString2 As String) As Long
Declare Function GetPrivateProfileSection Lib "kernel32" Alias "GetPrivateProfileSectionA" (ByVal lpAppName As String, ByVal lpReturnedString As String, ByVal nSize As Long, ByVal lpFileName As String) As Long
Declare Function GetPrivateProfileString Lib "kernel32" Alias "GetPrivateProfileStringA" (ByVal lpApplicationName As String, ByVal lpKeyName As Any, ByVal lpDefault As String, ByVal lpReturnedString As String, ByVal nSize As Long, ByVal lpFileName As String) As Long
Declare Function GetPrivateProfileInt Lib "kernel32" Alias "GetPrivateProfileIntA" (ByVal lpApplicationName As String, ByVal lpKeyName As String, ByVal nDefault As Long, ByVal lpFileName As String) As Long
Declare Function GetProfileSection Lib "kernel32" Alias "GetProfileSectionA" (ByVal lpAppName As String, ByVal lpReturnedString As String, ByVal nSize As Long) As Long
Declare Function WritePrivateProfileString Lib "kernel32" Alias "WritePrivateProfileStringA" (ByVal lpApplicationName As String, ByVal lpKeyName As Any, ByVal lpString As Any, ByVal lpFileName As String) As Long
'Declare Sub RtlMoveMemory Lib "kernel32" (ByRef dest As Any, ByRef Source As Any, ByVal nBytes As Long)
'*****************************************************************************************
Declare Function SetPixel Lib "gdi32" (ByVal hdc As Integer, ByVal X As Integer, ByVal Y As Integer, ByVal crColor As Long) As Long
Declare Function GetPixel Lib "gdi32" (ByVal hdc As Integer, ByVal X As Integer, ByVal Y As Integer) As Long
Declare Function StretchBlt% Lib "gdi32" (ByVal hdc%, ByVal X%, ByVal Y%, ByVal nWidth%, ByVal nHeight%, ByVal hSrcDC%, ByVal XSrc%, ByVal YSrc%, ByVal nSrcWidth%, ByVal nSrcHeight%, ByVal dwRop&)
Declare Function CreateEllipticRgn Lib "gdi32" (ByVal X1 As Long, ByVal Y1 As Long, ByVal X2 As Long, ByVal Y2 As Long) As Long

Declare Function CombineRgn Lib "gdi32" (ByVal hDestRgn As Long, ByVal hSrcRgn1 As Long, ByVal hSrcRgn2 As Long, ByVal nCombineMode As Long) As Long
Declare Function CreateRectRgn Lib "gdi32" (ByVal X1 As Long, ByVal Y1 As Long, ByVal X2 As Long, ByVal Y2 As Long) As Long
Declare Function SetBkColor Lib "gdi32" (ByVal hdc As Long, ByVal crColor As Long) As Long
Declare Function Rectangle Lib "gdi32" (ByVal hdc As Long, ByVal X1 As Long, ByVal Y1 As Long, ByVal X2 As Long, ByVal Y2 As Long) As Long
Declare Function CreateSolidBrush Lib "gdi32" (ByVal crColor As Long) As Long
Declare Function DeleteObject Lib "gdi32" (ByVal hObject As Long) As Long




Public Const TH32CS_SNAPPROCESS As Long = 2&
Public Type PROCESSENTRY32
dwSize As Long
cntUsage As Long
th32ProcessID As Long
th32DefaultHeapID As Long
th32ModuleID As Long
cntThreads As Long
th32ParentProcessID As Long
pcPriClassBase As Long
dwFlags As Long
szExeFile As String * MAX_PATH
End Type

Public Declare Function CreateToolhelpSnapshot Lib "kernel32" _
Alias "CreateToolhelp32Snapshot" _
(ByVal lFlags As Long, ByVal lProcessID As Long) As Long

Public Declare Function ProcessFirst Lib "kernel32" _
Alias "Process32First" _
(ByVal hSnapShot As Long, uProcess As PROCESSENTRY32) As Long

Public Declare Function ProcessNext Lib "kernel32" _
Alias "Process32Next" _
(ByVal hSnapShot As Long, uProcess As PROCESSENTRY32) As Long

Public Declare Function ConfigurePort _
Lib "winspool.drv" Alias "ConfigurePortA" _
(ByVal pName As String, ByVal hwnd As Long, _
ByVal pPortName As String) As Long





Public Const WM_LBUTTONDBLCLICK = &H203
Public Const WM_RBUTTONUP = &H205
Public Const WM_MOUSEMOVE = &H200
Public Const NIM_ADD = &H0
Public Const NIM_MODIFY = &H1
Public Const NIM_DELETE = &H2
Public Const NIF_MESSAGE = &H1
Public Const NIF_ICON = &H2
Public Const NIF_TIP = &H4

Public CIAsystray As NOTIFYICONDATA

Public Type NOTIFYICONDATA
        cbSize As Long
        hwnd As Long
        uId As Long
        uFlags As Long
        ucallbackMessage As Long
        hicon As Long
        szTip As String * 64
End Type



Public Type POINTAPI
        X As Long
        Y As Long
End Type



Sub Startmenu_Show()
'Will make the startmenu visible after being hidden

c% = FindWindow("Shell_TrayWnd", vbNullString)
a = ShowWindow(c%, SW_SHOW)

End Sub

Sub Startmenu_Hide()
' This will hide the startmenu completely
' and you cant get it back unless you run showstartmenu
c% = FindWindow("Shell_TrayWnd", vbNullString)
a = ShowWindow(c%, SW_HIDE)

End Sub

Sub StartButton_Show()
'This makes the startbutton visible
Dim shelltraywnd As Long, Button As Long
shelltraywnd& = FindWindow("shell_traywnd", vbNullString)
Button& = FindWindowEx(shelltraywnd&, 0&, "button", vbNullString)
Call ShowWindow(Button&, SW_SHOW)
End Sub

Sub StartButton_Hide()
'this hides the startbutton completely
Dim shelltraywnd As Long, Button As Long
shelltraywnd& = FindWindow("shell_traywnd", vbNullString)
Button& = FindWindowEx(shelltraywnd&, 0&, "button", vbNullString)
Call ShowWindow(Button&, SW_HIDE)
End Sub

