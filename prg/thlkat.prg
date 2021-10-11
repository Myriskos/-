/*

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
FUNCTION thlkat()
//-------------------------------------------------
    LOCAL oDlgm , oDlgG ,  oIDEPA , oLbx , bOb1 ,bOb2 , oBtn2 , lAppend
   SET DATE FRENCH
   SET EPOCH TO  1990
   SET DATE FORMAT TO "DD/MM/YYYY"

   nAcolor := RGB(205, 205, 193)
   nBcolor := RGB(228, 230, 231)


    DEFINE FONT oFont   NAME GetSystemFont()   SIZE 0,-12  && NCHARSET 161



    DEFINE DIALOG oDlgG RESOURCE "pelates" ;
    COLOR    nAcolor , nBcolor  TITLE " thlKat "







    ACTIVATE DIALOG oDlgG  CENTERED   ;
    ON INIT (oDlgG:SetColor( nAcolor , nBcolor )  )

  /*
  */
return(.t.)

//-------------------------------------------------
FUNCTION KATALOGOS()
//-------------------------------------------------
    LOCAL oDlgm , oDlgG , oMenu , oIDEPA , oLbx , bOb1 ,bOb2 , oBtn2 , lAppend
   SET DATE FRENCH
   SET EPOCH TO  1990
   SET DATE FORMAT TO "DD/MM/YYYY"

   nAcolor := RGB(205, 205, 193)
   nBcolor := RGB(228, 230, 231)


    DEFINE FONT oFont   NAME GetSystemFont()   SIZE 0,-12  && NCHARSET 161


    DEFINE DIALOG oDlgG RESOURCE "KATALOGOS" ;
    COLOR    nAcolor , nBcolor  TITLE " thlKat "




    ACTIVATE DIALOG oDlgG  CENTERED   ;
    ON INIT (oDlgG:SetColor( nAcolor , nBcolor )  )

  /*
  */
return(.t.)

