/*
---------------------------------------------------
              GANATSOS GEOPROSTASIA
  CONVER XLS TO ASCCI ‚€ ‚„”“€ ‚‘’‰†‘ STHN EPSILON
             ‹“‘‰‘ —€†‘  0-09-2018
---------------------------------------------------
*/

#define _VIDEO_CH
#define _DDE_CH

#include "winapi.ch"
#include "TSBrowse.ch"
#include "BTNGET.ch"
#include "FiveWin.ch"
#include "dbcombo.ch"
//#include "dbcombo.ch"

#include "\TSBrowse\Include\TSBrowse.ch"


#define CLR_PINK   nRGB( 255, 128, 128)
#define CLR_NBLUE  nRGB( 128, 128, 192)
#define CLR_NBROWN  nRGB( 130, 99, 53)
#define CLR_1 nRGB( 190, 215, 190 )
#define CLR_2 nRGB( 230, 230, 230 )
#define CLR_3 nRGB( 217, 217, 255 )
#define CLR_GOLDENROD     nRGB(218, 165,  32)
#define CLR_LemonChiffon3 nRGB(205, 201, 165)
#define CLR_Ivory3        nRGB(205, 205, 193)

#define NTRIM(n)  ( LTrim(Str(n)) )

//-------------------------------------------------
FUNCTION GEFYRA()
//-------------------------------------------------

  LOCAL oDlgm , oDlgG ,  oIDEPA , oLbx , bOb1 ,bOb2 , oBtn2 , lAppend

  public lCUR := "\"+CURDIR()
  lBMP     := lCUR  +"\BITMAPS\"
  lICO     := lCUR  +"\ICO\"
  XPICO    := lCUR  +"\XPICO\"
  WorkPath := lCUR  +"\DATA\"

 //  nAcolor := RGB(205, 205, 193)
 //  nBcolor := RGB(193, 205, 193)

   PUBLIC lDLL := lCUR  +"\DLL\"
  // PUBLIC hBorland , hFwctrls
   PUBLIC cNotas := "LIne : "   &&  , cMeter := 9999999
   public oMeter , cMeter := 0 ,  oSay , cGetXls := "" , cGetTxT := ""

   PUBLIC cXLSString := "Excel file|*.XLS"
   PUBLIC cTXTString := "PNI   file|*.PNI"
   PUBLIC cGetXls := lCUR + "\GEFYRA\2018\012018.xls"
   PUBLIC cGetTxt := lCUR + "\PNI\EP012018.pni"
   PUBLIC cDapo := CTOD(SPACE(10)) , cDeos := CTOD(SPACE(10))


   SET DATE FRENCH
   SET EPOCH TO  1990
   SET DATE FORMAT TO "DD/MM/YYYY"

   nAcolor := RGB(205, 205, 193)
   nBcolor := RGB(228, 230, 231)


   DEFINE FONT oFont   NAME GetSystemFont()   SIZE 0,-12  && NCHARSET 161

  DEFINE DIALOG oDlgG RESOURCE "GEFYRA" ;
   COLOR    nAcolor , nBcolor  TITLE " ΓΕΩΠΡΟΣΤΑΣΙΑ ΓΚΑΝΑΤΣΟΣ "

    REDEFINE GET oGetXls VAR cGetXls ID 102 OF oDlgG ;
           FONT oFont
   REDEFINE GET oGetTxt VAR cGetTxt ID 105 OF oDlgG ;
           FONT oFont


   REDEFINE  BTNBMP ID 106 FILENAME lCUR + "\openXls.bmp"  OF oDlgG ;
    ACTION ( cGetXls :=   cGetFile(    cXLSString                ,;
             "Επέλεξε ενα Αρχείο Excel " ) ,  oGetXls:Refresh() )

    REDEFINE  BTNBMP ID 107 FILENAME lCUR + "\openXls.bmp"  OF oDlgG ;
    ACTION ( cGetTxT :=   cGetFile(    cTXTString                ,;
             "Επέλεξε ενα Αρχείο EXODOY " ) ,  oGetTxT:Refresh() )


    REDEFINE GET oDapo   VAR cDapo   ID 108 OF oDlgG ;
           FONT oFont  valid !empty(cDapo)

   REDEFINE GET oDeos   VAR cDeos   ID 109 OF oDlgG ;
           FONT oFont  valid !empty(cDeos)

   REDEFINE SAY oSay VAR cNotas ID 104 OF oDlgG ;
           color "w/r"  FONT oFont

   REDEFINE METER oMeter VAR cMeter  ID 103 OF oDlgG

   REDEFINE BUTTON ID 100 OF oDlgG ;
      ACTION  ( DISEMP(oDlgG,.t.)   , Test() , DISEMP(oDlgG,.f.)   )
   REDEFINE BUTTON ID 101 OF oDlgG ;
      ACTION  oDlgG:End()


 ACTIVATE DIALOG oDlgG  CENTERED   ;
  ON INIT (oDlgG:SetColor( nAcolor , nBcolor )  )




return(.t.)
//-------------------------------------------------
FUNCTION Test()
//-------------------------------------------------


Local   oExcel, oSheet, oWin , nRow , nCol
Local   cMyFile := trim(cGetXls)

Local   Prn_file  :=   cGetTxt    && lCUR + "\GEFYRA.TXT"
Local   ERR_file  :=   lCUR + "\ERR.TXT"
Local   Handle := FCREATE( Prn_file )
Local   Herr   := FCREATE( Err_file )
Local   ENDL := CHR(13)+CHR(10)
Local   ENDF := CHR(26)
local   A00 := A95 := A98 := 0
local   P00 := P95 := P98 := 0
local   D00 := 0    && DAPANES
local   cHmer
SET DATE FORMAT TO "DD-MM-YY"

oExcel := TOleAuto():New( "Excel.Application" )   //Start Excel OLE
oExcel:Workbooks:Add()                            //Open Excel with empty book
oExcel:WorkBooks:Open(cMyFile)                    //open existing file

oExcel:Visible := .F.                             //display or hide MS-Excel
oSheet := oExcel:Get("ActiveSheet")               //Get active sheet

nRows := oSheet:UsedRange:Rows:Count()            //returns the number of used rows
nCols := oSheet:UsedRange:Columns:Count()         //returns the number of used columns
oMeter:nTotal :=  nRows
cIDOld := TRAN(oSheet:Cells( 2 , 1 ):Value ,"########")
cHmer  := TRAN(oSheet:Cells( 2 , 11):Value ,       "#")

cIDOld := cIDOld+ cHmer

cKIN := ""
cKODIKOS := 1
cKK := " "   && kodikos kinhsis
///////////FWRITE( Handle  , NTRIM(DAY(DATE())) + " "+ NTRIM(MONTH(DATE())) +" "+ NTRIM(YEAR(DATE()))  + ENDL )


FWRITE( Handle  , ""  + ENDL )

FOR nRow := 2 TO   nRows

    oMeter:Set(nRow)
    oMeter:Refresh()
    cNotas :=  "Line : " + tran( nRow ,"######") + " of " + tran( nRows ,"######")     ; oSay:Refresh()
    cDATE  :=  oSheet:Cells( nRow , 7 ):Value   //read data from a cell
    cKIN   :=  oSheet:Cells( nRow , 2 ):Value
    IF VALTYPE( cDATE ) == "D" ; cDATE := DTOC(cDATE) ; ENDIF

 IF CTOD(cDATE) >= cDapo  .AND. CTOD(cDATE) <= cDeos  .AND. ;
   ( LEFT( cKIN ,2 ) == "ΚΣ"  .OR. LEFT( cKIN ,2 ) == "ΤΚ" )

   cIDNew     := TRAN(oSheet:Cells( nRow , 1 ):Value ,"########")
   cHmer      := TRAN(oSheet:Cells( nRow , 11):Value ,       "#")
   cIDNew     := cIDNew+ cHmer


   IF cIDNew #  cIDOld
      cIDOld := cIDNew
      cKODIKOS++
      FWRITE( Handle  , ANSITOOEM( ""  + ENDL )  )
   ENDIF
   cIDLOG  :=  oSheet:Cells( nRow , 5 ):Value

   // AADD TO 02/08/2008-----------------------------------------------
   cDATE  :=  oSheet:Cells( nRow , 7 ):Value   //read data from a cell
   IF VALTYPE( cDATE ) == "D" ; cDATE := DTOC(cDATE) ; ENDIF
   IF CTOD(cDATE) > cDeos ; EXIT ; ENDIF
   //------------------------------------------------------------------

// MSGINFO( LEFT(cIDLOG,13) ," PRIN  dbSoft"  )

   IF LEFT(cIDLOG,13) ==  OEMTOANSI("20-00-00-1036") ; cIDLOG := OEMTOANSI("20-02-00-0013") ; ENDIF
   IF LEFT(cIDLOG,13) ==  OEMTOANSI("20-00-00-1057") ; cIDLOG := OEMTOANSI("20-02-00-0024") ; ENDIF
   IF LEFT(cIDLOG,13) ==  OEMTOANSI("20-98-00-1036") ; cIDLOG := OEMTOANSI("20-04-00-0013") ; ENDIF
   IF LEFT(cIDLOG,13) ==  OEMTOANSI("20-95-00-1036") ; cIDLOG := OEMTOANSI("20-03-00-0013") ; ENDIF

   IF LEFT(cIDLOG,13) ==  OEMTOANSI("38-00-00-0001") ; cIDLOG := OEMTOANSI("38-01-00-0000") ; ENDIF
   IF LEFT(cIDLOG,13) ==  OEMTOANSI("38-00-01-0000") ; cIDLOG := OEMTOANSI("38-01-00-0000") ; ENDIF
   IF LEFT(cIDLOG,13) ==  OEMTOANSI("38-03-00-0000") ; cIDLOG := OEMTOANSI("38-02-00-0001") ; ENDIF

   IF LEFT(cIDLOG,13) ==  OEMTOANSI("38-03-04-0000") ; cIDLOG := OEMTOANSI("38-02-00-0001") ; ENDIF
   IF LEFT(cIDLOG,13) ==  OEMTOANSI("38-03-02-0000") ; cIDLOG := OEMTOANSI("38-02-00-0002") ; ENDIF

   IF LEFT(cIDLOG,13) ==  OEMTOANSI("54-00-20-0036") ; cIDLOG := OEMTOANSI("54-02-02-2013") ; ENDIF
   IF LEFT(cIDLOG,13) ==  OEMTOANSI("54-00-20-0057") ; cIDLOG := OEMTOANSI("54-02-02-2024") ; ENDIF
   IF LEFT(cIDLOG,13) ==  OEMTOANSI("54-00-70-0036") ; cIDLOG := OEMTOANSI("54-02-01-7013") ; ENDIF
   IF LEFT(cIDLOG,13) ==  OEMTOANSI("54-00-70-0057") ; cIDLOG := OEMTOANSI("54-02-01-7024") ; ENDIF

   IF LEFT(cIDLOG,13) ==  OEMTOANSI("70-00-00-1036") ; cIDLOG := OEMTOANSI("70-01-01-0013") ; ENDIF
   IF LEFT(cIDLOG,13) ==  OEMTOANSI("70-00-00-1057") ; cIDLOG := OEMTOANSI("70-01-01-0024") ; ENDIF

// MSGINFO( LEFT(cIDLOG,13) ," META  dbSoft"  )


 //---DIAMORFOSH PARASTATIKOY
     cPARAST :=  LEFT( oSheet:Cells( nRow , 3):Value ,7) + " "+ TRAN(oSheet:Cells( nRow , 4):Value ,"######")

     IF LEFT(cIDLOG,2) == OEMTOANSI("30")
       cIDLOG := OEMTOANSI("30.01.01.0000")
     ENDIF
     IF LEFT(cIDLOG,2) == OEMTOANSI("50")
       cIDLOG := OEMTOANSI("50.00.00.0000")
     ENDIF

/*
  //----------------------------------------------------

  DO  CASE
        CASE LEFT( cIDLOG ,02)  == OEMTOANSI("30")
             cKK := "3"
        CASE LEFT( cIDLOG ,02)  == OEMTOANSI("70")
             cKK := "3"
        CASE LEFT( cIDLOG ,02)  == OEMTOANSI("50")
             cKK := "4"
        CASE LEFT( cIDLOG ,02)  == OEMTOANSI("20")
             cKK := "4"
        CASE LEFT( cIDLOG ,01)  == OEMTOANSI("6"    )
             cKK := "4"
    END CASE
  //---------------------------------------------------
 */
    cAITIOL :=  oSheet:Cells( nRow ,10):Value
    cXREO   :=  TRAN(oSheet:Cells( nRow , 8):Value , "#######.##")
    cPIST   :=  TRAN(oSheet:Cells( nRow , 9):Value , "#######.##")
    cAITIOL :=  CONVAITIOL( cAITIOL )
    cKK     :=  "3"
   STT := "   "
   STT += cDATE
   STT += RPAD( CONVIDLOG(cIDLOG)    ,13," ")
   STT += RPAD( cPARAST   ,13," ")
   STT += RPAD( cAITIOL   ,25," ")
   STT += PADL( cKODIKOS  ,04,"0")
   STT += SPACE(5)
   STT += SPACE(3)
   STT += SPACE(13)
   STT += cKK
   STT += SPACE(8)
   IF !EMPTY( VAL(cXREO) ) ; STT += "1" + PADL( cXREO  ,10," ") + PADL( cPIST ,10," ")  ; ENDIF
   IF !EMPTY( VAL(cPIST) ) ; STT += "2" + PADL( cXREO  ,10," ") + PADL( cPIST ,10," ")  ; ENDIF
   // „„‚•‘ ‚€ „‚‚€”„‘ ‹„ ‹†ƒ„‰† €€ ‰€ ‘’† •„—‘† ‰€ ‘’† ‘’—‘†
   IF VAL(cXREO) + VAL(cPIST) # 0
    FWRITE( Handle  , ANSITOOEM( STT + ENDL )  )
   ENDIF

 ENDIF
NEXT


  FWRITE( Handle  , ENDL+ ENDF   )
  FCLOSE(Prn_file)

  FCLOSE(Err_file)

  oMeter:Set(0)
  oMeter:Refresh()
oExcel:Quit()                                       //Close MS Excel application




MSGINFO( " Η Εργασία Ολοκληρώθηκε επιτυχώς " ,"dbSoft"  )

// ShellExecute(  ,"open","notepad.exe", Err_file  ,,1)

SET DATE FORMAT TO "DD/MM/YYYY"


RETURN ( .T. )

//------------------------------
STATIC FUNCTION CONVIDLOG( cIDLOG )
//------------------------------
LOCAL NS := "" , cC := ""
   cIDLOG := TRIM(cIDLOG )
   SIZE   := LEN( cIDLOG )
   FOR i := 1 TO SIZE
      NS := SUBSTR( cIDLOG , i , 1 )
      IF NS == "." ; NS := "-"  ; ENDIF
      cC += NS
   NEXT

RETURN(  cC  )

//------------------------------
STATIC FUNCTION CONVAITIOL( cAITIO )
//------------------------------
LOCAL NS := "" , cC := 0 ; NewAitio := ""
   cAITIO := TRIM(cAITIO )
   SIZE   := LEN( cAITIO )

   FOR i := 1 TO SIZE
      NS := SUBSTR( cAITIO , (SIZE-cC)  , 1 )
      NewAitio += NS
      IF NS == OEMTOANSI("(") .AND. cC++ > 5  ; EXIT ; ENDIF
      cC++
   NEXT

  NS     := ""
  cAITIO := ""
  cC     := 0
  SIZE:= LEN(NewAitio)


   FOR i := 2 TO SIZE-1
      NS := SUBSTR( NewAitio , ((SIZE-1)-cC)  , 1 )
      IF NS != OEMTOANSI(" (") .OR. NS != OEMTOANSI(")")  ;  cAITIO += NS ; ENDIF
     // cAITIO += NS
      cC++
   NEXT



RETURN( LEFT( cAITIO,25 ) )
//RETURN( RIGHT( cAITIO , cC-1)  )


******************************************************************************
Function SayRotated(oWnd,Y,X,cPrompt,oFont,nClrText,nClrPane,l3D)
******************************************************************************
  Local hDC:=oWnd:hDC
  DEFAULT nClrText:=CLR_BLUE, l3D:=.T.

  IF l3D
    DrawRotated(hdc, cPrompt, Y + 1, X + 1, CLR_BLACK,nClrPane,oFont)
    DrawRotated(hdc, cPrompt, Y - 1, X - 1, nClrText,nClrPane,oFont)
  ENDIF
  DrawRotated(hdc, cPrompt, Y , X , nClrText,nClrPane,oFont)

return

******************************************************************************
Static Function DrawRotated(hDC,cPrompt,Y,X,nClrText,nClrPane,oFont)
  Local hOldFont, nOldMode, nOldClrText, nOldClrPane

  nOldClrText:=SetTextColor(hDC,nClrText)
  if nClrPane<>nil
    nOldClrPane:=SetBkColor(hDC,nClrPane)
  else
    nOldBkMode:=SetBkMode(hDC,1)
  endif
  hOldFont:=SelectObject(hDC,oFont:hFont)
  TextOut(hDC,Y,X,cPrompt,Len(cPrompt))
  SelectObject(hDC,hOldFont)
  if nClrPane<>nil
    SetBkColor(hDC,nOldClrPane)
  else
    SetBkMode(hDC,nOldBkMode)
  endif
  SetTextColor(hDC,nOldClrText)
return


/*
//----------------------------
FUNCTION GetSystemFont()
//----------------------------
RETURN  "Arial"
//RETURN  "Courier New"

//RETURN "Arial Greek"
//RETURN "Comic Sans MS"

*/



//--------------------------
STATIC FUNCTION DISEMP( oDlg ,flag  )
//--------------------------

FOR i = 1 TO LEN( oDlg:aControls )
    IF UPPER( oDlg:aControls[ i ]:ClassName() ) = "TGET"
       IF flag
         oDlg:aControls[ i ]:Disable()
       ELSE
         oDlg:aControls[ i ]:Enable()
       ENDIF
    ENDIF
NEXT
