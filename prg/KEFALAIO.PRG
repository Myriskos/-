/*
---------------------------------------------------

  CONVER .ASC TO .PNI STHN EPSILON
              31-10-2020
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
FUNCTION KEFALAIO()
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
   public oMeter , cMeter := 0 ,  oSay , cGetASC := "" , cGetTxT := ""

   PUBLIC cASCString := "ASC   file|*.ASC"
   PUBLIC cPNIString := "PNI   file|*.PNI"
   PUBLIC cGetASC := lCUR + "\ASC\012018.ASC"
   PUBLIC cGetPNI := lCUR + "\PNI\EP012018.pni"
   PUBLIC cDapo := CTOD(SPACE(10)) , cDeos := CTOD(SPACE(10))


   SET DATE FRENCH
   SET EPOCH TO  1990
  SET DATE FORMAT TO "DD/MM/YYYY"
  // SET DATE FORMAT TO "DD/MM/YY"


   nAcolor := RGB(204, 230, 255)
   nBcolor := RGB(230, 230, 230)

   DEFINE FONT oFont   NAME GetSystemFont()   SIZE 0,-12  && NCHARSET 161

  DEFINE DIALOG oDlgG RESOURCE "GEFYRA" ;
   COLOR    nAcolor , nBcolor  TITLE " Φαναρόπουλος  ΑΒ Βασιλόπουλος "

    REDEFINE GET oGetASC VAR cGetASC ID 102 OF oDlgG ;
           FONT oFont
   REDEFINE GET oGetPNI VAR cGetPNI ID 105 OF oDlgG ;
           FONT oFont


   REDEFINE  BTNBMP ID 106 FILENAME lBMP + "\open.bmp"  OF oDlgG ;
    ACTION ( cGetASC :=   cGetFile(    cASCString                ,;
             "Επέλεξε ενα Αρχείο ASC  " ) ,  oGetASC:Refresh() )

    REDEFINE  BTNBMP ID 107 FILENAME lBMP + "\open.bmp"  OF oDlgG ;
    ACTION ( cGetPNI :=   cGetFile(    cPNIString                ,;
             "Επέλεξε ενα Αρχείο PNI  " ) ,  oGetPNI:Refresh() )


    REDEFINE GET oDapo   VAR cDapo   ID 108 OF oDlgG ;
           FONT oFont  valid !empty(cDapo)

   REDEFINE GET oDeos   VAR cDeos   ID 109 OF oDlgG ;
           FONT oFont  valid !empty(cDeos)

   REDEFINE SAY oSay VAR cNotas ID 104 OF oDlgG ;
           color "w/r"  FONT oFont

   REDEFINE METER oMeter VAR cMeter  ID 103 OF oDlgG

   REDEFINE BUTTON ID 100 OF oDlgG ;
      ACTION  ( DISEMP(oDlgG,.t.)   , OPENASCI() , DISEMP(oDlgG,.f.)   )
   REDEFINE BUTTON ID 101 OF oDlgG ;
      ACTION  oDlgG:End()


 ACTIVATE DIALOG oDlgG  CENTERED   ;
  ON INIT (oDlgG:SetColor( nAcolor , nBcolor )  )




return(.t.)


//-----------------------------------------
STATIC FUNCTION OPENASCI()
//----------------------------------------=

 LOCAL cTemp := ""
 LOCAL oFile := TFileRead():New( cGetASC )
 LOCAL cString := SPACE(80)
 PUBLIC  ENDL := CHR(13)+CHR(10)
 PUBLIC  ENDF := CHR(26)
 SET DATE FORMAT TO "DD-MM-YY"
#include "fileio.ch"

lROW := 1

PUBLIC    cHMER     :=  SPACE(3)
PUBLIC    cDATE     :=  SPACE(8)
PUBLIC    cGLMAST   :=  SPACE(13)
PUBLIC    cPARA     :=  SPACE(13)
PUBLIC    cDESC     :=  SPACE(25)
PUBLIC    cKODIKOS  :=  VAL(SPACE(4))
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
PUBLIC    CodePROION := SPACE(15)


TOTREC := 0

 oldPara := newPara := ""

 PUBLIC Handle := FCREATE( cGetPNI )
 LineArthrou := ""

 TOTAXIA := TOTFPA := 0

/*
 Συντελεστής  0 ---> ArrAxia[1] ->  ArrFpa[1]
 Συντελεστής  6 ---> ArrAxia[2] ->  ArrFpa[2]
 Συντελεστής 13 ---> ArrAxia[3] ->  ArrFpa[3]
 Συντελεστής 24 ---> ArrAxia[4] ->  ArrFpa[4]
*/

 DECLARE  ArrAxia[4]
 DECLARE  ArrFpa[4]
 FOR i = 1 TO 4
   ArrAxia[i]  := 0
   ArrFpa[i]   := 0
 NEXT

  // ΠΙΝΑΚΑΣ ΑΓΟΡΩΝ

 DECLARE Arr_Axia[4][2]
         Arr_Axia[1][1] := 0
         Arr_Axia[1][2] := "20-00-00-0000"   // 0%
         Arr_Axia[2][1] := 0
         Arr_Axia[2][2] := "20-00-00-0025"   // 6%
         Arr_Axia[3][1] := 0
         Arr_Axia[3][2] := "20-00-00-0036"   //13%
         Arr_Axia[4][1] := 0
         Arr_Axia[4][2] := "20-00-00-0087"   //24%

 DECLARE Arr_Fpa[4][2]
         Arr_Fpa[1][1] := 0
         Arr_Fpa[1][2] := "54-00-20-0000"    //
         Arr_Fpa[2][1] := 0
         Arr_Fpa[2][2] := "54-00-20-0025"    // 6%
         Arr_Fpa[3][1] := 0
         Arr_Fpa[3][2] := "54-00-20-0036"    // 13%
         Arr_Fpa[4][1] := 0
         Arr_Fpa[4][2] := "54-00-20-0087"    // 24%

  // ΠΙΝΑΚΑΣ ΔΑΠΑΝΩΝ  ΜΕ ΚΩΔΙΚΟ ειδους "TransCharg"

 DECLARE Arr_dAxia[4][2]
         Arr_dAxia[1][1] := 0
         Arr_dAxia[1][2] := "64-00-02-0000"   // 0%
         Arr_dAxia[2][1] := 0
         Arr_dAxia[2][2] := "64-00-02-0025"   // 6%
         Arr_dAxia[3][1] := 0
         Arr_dAxia[3][2] := "64-00-02-0036"   //13%
         Arr_dAxia[4][1] := 0
         Arr_dAxia[4][2] := "64-00-02-0087"   //24%

 DECLARE Arr_dFpa[4][2]
         Arr_dFpa[1][1] := 0
         Arr_dFpa[1][2] := "54-00-29-0000"    //
         Arr_dFpa[2][1] := 0
         Arr_dFpa[2][2] := "54-00-29-0025"    // 6%
         Arr_dFpa[3][1] := 0
         Arr_dFpa[3][2] := "54-00-29-0036"    // 13%
         Arr_dFpa[4][1] := 0
         Arr_dFpa[4][2] := "54-00-29-0087"    // 24%


  // ΠΙΝΑΚΑΣ ΚΕΝΩΝ

 DECLARE Arr_kAxia[1][2]
         Arr_kAxia[1][1] := 0
         Arr_kAxia[1][2] := "50-07-00-0000"   //



oFile:Open()
IF oFile:Error()
    msgStop( oFile:ErrorMsg( "FileRead: " ) )
ELSE
 WHILE oFile:MoreToRead()
      cString := oFile:ReadLine()
      OcDATE   := SUBSTR( cString ,07 ,08 )
      OcDATE   := CTOD(CONVDATE( OcDATE ))
      OcDATE   := DTOC(OcDATE)


      APAR    := SUBSTR( cString ,120 ,03 )
   IF APAR <> "040"  .AND. CTOD(OcDATE) >= cDapo  .AND. CTOD(OcDATE) <= cDeos
      cPARA   := SUBSTR(cString , 120 ,03)
      nPARA   := SUBSTR(cString , 127 ,15)
      newPara := cPARA + nPARA
      //cAITIOL := ( "AB BASILOPOYLOS" )
      cAITIOL :="ΑΒ ΒΑΣΙΛΟΠΟΥΛΟΣ"

      if OldPara <> newPara
         OldPara := newPara
         ARTHRO()
      endif


      cDATE   := SUBSTR( cString ,07 ,08 )
      cDATE   := CTOD(CONVDATE( cDATE ))
      cDATE   := DTOC(cDATE)
      ocPARA  := SUBSTR(cString , 120 ,03)
      onPARA  := SUBSTR(cString , 127 ,15)
      CodePROION := SUBSTR(cString , 25 ,15)



      cFPA    := TRAN( CONVFPA( SUBSTR(cString , 168 , 5) ) , "##" )
      cK_AXIA := NumWithDec(SUBSTR(cString ,  90 ,15))
      cK_AXIA := tran(VAL(cK_AXIA)   ,"#########.##")
      TOTAXIA += val(cK_AXIA)
      cF_AXIA := NumWithDec(SUBSTR(cString , 105 ,15) )
      cF_AXIA := tran( VAL(cF_AXIA) ,"#########.##")
      TOTFPA +=  val(cF_AXIA)
      cT_AXIA := ( ROUND( val(cK_AXIA),2) +  ROUND( val(cF_AXIA),2) )
      cT_AXIA := tran( ROUND( cT_AXIA ,2)  ,"#########.##")
      PROION  := SUBSTR(cString , 40,35)

      //----Αθροιση ανα συν/στη ΦΠΑ
      n:=1
      if val(cFPA) == 0 ; n:= 1 ; endif
      if val(cFPA) == 6 ; n:= 2 ; endif
      if val(cFPA) ==13 ; n:= 3 ; endif
      if val(cFPA) ==24 ; n:= 4 ; endif

      ArrAxia[n] +=  val(cK_AXIA)
      ArrFpa[n]  +=  val(cF_AXIA)

      DO CASE
       CASE TRIM(CodePROION) == "TransCharg"
         Arr_dAxia[n][1] +=  val(cK_AXIA)
         Arr_dFpa[n][1]  +=  val(cF_AXIA)

       CASE TRIM(CodePROION) ==  bKENA(CodePROION)
        //  msginfo( "    brhka keno    " )
         Arr_kAxia[1][1]  += ( val(cK_AXIA) + val(cF_AXIA)   )

       OTHERWISE
        Arr_Axia[n][1] +=  val(cK_AXIA)
        Arr_Fpa[n][1]  +=  val(cF_AXIA)
      END CASE

       //-------------------------------

      LineArthrou := cDATE+"|"+cPARA+"|"+nPARA+"|"+cK_AXIA+"|"+cF_AXIA+"|"+cT_AXIA+"|"+cFPA +"|"+PROION

   //  αναλυτικη γραμμή
   // IF  ( ROUND( val(cK_AXIA),2) +  ROUND( val(cF_AXIA),2) ) <> 0
   //   WRITELINE( LineArthrou )
   // ENDIF


   ENDIF

 ENDDO
 ARTHRO()
    oFile:Close()
ENDIF

  FWRITE( Handle  , ENDL+ ENDF   )
  FCLOSE(cGetPNI)
    MSGINFO( " Η Εργασία Ολοκληρώθηκε επιτυχώς " ,"dbSoft"  )
    SET DATE FORMAT TO "DD/MM/YYYY"
 RETURN
//--------------------------------------
FUNCTION NumWithDec( cNUM )
//--------------------------------------
  L := SUBSTR( cNUM ,1 , 13 )
  R := SUBSTR( cNUM ,14,  2 )
  NewNum := l+"."+r
RETURN (NewNum )

//------------------------------
STATIC FUNCTION CONVFPA( cF )
//------------------------------
LOCAL NS := "" , cC := ""

   SIZE   := LEN( cF )
   FOR i := 1 TO SIZE
      NS := SUBSTR( cF , i , 1 )
      IF ( NS == "C" .OR. NS == "0" )  ; NS := ""  ; ENDIF
      cC += NS
   NEXT
 //PADL( cC ,05,"0")
 IF cC == ""  ; cC := "00" ; ENDIF
 IF cC == "6" ; cC := "06" ; ENDIF

RETURN(  cC  )



//--------------------------------------
FUNCTION WRITELINE( cTEMP )
//--------------------------------------
  FWRITE( Handle  , cTEMP  + ENDL )

RETURN

//--------------------------------------
FUNCTION CONVDATE( INDATE )
//--------------------------------------
LOCAL EXDATE := "" , MERA := "" , MHNAS := "" , ETOS := ""

    ETOS := SUBSTR( INDATE ,1 ,4 )
    MHNAS:= SUBSTR( INDATE ,5 ,2 )
    MERA := SUBSTR( INDATE ,7 ,2 )
    EXdATE := MERA +"/"+MHNAS+"/"+ETOS

RETURN EXdATE



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
      cC++
   NEXT



RETURN( LEFT( cAITIO,25 ) )


//--------------------------------
STATIC FUNCTION ARTHRO()
//--------------------------------

IF ROUND( (TOTAXIA+ TOTFPA) ,2) <> 0
            WRITELINE( " " )
           /*
            //-----------------------------------
            WRITELINE( "------------------------------------------------------" )
            WRITELINE(SPACE(29)+ tran( ROUND( TOTAXIA ,2) ,"#,###,###.##") +" " + tran( ROUND( TOTFPA ,2)  ,"#,###,###.##") +" "+ tran( ROUND( (TOTAXIA+ TOTFPA) ,2)  ,"#,###,###.##")  )

           //-----------------------------------
           */
            cKODIKOS++
            LineArtrou :=space(3)
            FOR i = 1 TO 4
              IF Arr_Axia[i][1] <> 0
                LineArtrou :=space(3)
                LineArtrou += cDATE
                LineArtrou += Arr_Axia[i][2]
                LineArtrou += ocPARA +" "+ SUBSTR(onPARA , 07,09)
                LineArtrou += cAITIOL + SPACE(10)
                LineArtrou += PADL( cKODIKOS  ,04,"0")  +SPACE(21)
                LineArtrou += "10" +SPACE(7)
                LineArtrou += "1"
                LineArtrou += tran( ROUND( Arr_Axia[i][1] ,2) ,"#######.##")
                LineArtrou += tran( ROUND(  0             ,2) ,"#######.##")
                WRITELINE(  ANSITOOEM( LineArtrou ) )
              ENDIF
              IF Arr_Fpa[i][1] <> 0
                LineArtrou :=space(3)
                LineArtrou += cDATE
                LineArtrou += Arr_Fpa[i][2]
                LineArtrou += ocPARA +" "+ SUBSTR(onPARA , 07,09)
                LineArtrou += cAITIOL + SPACE(10)
                LineArtrou += PADL( cKODIKOS  ,04,"0")  +SPACE(21)
                LineArtrou += "10" +SPACE(7)
                LineArtrou += "1"
                LineArtrou += tran( ROUND( Arr_Fpa[i][1] ,2) ,"#######.##")
                LineArtrou += tran( ROUND(  0            ,2) ,"#######.##")
                WRITELINE(  ANSITOOEM( LineArtrou ) )
              ENDIF

              //-ΜΕΤΑΦΟΡΙΚΑ ΜΕ ΚΩΔΙΚΟ ΕΙΔΟΥΣ TransCharg
              IF Arr_dAxia[i][1] <> 0
                LineArtrou :=space(3)
                LineArtrou += cDATE
                LineArtrou += Arr_dAxia[i][2]
                LineArtrou += ocPARA +" "+ SUBSTR(onPARA , 07,09)
                LineArtrou += cAITIOL + SPACE(10)
                LineArtrou += PADL( cKODIKOS  ,04,"0")  +SPACE(21)
                LineArtrou += "10" +SPACE(7)
                LineArtrou += "1"
                LineArtrou += tran( ROUND( Arr_dAxia[i][1] ,2) ,"#######.##")
                LineArtrou += tran( ROUND(  0              ,2) ,"#######.##")
                WRITELINE(  ANSITOOEM( LineArtrou ) )
              ENDIF
              IF Arr_dFpa[i][1] <> 0
                LineArtrou :=space(3)
                LineArtrou += cDATE
                LineArtrou += Arr_dFpa[i][2]
                LineArtrou += ocPARA +" "+ SUBSTR(onPARA , 07,09)
                LineArtrou += cAITIOL + SPACE(10)
                LineArtrou += PADL( cKODIKOS  ,04,"0")  +SPACE(21)
                LineArtrou += "10" +SPACE(7)
                LineArtrou += "1"
                LineArtrou += tran( ROUND( Arr_dFpa[i][1] ,2) ,"#######.##")
                LineArtrou += tran( ROUND(  0             ,2) ,"#######.##")
                WRITELINE(  ANSITOOEM( LineArtrou ) )
              ENDIF
            NEXT

             //-Αξια Κενών
              IF Arr_kAxia[1][1] <> 0
                LineArtrou :=space(3)
                LineArtrou += cDATE
                LineArtrou += Arr_kAxia[1][2]
                LineArtrou += ocPARA +" "+ SUBSTR(onPARA , 07,09)
                LineArtrou += cAITIOL + SPACE(10)
                LineArtrou += PADL( cKODIKOS  ,04,"0")  +SPACE(21)
                LineArtrou += "10" +SPACE(7)
                LineArtrou += "1"
                LineArtrou += tran( ROUND( Arr_kAxia[1][1] ,2) ,"#######.##")
                LineArtrou += tran( ROUND(  0              ,2) ,"#######.##")
                WRITELINE(  ANSITOOEM( LineArtrou ) )
              ENDIF


                // ΠΡΟΜΗΘΕΥΤΗΣ
                LineArtrou :=space(3)
                LineArtrou += cDATE
                LineArtrou += "50-00-00-0000"
                LineArtrou += ocPARA +" "+ SUBSTR(onPARA , 07,09)
                LineArtrou += cAITIOL + SPACE(10)
                LineArtrou += PADL( cKODIKOS  ,04,"0")  +SPACE(21)
                LineArtrou += "10" +SPACE(7)
                LineArtrou += "2"   // + SPACE(10)
                LineArtrou += tran( ROUND(  0                ,2)  ,"#######.##")
                LineArtrou += tran( ROUND( (TOTAXIA+ TOTFPA) ,2)  ,"#######.##")
                WRITELINE(  ANSITOOEM( LineArtrou ) )

           //  WRITELINE( "------------------------------------------------------" )
         ENDIF

         // Μηδενισμός Αθριστών
          TOTAXIA := TOTFPA := 0
          FOR i = 1 TO 4
           ArrAxia[i]  := 0
           ArrFpa[i]   := 0

           Arr_Axia[i][1] := 0
           Arr_Fpa[i][1]  := 0

           Arr_dAxia[i][1] := 0
           Arr_dFpa[i][1]  := 0
          NEXT

          Arr_kAxia[1][1]  := 0

RETURN
//-------------------------
STATIC FUNCTION bKENA(cEIDken)
//-------------------------

/*
94 860 060 000  Κιβ Ανευ φιαλών 500 ml  Μαλαματίνας
94 860 080 000  Κενη φιάλη  500 ml   Μαλαματίνας
94 860 430 100  Κενη φιάλη  ΣΟΥΡΩΤΗΣ 250 ml
94 860 430 400  Κιβ κενο σκετο Σουρωτη
40 714 771 500  ΤΕΛΑΡΟ IFCO ΚΟΚΚΙΝΟ ΜΙΚΡΟ ML4314

40725022100      ΝΕΑ ΠΑΛΕΤΑ CHEP
*/

 LOCAL strEIDOS := ""
 cEIDken := trim(cEIDken)
 ArrayKena := {          ;
          "94852153300" ,;
          "94850010100" ,;
          "94852100100" ,;
          "40000464000" ,;
          "40000493600" ,;
          "40000465000" ,;
          "40000429200" ,;
          "40000700700" ,;
          "40000980400" ,;
          "94852114400" ,;
          "40712807300" ,;
          "94852154320" ,;
          "40712811000" ,;
          "94852156418" ,;
          "40713455200" ,;
          "94852153400" ,;
          "94852153600" ,;
          "94852130400" ,;
          "94852139900" ,;
          "94860060000" ,;
          "94860080000" ,;
          "94860430100" ,;
          "94860430400" ,;
          "40714771500" ,;
          "40725022100" ,;
          "40747725500" ,;
          "94852111500"    }



 for i := 1 to LEN(ArrayKena)
   // msginfo( "[" + ArrayKena[i] +"]" , "-["+cEIDken+"]-"    )
   if ArrayKena[i] == cEIDken
     strEIDOS := ArrayKena[i]
     RETURN( strEiDOS )
   endif
 next

RETURN( strEiDOS )

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

//-------------  OLD CODE -------------------------
FUNCTION Test2()
//-------------------------------------------------

Local   oExcel, oSheet, oWin , nRow , nCol
Local   cMyFile := trim(cGetASC)

Local   Prn_file  :=   cGetPNI    && lCUR + "\GEFYRA.TXT"
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
