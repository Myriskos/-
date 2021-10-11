/*
---------------------------------------------------

  CONVER .XLS TO .PNI STHN EPSILON
              13-11-2020
---------------------------------------------------
*/

#define _VIDEO_CH
#define _DDE_CH

#include "winapi.ch"
#include "TSBrowse.ch"
#include "BTNGET.ch"
#include "FiveWin.ch"
#include "dbcombo.ch"

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
FUNCTION LAMPROY()
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
   COLOR    nAcolor , nBcolor  TITLE " Αφοι Λάμπρου ΟΕ "

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
      ACTION  ( DISEMP(oDlgG,.t.)   , TestLamproy() , DISEMP(oDlgG,.f.)   )
   REDEFINE BUTTON ID 101 OF oDlgG ;
      ACTION  oDlgG:End()


 ACTIVATE DIALOG oDlgG  CENTERED   ;
  ON INIT (oDlgG:SetColor( nAcolor , nBcolor )  )




return(.t.)


//-------------------------------------------------
FUNCTION TestLamproy()
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


SET DATE FORMAT TO "DD-MM-YY"

oExcel := TOleAuto():New( "Excel.Application" )   //Start Excel OLE
oExcel:Workbooks:Add()                            //Open Excel with empty book
oExcel:WorkBooks:Open(cMyFile)                    //open existing file

oExcel:Visible := .F.                             //display or hide MS-Excel
oSheet := oExcel:Get("ActiveSheet")               //Get active sheet

nRows := oSheet:UsedRange:Rows:Count()            //returns the number of used rows
nCols := oSheet:UsedRange:Columns:Count()         //returns the number of used columns
oMeter:nTotal :=  nRows
cIDOld := TRAN(oSheet:Cells( 1 , 1 ):Value ,"######")
cKIN := ""
cKODIKOS := 1
cKK := " "   && kodikos kinhsis
///////////FWRITE( Handle  , NTRIM(DAY(DATE())) + " "+ NTRIM(MONTH(DATE())) +" "+ NTRIM(YEAR(DATE()))  + ENDL )

plin := .f.
SubRow := 0
cIDOldSub := ""
cIDNewSub := ""


FWRITE( Handle  , ""  + ENDL )

FOR nRow := 1 TO   nRows

    oMeter:Set(nRow)
    oMeter:Refresh()  && 23-05-2005
    cNotas :=  "Line : " + tran( nRow ,"######") + " of " + tran( nRows ,"######")     ; oSay:Refresh()
    cDATE  :=  oSheet:Cells( nRow , 7 ):Value   //read data from a cell
    cKIN   :=  oSheet:Cells( nRow , 2 ):Value
    IF VALTYPE( cDATE ) == "D" ; cDATE := DTOC(cDATE) ; ENDIF

 IF CTOD(cDATE) >= cDapo  .AND. CTOD(cDATE) <= cDeos  .AND. ;
    LEFT( cKIN ,2 ) == "ΚΣ"

   cIDNew     := TRAN(oSheet:Cells( nRow , 1 ):Value ,"######")
   cIDOldSub  := TRAN(oSheet:Cells( nRow , 1 ):Value ,"######")


   IF cIDNew # cIDOld
      cIDOld := cIDNew
      cKODIKOS++
      plin := .f.
      FWRITE( Handle  , ANSITOOEM( ""  + ENDL )  )
   ENDIF
   cHMER   :=  "   "
   cIDLOG  :=  oSheet:Cells( nRow , 5 ):Value

   // AADD TO 02/08/2008-----------------------------------------------
   cDATE  :=  oSheet:Cells( nRow , 7 ):Value   //read data from a cell
   IF VALTYPE( cDATE ) == "D" ; cDATE := DTOC(cDATE) ; ENDIF
   IF CTOD(cDATE) > cDeos ; EXIT ; ENDIF
   //------------------------------------------------------------------


 //--------------------------------------------------------------------
   For SubRow := nRow to nRows
       cIDNewSub  := TRAN(oSheet:Cells( SubRow , 1 ):Value ,"######")
       IF cIDNewSub # cIDOldSub
        exit
       endif
       cIDSubLOG  :=  oSheet:Cells( SubRow , 5 ):Value
       DO  CASE
           CASE LEFT( cIDSubLOG ,05)  == OEMTOANSI("70.95")
             plin := .t.
           CASE LEFT( cIDSubLOG ,05)  == OEMTOANSI("70.98")
             plin := .t.
           CASE LEFT( cIDSubLOG ,05)  == OEMTOANSI("20.95")
             plin := .t.
           CASE LEFT( cIDSubLOG ,05)  == OEMTOANSI("20.98")
             plin := .t.
       END CASE

   Next

IF LEFT(cIDLOG,2) ==  OEMTOANSI("30") ; cIDLOG := OEMTOANSI("30.00.00.0000") ; ENDIF
IF LEFT(cIDLOG,2) ==  OEMTOANSI("50") ; cIDLOG := OEMTOANSI("50.00.00.0000") ; ENDIF


 //--------------------------------------------------------------------
/*
   IF LEFT(cIDLOG,13) ==  OEMTOANSI("64.00.03.0056") ; cIDLOG := OEMTOANSI("64.00.02.0056") ; ENDIF
   IF LEFT(cIDLOG,13) ==  OEMTOANSI("64.00.03.0057") ; cIDLOG := OEMTOANSI("64.00.02.0057") ; ENDIF

   IF LEFT(cIDLOG,13) ==  OEMTOANSI("30.00.01.0000") ; cIDLOG := OEMTOANSI("30.00.00.0000") ; ENDIF
   IF LEFT(cIDLOG,13) ==  OEMTOANSI("70.03.00.0056") ; cIDLOG := OEMTOANSI("70.00.00.0056") ; ENDIF
   IF LEFT(cIDLOG,13) ==  OEMTOANSI("70.03.00.0057") ; cIDLOG := OEMTOANSI("70.00.00.0057") ; ENDIF

   IF LEFT(cIDLOG,13) ==  OEMTOANSI("20.95.00.0056") ; cIDLOG := OEMTOANSI("20.98.00.0056") ; ENDIF
   IF LEFT(cIDLOG,13) ==  OEMTOANSI("20.95.00.0057") ; cIDLOG := OEMTOANSI("20.98.00.0057") ; ENDIF

//   IF LEFT(cIDLOG,13) ==  OEMTOANSI("70.95.00.0056") ; cIDLOG := OEMTOANSI("70.98.00.0056") ; ENDIF
//   IF LEFT(cIDLOG,13) ==  OEMTOANSI("70.95.00.0057") ; cIDLOG := OEMTOANSI("70.98.00.0057") ; ENDIF
*/

 /*
     IF LEFT(cIDLOG,2) == OEMTOANSI("30")
       cIDLOG := OEMTOANSI("30.00.00.0000")
     ENDIF
     cPARAST :=  oSheet:Cells( nRow , 2):Value + " "+ TRAN(oSheet:Cells( nRow , 3):Value ,"######")
  */

  //----------------------------------------------------
 DO  CASE
        CASE LEFT( cIDLOG ,02)  == OEMTOANSI("30")
             cKK := "70"
        CASE LEFT( cIDLOG ,02)  == OEMTOANSI("70")
             cKK := "70"
        CASE LEFT( cIDLOG ,08)  == OEMTOANSI("54-00-70")
             cKK := "70"
        CASE LEFT( cIDLOG ,08)  == OEMTOANSI("54-00-20")
             cKK := "10"
        CASE LEFT( cIDLOG ,02)  == OEMTOANSI("50")
             cKK := "10"
        CASE LEFT( cIDLOG ,02)  == OEMTOANSI("20")
             cKK := "10"
        CASE LEFT( cIDLOG ,01)  == OEMTOANSI("6"    )
             cKK := "10"
    END CASE

  //---------------------------------------------------


   cPARAST :=  oSheet:Cells( nRow , 3):Value + " "+ TRAN(oSheet:Cells( nRow , 4):Value ,"######")

   cAITIOL :=  oSheet:Cells( nRow , 10):Value


//   if plin
//    cXREO   :=  TRAN(( oSheet:Cells( nRow , 8):Value)*-1 , "#######.##")
//    cPIST   :=  TRAN(( oSheet:Cells( nRow , 9):Value)*-1 , "#######.##")
//   else
    cXREO   :=  TRAN(oSheet:Cells( nRow , 8):Value , "#######.##")
    cPIST   :=  TRAN(oSheet:Cells( nRow , 9):Value , "#######.##")
//   endif
   cAITIOL :=  CONVAITIOL( cAITIOL )

   STT := ""
   STT += cHMER
   STT += cDATE
   STT += RPAD( CONVIDLOG(cIDLOG)    ,13," ")
   STT += RPAD( cPARAST   ,13," ")
   STT += RPAD( cAITIOL   ,25," ")
   STT += PADL( cKODIKOS  ,04,"0")
   STT += SPACE(5)
   STT += SPACE(3)
   STT += SPACE(13)
   STT += cKK
   STT += SPACE(7)  && 8
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

//  ShellExecute(  ,"open","EDIT.COM", Prn_file  ,,1)
// 23-04-201    ShellExecute(  ,"open","notepad.exe", Err_file  ,,1)

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
/*
LOCAL NS := "" , cC := 0
   cAITIO := TRIM(cAITIO )
   SIZE   := LEN( cAITIO )
   FOR i := 1 TO SIZE
      NS := SUBSTR( cAITIO , (SIZE-cC)  , 1 )
      IF NS == OEMTOANSI("-") ; EXIT ; ENDIF
      cC++
   NEXT

RETURN( RIGHT( cAITIO , cC)  )
*/

LOCAL NS := "" , cC := 0  , ncC := 0
   cAITIO := TRIM(cAITIO )
   SIZE   := LEN( cAITIO )
   FOR i := 1 TO SIZE
      NS := SUBSTR( cAITIO , (SIZE-cC)  , 1 )
      IF NS == OEMTOANSI("(") ; EXIT ; ENDIF
      cC++
   NEXT
   cTT := RIGHT( cAITIO , cC  )
   SIZE := LEN( cTT )
RETURN(  left(   cTT  , ( size - 1)  )  )
//RETURN(  RIGHT( cAITIO , cC  )  )




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
