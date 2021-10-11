#include "FiveWin.ch"

#define FW_NORMAL          400
#define FW_BOLD            700

#define OEM_FIXED_FONT      10
#define ANSI_FIXED_FONT     11
#define ANSI_VAR_FONT       12
#define SYSTEM_FONT         13
#define DEVICE_DEFAULT_FONT 14
#define SYSTEM_FIXED_FONT   16

#define MM_ANISOTROPIC       8

#define LOGPIXELSY          90

#ifdef __XPP__
   #define New _New   // Because XBase++ New() can't return something different
#endif                // from Self

static aFonts := {}

//----------------------------------------------------------------------------//

CLASS TFont

   DATA   cFaceName
   DATA   hFont, hFontOld
   DATA   lBold, lItalic, lUnderline, lStrikeOut
   DATA   nInpHeight, nInpWidth, nEscapement, nOrientation, nWeight
   DATA   nCharSet, nOutPrecision, nClipPrecision, nQuality, nPitchFamily
   DATA   nCount, lDestroy
   DATA   lNew

   // CLASSDATA aFonts

   METHOD New( cFaceName, nWidth, nHeight, lFromUser,;
               lBold, nEscapement, nOrientation, nWeight, lItalic,;
               lUnderline, lStrikeOut, nCharSet, nOutPrecision,;
               nClipPrecision, nQuality, oDevice, nPitchFamily )
               // We don't use CONSTRUCTOR clause here as we are going to
               // change Self

   METHOD Choose( nRGBColor )     // passed by reference

   METHOD End()

   METHOD Release() INLINE ::End()

   METHOD Activate( hDC ) INLINE ::hFontOld := SelectObject( hDC, ::hFont )

   METHOD DeActivate( hDC ) INLINE  SelectObject( hDC, ::hFontOld )

   METHOD nSize()

   METHOD nWidth( nNewValue ) SETGET
   METHOD nHeight( nNewValue ) SETGET

ENDCLASS

//----------------------------------------------------------------------------//

METHOD New( cFaceName, nWidth, nHeight, lFromUser, lBold,;
            nEscapement, nOrientation, nWeight, lItalic, lUnderline,;
            lStrikeOut, nCharSet, nOutPrecision, nClipPrecision,;
            nQuality, oDevice, nPitchFamily ) CLASS TFont

   local aFont, nRGBColor
   local nAt, aSystem := { "OEM_FIXED_FONT", "ANSI_FIXED_FONT",;
                           "ANSI_VAR_FONT", "SYSTEM_FONT",;
                           "DEVICE_DEFAULT_FONT", "SYSTEM_FIXED_FONT" }
   local aInfo, aSysFonts := { OEM_FIXED_FONT, ANSI_FIXED_FONT,;
                               ANSI_VAR_FONT, SYSTEM_FONT,;
                               DEVICE_DEFAULT_FONT, SYSTEM_FIXED_FONT }

   #ifdef __XPP__
      #undef New
   #endif

   DEFAULT cFaceName := "SYSTEM_FONT", nEscapement := 0, nOrientation := 0, nWeight := 0,;
           nHeight := 14, lItalic := .f., lFromUser := .f., lUnderLine := .f.,;
           lStrikeOut := .f., nCharSet :=161, nOutPrecision := 0,;
           nClipPrecision := 0, nQuality := 0, lBold := .f., nWidth := 0,;
           nPitchFamily := 0, ::nCount := 0, ::lDestroy := .t., aFonts := {}

   // bug on Windows 2000
   if Upper( cFaceName ) == "SYSTAHOMA" .and. nHeight < 0 .and. Abs( nHeight ) < 12
      nHeight = -12
   endif

   if Upper( cFaceName ) == "SYSTAHOMA"
      cFaceName = "TAHOMA"
   endif

   if lFromUser
      aFont     = ChooseFont( , @nRGBColor )
      lFromUser = ! Empty( aFont[ LF_FACENAME ] )
   elseif nWidth = 0 .and. nHeight < 0
   endif

   if lBold
      nWeight = nOr( nWeight, FW_BOLD )
   endif

   ::cFaceName      = If( lFromUser, aFont[ LF_FACENAME ], cFaceName )
   ::nInpHeight     = If( lFromUser, aFont[ LF_HEIGHT ], nHeight )
   ::nInpWidth      = If( lFromUser, aFont[ LF_WIDTH ], nWidth )
   ::nEscapement    = If( lFromUser, aFont[ LF_ESCAPEMENT ], nEscapement )
   ::nOrientation   = If( lFromUser, aFont[ LF_ORIENTATION ], nOrientation )
   ::nWeight        = If( lFromUser, aFont[ LF_WEIGHT ], nWeight )
   ::lBold          = If( lFromUser, ! ( ::nWeight == FW_NORMAL ), lBold )
   ::lItalic        = If( lFromUser, aFont[ LF_ITALIC ], lItalic )
   ::lUnderLine     = If( lFromUser, aFont[ LF_UNDERLINE ], lUnderLine )
   ::lStrikeOut     = If( lFromUser, aFont[ LF_STRIKEOUT ], lStrikeOut )
   ::nCharSet       = If( lFromUser, aFont[ LF_CHARSET ], nCharSet )
   ::nOutPrecision  = If( lFromUser, aFont[ LF_OUTPRECISION ], nOutPrecision )
   ::nClipPrecision = If( lFromUser, aFont[ LF_CLIPPRECISION ], nClipPrecision )
   ::nQuality       = If( lFromUser, aFont[ LF_QUALITY ], nQuality )
   ::nPitchFamily   = If( lFromUser, aFont[ LF_PITCHANDFAMILY ], nPitchFamily )
   ::hFontOld       = 0

   if oDevice != nil
      ::nInpHeight = ( oDevice:nLogPixelY() / 72 ) * ::nInpHeight
   endif

   if( nAt := AScan( aFonts, { | oFont | oFont:nInpHeight  == ::nInpHeight .and. ;
                                          oFont:nInpWidth    == ::nInpWidth  .and. ;
                                          oFont:nEscapement  == ::nEscapement .and. ;
                                          oFont:nOrientation == ::nOrientation .and. ;
                                          oFont:nWeight      == ::nWeight      .and. ;
                                          oFont:lItalic      == ::lItalic      .and. ;
                                          oFont:lUnderLine   == ::lUnderLine .and. ;
                                          oFont:lBold        == ::lBold .and. ;
                                          oFont:lStrikeOut   == ::lStrikeOut .and. ;
                                          oFont:nCharSet     == ::nCharSet   .and. ;
                                          oFont:nOutPrecision  == ::nOutPrecision .and. ;
                                          oFont:nClipPrecision == ::nClipPrecision .and. ;
                                          oFont:nQuality       == ::nQuality  .and. ;
                                          oFont:nPitchFamily   == ::nPitchFamily .and. ;
                                          oFont:cFaceName      == ::cFaceName } )) > 0

         #ifndef __XPP__
            Self := aFonts[ nAt ]  // This is not permited with XBase++
            ::nCount++
            ::lNew = .f.
            return Self
         #else
            aFonts[ nAt ]:nCount++
            aFonts[ nAt ]:lNew = .f.
            return aFonts[ nAt ]
         #endif

   elseif ( nAt := AScan( aSystem, { | cType | cType == Upper( ::cFaceName ) } ) ) != 0

      ::hFont = GetStockObject( aSysFonts[ nAt ] )
      aInfo = GetFontInfo( ::hFont )
      ::nInpHeight  = aInfo[ 1 ]
      ::nInpWidth   = aInfo[ 2 ]
      ::lBold       = aInfo[ 3 ]
      ::lDestroy    = .f.
      ::nCount++
      ::lNew = .t.

   else
      ::hFont = CreateFont( { ::nInpHeight, ::nInpWidth, ::nEscapement,;
                              ::nOrientation, ::nWeight, ::lItalic,;
                              ::lUnderLine, ::lStrikeOut, ::nCharSet,;
                              ::nOutPrecision, ::nClipPrecision,;
                              ::nQuality, ::nPitchFamily, ::cFaceName } )
      ::lDestroy = .t.
      ::nCount++
      ::lNew = .t.
      AAdd( aFonts, Self )
   endif

return Self

//----------------------------------------------------------------------------//

METHOD Choose( nRGBColor ) CLASS TFont

   local aFont, oFont

   if nRGBColor != nil
      aFont := ChooseFont( { ::nInpHeight, ::nInpWidth, ::nEscapement,;
                             ::nOrientation, ::nWeight, ::lItalic,;
                             ::lUnderLine, ::lStrikeOut, ::nCharSet,;
                             ::nOutPrecision, ::nClipPrecision,;
                             ::nQuality, ::nPitchFamily, ::cFaceName },;
                             @nRGBColor )
   else
      aFont := ChooseFont( { ::nInpHeight, ::nInpWidth, ::nEscapement,;
                             ::nOrientation, ::nWeight, ::lItalic,;
                             ::lUnderLine, ::lStrikeOut, ::nCharSet,;
                             ::nOutPrecision, ::nClipPrecision,;
                             ::nQuality, ::nPitchFamily, ::cFaceName } )
   endif

   if ! Empty( aFont[ LF_FACENAME ] ) // the user pressed Esc
      ::End()
      oFont = TFont():New( aFont[ LF_FACENAME ],, aFont[ LF_HEIGHT ], .f.,;
                           ! ( aFont[ LF_WEIGHT ] == FW_NORMAL ),;
                           aFont[ LF_ESCAPEMENT ], aFont[ LF_ORIENTATION ],;
                           aFont[ LF_WEIGHT ], aFont[ LF_ITALIC ],;
                           aFont[ LF_UNDERLINE ], aFont[ LF_STRIKEOUT ],;
                           aFont[ LF_CHARSET ], aFont[ LF_OUTPRECISION ],;
                           aFont[ LF_CLIPPRECISION ], aFont[ LF_QUALITY ],,;
                           aFont[ LF_PITCHANDFAMILY ] )
   endif

return If( oFont != nil, oFont, Self )

//----------------------------------------------------------------------------//

METHOD End() CLASS TFont

   local nAt

   if ::nCount != nil .and. --::nCount < 1
      if ! Empty( ::hFont ) .and. ::lDestroy

         if DeleteObject( ::hFont )
            nAt := AScan( aFonts, { | oFont | oFont:hFont == ::hFont } )
            if nAt > 0
               ADel( aFonts, nAt )
               ASize( aFonts, Len( aFonts ) - 1 )
            endif
            ::hFont  = 0
            ::nCount = 0
         else
            LogFile( "resources.txt",;
                     { "DeleteObject( ::hFont ) failed from TFont:End()", ::hFont,;
                       ::nCount, ::lDestroy } )
         endif
      endif
   endif

return nil

//----------------------------------------------------------------------------//

METHOD nSize() CLASS TFont

   local hDC   := GetDC( 0 )
   local nSize := ( -::nInpHeight * 72 ) / GetDeviceCaps( hDC, LOGPIXELSY )

   ReleaseDC( 0, hDC )

return If( nSize - Int( nSize ) == 0.25, nSize - 0.25,;
       If( nSize <> Int( nSize ), nSize + 0.25, nSize ) )

//----------------------------------------------------------------------------//

METHOD nHeight( nNewHeight ) CLASS TFont

   DEFAULT ::nInpHeight := 0

   if PCount() > 0
      ::nInpHeight := nNewHeight
   else
      return Abs( ::nInpHeight )
   endif

return nil

//----------------------------------------------------------------------------//

METHOD nWidth( nNewWidth ) CLASS TFont

   if PCount() > 0
      ::nInpWidth := nNewWidth
   else
      if ::nInpWidth != nil .and. ::nInpWidth == 0
         return ::nHeight  * 0.44
      else
         return ::nInpWidth
      endif
   endif

return nil

//----------------------------------------------------------------------------//

/*
exit procedure CheckFonts()

   local n

   for n = 1 to Len( aFonts )
      if aFonts[ n ]:nCount >= 0
         MsgInfo( aFonts[ n ]:nCount, aFonts[ n ]:cFaceName )
      endif
   next

return */