#define _VIDEO_CH
#define _OBJECTS_CH
#define _DDE_CH

#define CLR_PINK   nRGB( 255, 128, 128)
#define CLR_NBLUE  nRGB( 128, 128, 192)
#define CLR_NBROWN  nRGB( 130, 99, 53)

//#define CLR_1 nRGB( 190, 215, 190 )
//#define CLR_2 nRGB( 230, 230, 230 )
#define CLR_3 nRGB( 217, 217, 255 )

#define CLR_1 nRGB( 204, 230, 255 )
#define CLR_2 nRGB( 230, 230, 230 )





#include "Fivewin.ch"
#include "\TSBrowse\Include\TSBrowse.ch"


static oWnd

GLOBAL  cCODE
GLOBAL  lCUR , lDLL , lBMP , lICO , XPICO , WorkPath

function Main()

   local oBar, oPopup,oPopup1,oPopup2, oBtn , oBtn1 , oBtn2 , oBmp , oFnt , oICON
   public  GloCODE
*---- Comandos Set's ----*
        SET DATE FRENCH
        SET EPOCH TO  1990
        SET DATE FORMAT TO "DD/MM/YYYY"
        SET DELETE ON
        SetHandleCount(150)
   SetBalloon( .T. ) // Balloon shape required for tooltips

   DEFINE FONT oFnt  NAME GetSystemFont()   SIZE 0,-10

   DEFINE ICON oICON RESOURCE  "Super"

   DEFINE BITMAP oBmp RESOURCE "backWin" OF oWnd
 DEFINE WINDOW oWnd  TITLE "Εφαρμογή Διαχ/σης Αρχείων EXCEL "  ICON  oICON  ;
      COLORS CLR_2, CLR_1 ;
      MENU BuildMenu()   MDI

   DEFINE BUTTONBAR oBar 3D OF oWnd SIZE 100, 60 2007
    //--------------------------------
      MENU oPopup1 POPUP
       MENUITEM "Παράμετροι Εφαρμογής" ACTION oWnd:cTitle("Εφαρμογή Λογιστικής Ενημέρωσης Epsilon   " + " από εμπορικές Εφαρμογές " )
       MENUITEM "ΓΕΩΠΡΟΣΤΑΣΙΑ ΓΚΑΝΑΤΣΟΣ        "        ACTION GEFYRA()
       MENUITEM "Φαναρόπουλος  ΑΒ Βασιλόπουλος "        ACTION KEFALAIO()
       MENUITEM "Β & Δ Λαμπρου ΟΕ              "        ACTION LAMPROY()
 //      MENUITEM "Thl Kat                       "        ACTION thlkat()
 //      MENUITEM "KATALOGOS                     "        ACTION KATALOGOS()

      ENDMENU

    DEFINE BUTTON oBtn1 OF oBar ACTION oBtn1:ShowPopup() ;
      RESOURCE "people" PROMPT "Αρχεία-Πίνακες" GROUP ;
      MENU oPopup1 TOOLTIP "Ενημέρωση Βοηθητικών Πινάκων"
   //--------------------


   //-------------------
    MENU oPopup2 POPUP
      MENUITEM "&Καρτέλλα 01"    //  ACTION REPDEMO(oWnd)
      MENUITEM "&Καρτέλλα 02"    //  ACTION REPDEMO2(oWnd)

   ENDMENU

    DEFINE BUTTON  oBtn2 OF oBar ACTION  oBtn2:ShowPopup() ;   //Print() ;
      RESOURCE "print" PROMPT "Εκτυπώσεις"      GROUP ;
    MENU oPopup2 TOOLTIP "Εκτυπωσεις Crystal Report version 8.5"
   //-----------------------

  // DEFINE BUTTON OF oBar ACTION ASTRN(oWnd) ;
  //    RESOURCE "timedate" PROMPT "Αρχείο Κινήσεων" WHEN .T. TOOLTIP "Καταχώρηση ..."


   SET MESSAGE OF oWnd TO "Site:  www.dbsoft.gr    email:  info@dbsoft.gr   2012    " ;
      CENTERED CLOCK KEYBOARD 2007

 ACTIVATE WINDOW oWnd  MAXIMIZED ;
    ON PAINT DrawBitmap( hDC, oBmp:hBitMap, ;
                        ( oWnd:nHeight() / 2 ) - ( oBmp:nHeight() / 2 ) - 50, ;
                        ( oWnd:nWidth() / 2 ) - ( oBmp:nWidth() / 2 ) ) ;
      VALID MsgYesNo( "Θέλετε να εγκαταλείψετε το Πρόγραμμα" )

return nil



//----------------------------------------------------------------------------//

function BuildMenu()

   local oMenu
   MENU oMenu 2007
      MENUITEM "&Προβολές"
      MENU
         MENUITEM "&Αναλυτικές Καρτέλες." FILENAME "bitmaps\16x16\favorite.bmp"  ACTION BmpPel()
         MENUITEM "&Report..."
         MENU
            MENUITEM "&Καρτέλλα A"
            MENUITEM "&Καρτέλλα B"

            MENUITEM "&Three..." WHEN .F.
         ENDMENU
         SEPARATOR
         MENUITEM "&Εχοδος" ACTION oWnd:End()
      ENDMENU

      MENUITEM "Edit" WHEN .F.

      ////oMenu:AddHelp()

      MENUITEM "Βοηθητικά Προγράμματα"
       MENU
            MENUITEM "&Αναδιοργάνωση Δεικτών Αρχείων" DISABLED
            MENUITEM "&Αντίγραφα Ασφαλίας(Backup)..." CHECKED
            MENUITEM "&Επαναφορά Αρχείων (Restore).." WHEN .F.
         ENDMENU

     // oMenu:AddHelp()
     oMenu:AddHelp( "Εμπορικές Εφαρμογές ", "(c) dbSoft Software 2012" )
   ENDMENU

return oMenu

//----------------------------------------------------------------------------//

function BmpPel()

   local  cTUTH
   IF !EMPTY(GloCODE)
      cTUTH := "TUTH"+ PADL(GloCODE,5,"0") +".bmp"
     IF ! FILE( "\oros Aplication\MAPS\"+ (cTUTH)  )
      COPY FILE ("\oros Aplication\TUTH0.bmp" ) TO  ( "\oros Aplication\MAPS\"+ (cTUTH) )
     ENDIF
     WINEXEC("mspaint.exe "+ "\oros Aplication\MAPS\"+(cTUTH) )

   ENDIF

return nil


//----------------------------------------------------------------------------//

procedure AppSys // XBase++ requirement

return

//----------------------------
FUNCTION GetSystemFont()
//----------------------------
RETURN  "Arial Greek"

//----------------------------
FUNCTION OPENXLS()
//---------------------------

RETURN

/*
//-----------------------------------------
FUNCTION OPENASCI()
//----------------------------------------=
 LOCAL cFile := "H:\GKANATSOS GEOPROSTASIA\012018.ASC"
 LOCAL cTemp := ""
 LOCAL oFile := TFileRead():New( cFile )
 LOCAL cString := SPACE(80)
 PUBLIC  ENDL := CHR(13)+CHR(10)
 PUBLIC  ENDF := CHR(26)

#include "fileio.ch"

lROW := 1

PUBLIC    cHMER     :=  SPACE(3)
PUBLIC    cDATE     :=  SPACE(8)
PUBLIC    cGLMAST   :=  SPACE(13)
PUBLIC    cPARA     :=  SPACE(13)
PUBLIC    cDESC     :=  SPACE(25)
PUBLIC    KODIKOS   :=  VAL(SPACE(4))
PUBLIC    cPLHRVMH  :=  SPACE(1)
PUBLIC    cEIDOS    :=  VAL(SPACE(1))
PUBLIC    cK_AXIA   :=  VAL(SPACE(12))
PUBLIC    cF_AXIA   :=  VAL(SPACE(12))
PUBLIC    cT_AXIA   :=  VAL(SPACE(12))
PUBLIC    cAXIA     :=  VAL(SPACE(12))
PUBLIC    cID_LOG   :=  SPACE(10)
PUBLIC    lID_LOG   :=  SPACE(10)
PUBLIC    cTOTX := 0
PUBLIC    cTOTP := 0
PUBLIC    cArrGrammh := ARRAY(10,12)
PUBLIC    cTHESH     := 0
PUBLIC    cTOTPOL    := 0
PUBLIC    cTOTAGO    := 0

TOTREC := 0


 Prn_file  := "H:\GKANATSOS GEOPROSTASIA\012018.PNI"
 PUBLIC Handle := FCREATE( Prn_file )

oFile:Open()
IF oFile:Error()
    msgStop( oFile:ErrorMsg( "FileRead: " ) )
ELSE
    WHILE oFile:MoreToRead()
      cString := oFile:ReadLine()
      APAR    := SUBSTR( cString ,01 ,07 )

      // Msginfo(  OEMTOANSI( cString ) )
       WRITELINE( OEMTOANSI(cString) )
    ENDDO
    oFile:Close()
ENDIF

  FWRITE( Handle  , ENDL+ ENDF   )
  FCLOSE(Prn_file)

    MSGINFO(" ASCI FILE READ OK  ")

 RETURN

FUNCTION WRITELINE( cTEMP )

  FWRITE( Handle  , cTEMP  + ENDL )

RETURN
*/



/*
oFile := TTxtFile():new( cPathArquivo + "arquivo.reg" )

IF !oFile:open()

? "Arquivo nΓ£o pΓ΄de ser aberto..."

ENDIF

? oFile:lastRec()

? oFile:recCount()

FOR nPos := 1 TO 12

? oFile:readLine()

oFile:skip()

NEXT
 */




//FUNCTION Hb_NtoS( n ) ; RETURN ltrim( str( n ) )
