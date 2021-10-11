*-- PROGRAM FILE -------------------------------------------------------
*  Application: Addon for FiveWin
*  Description: TBtnGet - Colored TGet class with button
*    File Name: tbtnget.prg
*       Author: Ricardo Ramirez       Tester: Ricardo Ramirez
* Date created: 1998-01-01            Date updated: þ2001-03-26
* Time created: 8:17:12PM             Time updated: þ16:028:17M
*    Copyright: (c) 1998-2000 by Punto-Co
*
 * $Id: btnget.prg,v 1.1 2001/09/05 17:34:45 RRamirez Exp $
*
* Compliments of:
*  George Georguiev
*-----------------------------------------------------------------------

#include "FiveWin.ch"

#define GWL_STYLE         -16
#define GWL_EXSTYLE       -20
#define DS_3DLOOK           4
#define SM_CYVSCROLL       20

CLASS TBtnGet FROM TGet

   CLASSDATA lFocusClr AS LOGICAL INIT .t.

   DATA   bAction, cResName, oBtn, lBtnORBmp
   DATA   nClrPFoText, nClrPFoPane, nClrDef
   DATA   nBmpWidth, bTmpValid
   DATA   nClrFocusText, nClrFocusPane // added. There were erased from FW 2.2c

   METHOD ClassName() INLINE "TGET"

   METHOD New( nRow, nCol, bSetGet, oWnd, nWidth, nHeight, cPict, ;
               bValid, nClrFore, nClrBack, oFont, lDesign, oCursor, ;
               lPixel, cMsg, lUpdate, bWhen, lCenter, lRight, bChanged,;
               lReadOnly, lPassword, lNoBorder, nHelpId, cResName, ;
               bAction, lSpinner, bUp, bDown, bMin, bMax, nBmpWidth ) ;
               CONSTRUCTOR

   METHOD ReDefine( nId, bSetGet, oWnd, nHelpId, cPict, bValid, ;
               nClrFore, nClrBack, oFont, oCursor, cMsg, lUpdate, ;
               bWhen, bChanged, lReadOnly, lSpinner, bUp, bDown, bMin, ;
               bMax, cResName, bAction ) CONSTRUCTOR

   METHOD Default()
   METHOD Initiate( hDlg ) INLINE Super:Initiate( hDlg ), ::Default()
   METHOD SetIniClr()
   METHOD Move()
   METHOD CalcDims( nTop, nLeft, nWidth, nHeight )
   METHOD RemoveClr()

END CLASS

METHOD New( nRow, nCol, bSetGet, oWnd, nWidth, nHeight, cPict, bValid,;
            nClrFore, nClrBack, oFont, lDesign, oCursor, lPixel, cMsg,;
            lUpdate, bWhen, lCenter, lRight, bChanged, lReadOnly,;
            lPassword, lNoBorder, nHelpId, cResName, bAction, lSpinner,;
            bUp, bDown, bMin, bMax, nBmpWidth ) CLASS TBtnGet

   Super:New( nRow, nCol, bSetGet, oWnd, nWidth, nHeight, cPict, ;
            bValid, nClrFore, nClrBack, oFont, lDesign, oCursor, ;
            lPixel, cMsg, lUpdate, bWhen, lCenter, lRight, bChanged, ;
            lReadOnly, lPassword, lNoBorder, nHelpId, lSpinner,;
            bUp, bDown, bMin, bMax )

   DEFAULT nBmpWidth := 17, ::lFocusClr := .t.

   ::nStyle := nOr( ::nStyle, ES_MULTILINE )

   ::bAction   := bAction
   ::cResName  := cResName
   ::lBtnORBmp := .F.
   ::nBmpWidth := nBmpWidth

   if ::lFocusClr
      ::SetIniClr()
   endif

Return Self

METHOD ReDefine( nId, bSetGet, oWnd, nHelpId, cPict, bValid, nClrFore,;
                 nClrBack, oFont, oCursor, cMsg, lUpdate, bWhen, ;
                 bChanged, lReadOnly, lSpinner, bUp, bDown, bMin, ;
                 bMax, cResName, bAction, nBmpWidth ) CLASS TBtnGet

   Super:ReDefine( nId, bSetGet, oWnd, nHelpId, cPict, bValid, ;
                 nClrFore, nClrBack, oFont, oCursor, cMsg, lUpdate, ;
                 bWhen, bChanged, lReadOnly, lSpinner, bUp, bDown, ;
                 bMin, bMax )

   DEFAULT nBmpWidth := 22, ::lFocusClr := .t.

   ::nStyle    := nOr(::nStyle, ES_MULTILINE )
   ::bAction   := bAction
   ::cResName  := cResName
   ::lBtnORBmp := .F.
   ::nBmpWidth := nBmpWidth

   if ::lFocusClr
      ::SetIniClr()
   endif

   SetWindowLong( ::hWnd, GWL_STYLE, nOr( GetWindowLong( ::hWnd, GWL_STYLE ) , ES_MULTILINE ) )

Return Self

METHOD Default() CLASS TBtnGet
   local nRectLen, l3Dlook
   Local nTop, nLeft, nWidth, nHeight

   IF empty( ::bAction )
      Return Nil
   ENDIF

   //MSGINFO( GetWindowLong( ::oWnd:hWnd, GWL_STYLE ))

   IF !lAnd( GetWindowLong( ::hWnd, GWL_STYLE ), ES_MULTILINE )
      //MsgStop("Sorry, but you need to define the ID " + ltrim( str( ::nId ) ) + " as MULTILINE ")
   endif

   if lAnd( GetWindowLong( ::hWnd, GWL_STYLE ) , ES_MULTILINE )
      //MsgInfo("Si soy")
   else
      //MsgInfo("no soy")
   Endif

   //SetWindowLong( ::hWnd, GWL_EXSTYLE, nOr( GetWindowLong( ::hWnd, GWL_EXSTYLE ) , ES_MULTILINE ) )

   nRectLen := ::CalcDims( @nTop, @nLeft, @nWidth, @nHeight )

   ::oBtn := TBtnDown():New( nTop, nLeft, nWidth, nHeight, ;
                 ::cResName,, ::cResName,, {|| Self:SetFocus(), ;
                 eval( ::bAction ), ::bValid := ::bTmpValid }, Self,"",, .F., .F.,"", ,, , .f. )

   ::bKeyDown        := { | nKey | IIF( nKey == VK_F4   , ;
                            eval( ::bAction ), "" ) }


   ::oBtn:bGotFocus  := {|| ::bTmpValid := ::bValid, ::bValid := nil, ;
                            ::oWnd:nLastKey := 0 }
   //::oBtn:bLostFocus := {|| ::bValid := ::bTmpValid }

   GetBtn( ::hWnd, nRectLen )

Return Nil

METHOD SetIniClr() CLASS TBtnGet

   ::nClrFocusText := nRGB(0,0,0)
   ::nClrFocusPane := nRGB(243,250,200)
   ::nClrPFoText   := ::nClrText
   ::nClrPFoPane   := ::nClrPane
   //
   ::bGotFocus  := {|| ::SetColor( ::nClrFocusText, ::nClrFocusPane) }
   ::bLostFocus := {|| ::SetColor( ::nClrPFoText  , ::nClrPFoPane  ) }

Return Self

METHOD RemoveClr() CLASS TBtnGet
   ::SetColor( ::nClrText, ::nClrPane )

   ::bGotFocus  := nil
   ::bLostFocus := nil

Return Nil

METHOD Move( nTop, nLeft, nWidth, nHeight, lRepaint ) CLASS TBtnGet
   Local nRectLen

   Super:Move( nTop, nLeft, nWidth, nHeight, lRepaint )

   IF ::oBtn != Nil

      nRectLen := ::CalcDims( @nTop, @nLeft, @nWidth, @nHeight )
      ::oBtn:Move( nTop, nLeft, nWidth, nHeight )

   ENDIF

Return Nil

METHOD CalcDims( nTop, nLeft, nWidth, nHeight ) CLASS TBtnGet
   Local nRectLen

   nRectLen := ::nBmpWidth + 4

   IF lAnd( GetWindowLong( ::oWnd:hWnd, GWL_STYLE ), DS_3DLOOK )
      IF empty( ::cResName )
         nLeft   := ::nWidth() - 16
         nWidth  := 12
      else
         nLeft   := ::nWidth() - 26
         nWidth  := 22
      endif
      nTop    := 0
      nHeight := ::nHeight() - 4
   else
      IF empty( ::cResName )
         nLeft   := ::nWidth() - 15
         nWidth  := 14
      Else
         nLeft   := ::nWidth() - 25
         nWidth  := 24
      ENDIF
      nTop    := 1
      nHeight := ::nHeight() - 2
   ENDIF

   IF empty( ::cResName )
      nRectLen -= 9
   endif

   if ::oVScroll != Nil
      nLeft  -= GetSysMetrics( SM_CYVSCROLL )
      nLeft++
   endif

Return nRectLen
