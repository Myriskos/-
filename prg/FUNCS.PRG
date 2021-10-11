
#define _VIDEO_CH
#define _DDE_CH

#include "winapi.ch"
#include "TSBrowse.ch"
#include "FiveWin.ch"

#define NTRIM(n)  ( LTrim(Str(n)) )

#define CLR_PINK   nRGB( 255, 128, 128)
#define CLR_NBLUE  nRGB( 128, 128, 192)
#define CLR_NBROWN  nRGB( 130, 99, 53)
#define CLR_1 nRGB( 190, 215, 190 )
#define CLR_2 nRGB( 230, 230, 230 )
#define CLR_3 nRGB( 217, 217, 255 )

#define CLR_GOLDENROD     nRGB(218, 165,  32)
#define CLR_LemonChiffon3 nRGB(205, 201, 165)
#define CLR_Ivory3        nRGB(205, 205, 193)



* ============================================================================
* Syntax:   PADL(exp,expN,<expC>)
* Argument: exp    = character, numeric or date value to pad
*           expN   = lenght of character string to return
*           <expC> = character to pad, if not specified spaces are used
* Return:   String
* Usage:    pad a character string on the left with a fill character
* Example:  ? "["+PADL("per",10)+"]"
*           gives   [       per]
*           ? PADL("per",10,"0")
*           gives    0000000per
* ============================================================================
  FUNC PADL
  PARA lexp, lno, lpad
  RETU RIGHT(REPL(IF(PCOUNT()=3,lpad," "),lno)+ALLTRIM(TRANS(lexp,"")),lno)


  FUNC PADR
  PARA lexp, lno, lpad
  RETURN LEFT(  ALLTRIM(TRANS(lexp,""))  +  REPL(IF(PCOUNT()=3,lpad," ") ,lno) ,lno)


  FUNC RPAD
  PARA lexp, lno, lpad
  RETURN LEFT(  ALLTRIM(TRANS(lexp,""))  +  REPL(IF(PCOUNT()=3,lpad," ") ,lno) ,lno)


