#INCLUDE "Fivewin.ch"
#INCLUDE "XBROWSE.ch"

STATIC c_Path

Function MAIN()
Local oDlg, oTxtFont, oBrw, aData := {}
Local oBrush1, oBrush2, oBtn1, oBtn2, oBtn3, oBtn4, aData1 := "", aData2 := ""

DEFINE FONT oTxtfont NAME 'Arial' SIZE 0,-14 BOLD

c_path := GETCURDIR() 
IF !FILE( c_path + "\INITEST.EXE" ) // Change to Name of Application !!!!!!!
	c_path := CURDRIVE() + ":\" + GETCURDIR()
ENDIF

DEFINE BRUSH oBrush1 FILENAME c_path + "\Bitmaps\MARBLE.BMP" 
DEFINE BRUSH oBrush2 FILENAME c_path + "\Bitmaps\STONE.BMP" 

//AADD( aData, { "Toyota",  "Value 1" } )
//AADD( aData, { "Volvo",  "Value 2" } )
//AADD( aData, { "Opel",  "Value 3" } )
//AADD( aData, { "Ford",  "Value 4" } )
//AADD( aData, { "Peugot",  "Value 5" } )
//AADD( aData, { "Mercedes",  "Value 6" } )
//AADD( aData, { "Nissan",  "Value 7" } )

// MsgAlert( Len ( aData ) )

DEFINE DIALOG oDlg SIZE 500, 500

oDlg:SetBrush( oBrush1 )

IF !FILE ( c_path + "\SETTINGS.INI" )
	AADD( aData, { "Toyota",  "Value 1" } )
	SAVE_INI(@aData)
ENDIF

@ 10, 10 XBROWSE oBrw OF oDlg ;
COLUMNS 1, 2  ;
HEADERS "Cars","Values" ;
COLSIZES 90, 90 ;
ARRAY aData  LINES FASTEDIT CELL ;
SIZE 120, 200 PIXEL FONT oTxtFont ;
ON CHANGE { aData1 := aData[oBrw:nArrayAt, 1 ], ;
                         aData2 := aData[oBrw:nArrayAt, 2 ], ;
			 oGet1:Refresh(), oGet2:Refresh() }
 
oBrw:nMarqueeStyle  := 1
oBrw:nRowHeight := 30
oBrw:lFooter := .t.
oBrw:nColDividerStyle	 := LINESTYLE_BLACK
oBrw:nRowDividerStyle := LINESTYLE_BLACK
oBrw:nRecSelColor = 15512898 
oBrw:bClrSelFocus = { || { 16777215, 15512898 } } 
oBrw:bClrSel = { || { 16777215, 15512898 } } 

oBrw:SetBackGround( oBrush2 )

WITH OBJECT oBrw
      :nEditTypes   := EDIT_GET
      :bPastEof     := { ||  AddRow( oBrw ) }
      :bKeyDown  := { |nKey| If( nKey == VK_DELETE, DeleteRow( oBrw ), ;
                              If( nKey == VK_INSERT, InsertRow( oBrw ), ;
                              nil ) ) }
      :CreateFromCode()
END

@ 10, 160 GET oGet1 VAR aData1 OF oDlg SIZE 38, 15 PIXEL ;
FONT oTxtFont COLOR 0, 16443068  UPDATE
@ 10, 202 GET oGet2 VAR aData2 OF oDlg SIZE 38, 15 PIXEL ;
FONT oTxtFont COLOR 0, 16443068   UPDATE

@ 30, 160 BTNBMP oBtn1 ;
FILENAME c_path + "\Bitmaps\Save.bmp" ;
SIZE 80, 30 OF oDlg 2007 PIXEL NOBORDER ;
PROMPT "   &Save" ;
ACTION ( aData[oBrw:nArrayAt, 1 ] := aData1, ;
                 aData[oBrw:nArrayAt, 2 ] := aData2, oBrw:Refresh(), ;
		 aData := oBrw:aArrayData, ;		 
		 SAVE_INI(@aData) ) ;
FONT oTxtFont ;
LEFT
oBtn1:cToolTip =  { "Save to " + CRLF + "xBrowse","Save", 1, CLR_BLACK, 14089979 }
oBtn1:SetColor( 0, )

@ 70, 160 BTNBMP oBtn2 ;
FILENAME c_path + "\Bitmaps\New.bmp" ;
SIZE 80, 30 OF oDlg 2007 PIXEL NOBORDER ;
PROMPT " &New Pos." ;
ACTION ( ADDROW( oBrw ), ;
                 oBrw:Refresh() ) ;
FONT oTxtFont ;
LEFT
oBtn2:cToolTip =  { "New Array-Pos" + CRLF + "xBrowse","New", 1, CLR_BLACK, 14089979 }
oBtn2:SetColor( 0, )

@ 170, 160 BTNBMP oBtn3 ;
FILENAME c_path + "\Bitmaps\Relaunch.bmp" ;
SIZE 80, 30 OF oDlg 2007 PIXEL NOBORDER ;
PROMPT " &Relaunch" ;
ACTION ( oDlg:Update(), ;
                 aData := oBrw:aArrayData, SAVE_INI(@aData), ;
		 WINEXEC( "RESTART Initest.exe " + Str( oDlg:hWnd ) ) ) ;
FONT oTxtFont ;
LEFT
oBtn3:cToolTip =  { "Save to INI" + CRLF + "and RELAUNCH","EXIT", 1, CLR_BLACK, 14089979 }
oBtn3:SetColor( 0, )

@ 210, 160 BTNBMP oBtn4 ;
FILENAME c_path + "\Bitmaps\Exit.bmp" ;
SIZE 80, 30 OF oDlg 2007 PIXEL NOBORDER ;
PROMPT " &Exit    " ;
ACTION ( oDlg:Update(), ;
                 aData := oBrw:aArrayData, SAVE_INI(@aData), ;
                 oDlg:End() ) ; 
FONT oTxtFont ;
LEFT
oBtn4:cToolTip =  { "Exit" + CRLF + "INI-Test","EXIT", 1, CLR_BLACK, 14089979 }
oBtn4:SetColor( 0, )

ACTIVATE DIALOG oDlg CENTERED ;
ON INIT ( READ_INI(@aData), oBrw:SetArray( aData, .T. ), ;
		aData1 := aData[1, 1 ], ;
		aData2 := aData[1, 2 ], oDlg:Update() )

oTxtFont:End()
oBrush1:End()
oBrush2:End()

RETURN( NIL )

// ----------------

STATIC FUNCTION BLANKROW

RETURN { "          ", "          " }

// -----------------

STATIC FUNCTION ADDROW( oBrw )

AAdd( oBrw:aArrayData, BlankRow() )
oBrw:Refresh()
oBrw:GoBottom()

RETURN NIL

// ----------------

STATIC FUNCTION INSERTROW( oBrw )

AIns( oBrw:aArrayData, oBrw:nArrayAt, BlankRow(), .t. )
oBrw:Refresh()

RETURN NIL

// ---------------

STATIC FUNCTION DELETEROW( oBrw )

IF ! Empty( oBrw:aArrayData )
      ADel( oBrw:aArrayData, oBrw:nArrayAt, .t. )
      oBrw:Refresh()
ENDIF

RETURN NIL

// --------- INI - Read -------------

FUNCTION READ_INI(aData)
Local oInifile, nPos1 := 1, nPos2 := 1, cValue := "", nCount := 0
Local aData1 := {}

INI oInifile FILE c_path + "\SETTINGS.INI"
	DO WHILE .T.
		nCount++
		GET  cValue SECTION  "System"  ENTRY "cField_" + AllTrim( Str( nCount)) OF oInifile DEFAULT ""
		IF !EMPTY(cValue)
			nPos1 := AT( ",", Alltrim(cValue) )
			nPos2 := LEN( Alltrim(cValue) ) - nPos1
			// MsgAlert( cValue, "Value" ) 
			AADD( aData1, { PADR( SUBSTR( cValue, 1, nPos1 -1 ), 10, " "), ;
						   PADR( SUBSTR( cValue, nPos1 + 1, nPos2 ), 10, " ") } )
		ELSE
			EXIT
		ENDIF
	ENDDO
	lSysini := .F.
ENDINI
aData := {}
FOR I := 1 TO LEN( aData1 )
	AADD( aData, aData1[I] )
//	MsgAlert( aData[I][2], aData[I][1] )
NEXT

RETURN aData

// ---------  INI Write------------------------

FUNCTION SAVE_INI(aData)
LOCAL lSysini := .T., cField := "", cValue := ""
LOCAL cIniFile := c_path + "\SETTINGS.INI"

IF FILE ( cIniFile )
	DELETE FILE &cIniFile
ENDIF
I := 1
FOR I := 1 TO LEN(aData)
	cField := "cField_" + ALLTRIM(STR(I)) 
        cValue := TRIM(aData[I][1]) + ',' + TRIM(aData[I][2]) 
	IF WritePProString( "System", cField, cValue, cIniFile ) = .F.
		lSysini := .F.
	ENDIF
NEXT

RETURN NIL

 