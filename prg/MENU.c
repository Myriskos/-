/*
 * xHarbour build 1.1.0 Intl. (SimpLex)
 * Generated C source code from <MENU.PRG>
 * Command: C:\Xharbour\bin\harbour.exe C:\GEFYRES\PRG\MENU.PRG /n /es2 /gc1 /oC:\GEFYRES\PRG\MENU /iC:\FWH\INCLUDE /iC:\xHarbour\include /iC:\FWH\include;C:\GEFYRES\PRG /iC:\Xharbour\include 
 * Created: 2021.08.02 15:34:24 (Borland C++ 5.5.1)
 */

#include "hbvmpub.h"
#include "hbpcode.h"
#include "hbinit.h"

#define __PRG_SOURCE__ "MENU.PRG"

HB_FUNC( MAIN );
HB_FUNC( BUILDMENU );
HB_FUNC( BMPPEL );
HB_FUNC( APPSYS );
HB_FUNC( GETSYSTEMFONT );
HB_FUNC( OPENXLS );
HB_FUNC_INITSTATICS();
HB_FUNC_REGISTERGLOBAL();
HB_FUNC_EXTERN( __MVPUBLIC );
HB_FUNC_EXTERN( SET );
HB_FUNC_EXTERN( __SETCENTURY );
HB_FUNC_EXTERN( SETHANDLECOUNT );
HB_FUNC_EXTERN( SETBALLOON );
HB_FUNC_EXTERN( TFONT );
HB_FUNC_EXTERN( TICON );
HB_FUNC_EXTERN( TBITMAP );
HB_FUNC_EXTERN( TMDIFRAME );
HB_FUNC_EXTERN( NRGB );
HB_FUNC_EXTERN( TBAR );
HB_FUNC_EXTERN( MENUBEGIN );
HB_FUNC_EXTERN( MENUADDITEM );
HB_FUNC_EXTERN( GEFYRA );
HB_FUNC_EXTERN( KEFALAIO );
HB_FUNC_EXTERN( LAMPROY );
HB_FUNC_EXTERN( MENUEND );
HB_FUNC_EXTERN( TBTNBMP );
HB_FUNC_EXTERN( TMSGBAR );
HB_FUNC_EXTERN( DRAWBITMAP );
HB_FUNC_EXTERN( MSGYESNO );
HB_FUNC_EXTERN( EMPTY );
HB_FUNC_EXTERN( PADL );
HB_FUNC_EXTERN( FILE );
HB_FUNC_EXTERN( __COPYFILE );
HB_FUNC_EXTERN( WINEXEC );
HB_FUNC_EXTERN( GETPROCADDRESS );
HB_FUNC_EXTERN( TACTIVEX );
HB_FUNC_EXTERN( ERRORSYS );

#undef HB_PRG_PCODE_VER
#define HB_PRG_PCODE_VER 9

#include "hbapi.h"

HB_ITEM_NEW( CCODE );
HB_ITEM_NEW( LCUR );
HB_ITEM_NEW( LDLL );
HB_ITEM_NEW( LBMP );
HB_ITEM_NEW( LICO );
HB_ITEM_NEW( XPICO );
HB_ITEM_NEW( WORKPATH );

static const PHB_ITEM pConstantGlobals[] = {
                                             &CCODE,
                                             &LCUR,
                                             &LDLL,
                                             &LBMP,
                                             &LICO,
                                             &XPICO,
                                             &WORKPATH 
                                           };
static PHB_ITEM *pGlobals = (PHB_ITEM *) pConstantGlobals;
#undef HB_MODULE_GLOBALS
#define HB_MODULE_GLOBALS pGlobals


HB_INIT_SYMBOLS_BEGIN( hb_vm_SymbolInit_MENU )
{ "MAIN", {HB_FS_PUBLIC | HB_FS_LOCAL | HB_FS_FIRST}, {HB_FUNCNAME( MAIN )}, NULL },
{ "GLOCODE", {HB_FS_PUBLIC | HB_FS_MEMVAR | HB_FS_MESSAGE}, {NULL}, NULL },
{ "__MVPUBLIC", {HB_FS_PUBLIC}, {HB_FUNCNAME( __MVPUBLIC )}, NULL },
{ "SET", {HB_FS_PUBLIC}, {HB_FUNCNAME( SET )}, NULL },
{ "__SETCENTURY", {HB_FS_PUBLIC}, {HB_FUNCNAME( __SETCENTURY )}, NULL },
{ "SETHANDLECOUNT", {HB_FS_PUBLIC}, {HB_FUNCNAME( SETHANDLECOUNT )}, NULL },
{ "SETBALLOON", {HB_FS_PUBLIC}, {HB_FUNCNAME( SETBALLOON )}, NULL },
{ "NEW", {HB_FS_PUBLIC | HB_FS_MEMVAR | HB_FS_MESSAGE}, {NULL}, NULL },
{ "TFONT", {HB_FS_PUBLIC}, {HB_FUNCNAME( TFONT )}, NULL },
{ "GETSYSTEMFONT", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( GETSYSTEMFONT )}, NULL },
{ "TICON", {HB_FS_PUBLIC}, {HB_FUNCNAME( TICON )}, NULL },
{ "DEFINE", {HB_FS_PUBLIC | HB_FS_MEMVAR | HB_FS_MESSAGE}, {NULL}, NULL },
{ "TBITMAP", {HB_FS_PUBLIC}, {HB_FUNCNAME( TBITMAP )}, NULL },
{ "TMDIFRAME", {HB_FS_PUBLIC}, {HB_FUNCNAME( TMDIFRAME )}, NULL },
{ "BUILDMENU", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( BUILDMENU )}, NULL },
{ "NRGB", {HB_FS_PUBLIC}, {HB_FUNCNAME( NRGB )}, NULL },
{ "TBAR", {HB_FS_PUBLIC}, {HB_FUNCNAME( TBAR )}, NULL },
{ "MENUBEGIN", {HB_FS_PUBLIC}, {HB_FUNCNAME( MENUBEGIN )}, NULL },
{ "MENUADDITEM", {HB_FS_PUBLIC}, {HB_FUNCNAME( MENUADDITEM )}, NULL },
{ "CTITLE", {HB_FS_PUBLIC | HB_FS_MEMVAR | HB_FS_MESSAGE}, {NULL}, NULL },
{ "GEFYRA", {HB_FS_PUBLIC}, {HB_FUNCNAME( GEFYRA )}, NULL },
{ "KEFALAIO", {HB_FS_PUBLIC}, {HB_FUNCNAME( KEFALAIO )}, NULL },
{ "LAMPROY", {HB_FS_PUBLIC}, {HB_FUNCNAME( LAMPROY )}, NULL },
{ "MENUEND", {HB_FS_PUBLIC}, {HB_FUNCNAME( MENUEND )}, NULL },
{ "NEWBAR", {HB_FS_PUBLIC | HB_FS_MEMVAR | HB_FS_MESSAGE}, {NULL}, NULL },
{ "TBTNBMP", {HB_FS_PUBLIC}, {HB_FUNCNAME( TBTNBMP )}, NULL },
{ "SHOWPOPUP", {HB_FS_PUBLIC | HB_FS_MEMVAR | HB_FS_MESSAGE}, {NULL}, NULL },
{ "_OMSGBAR", {HB_FS_PUBLIC | HB_FS_MEMVAR | HB_FS_MESSAGE}, {NULL}, NULL },
{ "TMSGBAR", {HB_FS_PUBLIC}, {HB_FUNCNAME( TMSGBAR )}, NULL },
{ "ACTIVATE", {HB_FS_PUBLIC | HB_FS_MEMVAR | HB_FS_MESSAGE}, {NULL}, NULL },
{ "BLCLICKED", {HB_FS_PUBLIC | HB_FS_MEMVAR | HB_FS_MESSAGE}, {NULL}, NULL },
{ "BRCLICKED", {HB_FS_PUBLIC | HB_FS_MEMVAR | HB_FS_MESSAGE}, {NULL}, NULL },
{ "BMOVED", {HB_FS_PUBLIC | HB_FS_MEMVAR | HB_FS_MESSAGE}, {NULL}, NULL },
{ "BRESIZED", {HB_FS_PUBLIC | HB_FS_MEMVAR | HB_FS_MESSAGE}, {NULL}, NULL },
{ "_BPAINTED", {HB_FS_PUBLIC | HB_FS_MEMVAR | HB_FS_MESSAGE}, {NULL}, NULL },
{ "DRAWBITMAP", {HB_FS_PUBLIC}, {HB_FUNCNAME( DRAWBITMAP )}, NULL },
{ "HBITMAP", {HB_FS_PUBLIC | HB_FS_MEMVAR | HB_FS_MESSAGE}, {NULL}, NULL },
{ "NHEIGHT", {HB_FS_PUBLIC | HB_FS_MEMVAR | HB_FS_MESSAGE}, {NULL}, NULL },
{ "NWIDTH", {HB_FS_PUBLIC | HB_FS_MEMVAR | HB_FS_MESSAGE}, {NULL}, NULL },
{ "BKEYDOWN", {HB_FS_PUBLIC | HB_FS_MEMVAR | HB_FS_MESSAGE}, {NULL}, NULL },
{ "BINIT", {HB_FS_PUBLIC | HB_FS_MEMVAR | HB_FS_MESSAGE}, {NULL}, NULL },
{ "MSGYESNO", {HB_FS_PUBLIC}, {HB_FUNCNAME( MSGYESNO )}, NULL },
{ "BLBUTTONUP", {HB_FS_PUBLIC | HB_FS_MEMVAR | HB_FS_MESSAGE}, {NULL}, NULL },
{ "BMPPEL", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( BMPPEL )}, NULL },
{ "END", {HB_FS_PUBLIC | HB_FS_MEMVAR | HB_FS_MESSAGE}, {NULL}, NULL },
{ "ADDHELP", {HB_FS_PUBLIC | HB_FS_MEMVAR | HB_FS_MESSAGE}, {NULL}, NULL },
{ "EMPTY", {HB_FS_PUBLIC}, {HB_FUNCNAME( EMPTY )}, NULL },
{ "PADL", {HB_FS_PUBLIC}, {HB_FUNCNAME( PADL )}, NULL },
{ "FILE", {HB_FS_PUBLIC}, {HB_FUNCNAME( FILE )}, NULL },
{ "__COPYFILE", {HB_FS_PUBLIC}, {HB_FUNCNAME( __COPYFILE )}, NULL },
{ "WINEXEC", {HB_FS_PUBLIC}, {HB_FUNCNAME( WINEXEC )}, NULL },
{ "APPSYS", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( APPSYS )}, NULL },
{ "OPENXLS", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( OPENXLS )}, NULL },
{ "GETPROCADDRESS", {HB_FS_PUBLIC}, {HB_FUNCNAME( GETPROCADDRESS )}, NULL },
{ "TACTIVEX", {HB_FS_PUBLIC}, {HB_FUNCNAME( TACTIVEX )}, NULL },
{ "ERRORSYS", {HB_FS_PUBLIC}, {HB_FUNCNAME( ERRORSYS )}, NULL },
{ "(_INITSTATICS00001)", {HB_FS_INITEXIT}, {hb_INITSTATICS}, &ModuleFakeDyn },
{ "hb_REGISTERGLOBALS", {HB_FS_INITEXIT}, {hb_REGISTERGLOBALS}, &ModuleFakeDyn }
HB_INIT_SYMBOLS_END( hb_vm_SymbolInit_MENU )

#if defined(HB_PRAGMA_STARTUP)
   #pragma startup hb_vm_SymbolInit_MENU
#elif defined(HB_MSC_STARTUP)
   #if _MSC_VER >= 1010
      #pragma data_seg( ".CRT$XIY" )
      #pragma comment( linker, "/Merge:.CRT=.data" )
   #else
      #pragma data_seg( "XIY" )
   #endif
   static HB_$INITSYM hb_vm_auto_SymbolInit_MENU = hb_vm_SymbolInit_MENU;
   #pragma data_seg()
#endif

HB_FUNC( MAIN )
{
   static const BYTE pcode[] =
   {
	HB_P_FRAME, 10, 0,
	HB_P_SFRAME, 56, 0,
	HB_P_BASELINE, 32, 0,
	HB_P_PUSHSYMNEAR, 2,
	HB_P_PUSHNIL,
	HB_P_PUSHSYMNEAR, 1,
	HB_P_DOSHORT, 1,
	HB_P_LINEOFFSET, 2,
	HB_P_PUSHSYMNEAR, 3,
	HB_P_PUSHNIL,
	HB_P_PUSHBYTE, 4,
	HB_P_PUSHSYMNEAR, 4,
	HB_P_PUSHNIL,
	HB_P_FUNCTIONSHORT, 0,
	HB_P_JUMPFALSENEAR, 17,
	HB_P_PUSHSTRSHORT, 11,
	'd', 'd', '/', 'm', 'm', '/', 'y', 'y', 'y', 'y', 0, 
	HB_P_JUMPNEAR, 13,
	HB_P_PUSHSTRSHORT, 9,
	'd', 'd', '/', 'm', 'm', '/', 'y', 'y', 0, 
	HB_P_DOSHORT, 2,
	HB_P_LINEOFFSET, 3,
	HB_P_PUSHSYMNEAR, 3,
	HB_P_PUSHNIL,
	HB_P_PUSHBYTE, 5,
	HB_P_PUSHINT, 198, 7,
	HB_P_DOSHORT, 2,
	HB_P_LINEOFFSET, 4,
	HB_P_PUSHSYMNEAR, 3,
	HB_P_PUSHNIL,
	HB_P_PUSHBYTE, 4,
	HB_P_PUSHSTRSHORT, 11,
	'D', 'D', '/', 'M', 'M', '/', 'Y', 'Y', 'Y', 'Y', 0, 
	HB_P_DOSHORT, 2,
	HB_P_LINEOFFSET, 5,
	HB_P_PUSHSYMNEAR, 3,
	HB_P_PUSHNIL,
	HB_P_PUSHBYTE, 11,
	HB_P_PUSHSTRSHORT, 3,
	'O', 'N', 0, 
	HB_P_DOSHORT, 2,
	HB_P_LINEOFFSET, 6,
	HB_P_PUSHSYMNEAR, 5,
	HB_P_PUSHNIL,
	HB_P_PUSHINT, 150, 0,
	HB_P_DOSHORT, 1,
	HB_P_LINEOFFSET, 7,
	HB_P_PUSHSYMNEAR, 6,
	HB_P_PUSHNIL,
	HB_P_TRUE,
	HB_P_DOSHORT, 1,
	HB_P_LINEOFFSET, 9,
	HB_P_MESSAGE, 7, 0,
	HB_P_PUSHSYMNEAR, 8,
	HB_P_PUSHNIL,
	HB_P_FUNCTIONSHORT, 0,
	HB_P_PUSHSYMNEAR, 9,
	HB_P_PUSHNIL,
	HB_P_FUNCTIONSHORT, 0,
	HB_P_ZERO,
	HB_P_PUSHBYTE, 246,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_SENDSHORT, 17,
	HB_P_POPLOCALNEAR, 9,
	HB_P_LINEOFFSET, 11,
	HB_P_MESSAGE, 7, 0,
	HB_P_PUSHSYMNEAR, 10,
	HB_P_PUSHNIL,
	HB_P_FUNCTIONSHORT, 0,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHSTRSHORT, 6,
	'S', 'u', 'p', 'e', 'r', 0, 
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_SENDSHORT, 5,
	HB_P_POPLOCALNEAR, 10,
	HB_P_LINEOFFSET, 13,
	HB_P_MESSAGE, 11, 0,
	HB_P_PUSHSYMNEAR, 12,
	HB_P_PUSHNIL,
	HB_P_FUNCTIONSHORT, 0,
	HB_P_PUSHSTRSHORT, 8,
	'b', 'a', 'c', 'k', 'W', 'i', 'n', 0, 
	HB_P_PUSHNIL,
	HB_P_PUSHSTATIC, 1, 0,
	HB_P_SENDSHORT, 3,
	HB_P_POPLOCALNEAR, 8,
	HB_P_LINEOFFSET, 16,
	HB_P_MESSAGE, 7, 0,
	HB_P_PUSHSYMNEAR, 13,
	HB_P_PUSHNIL,
	HB_P_FUNCTIONSHORT, 0,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHSTRSHORT, 33,
	197, 246, 225, 241, 236, 239, 227, 222, ' ', 196, 233, 225, 247, '/', 243, 231, 242, ' ', 193, 241, 247, 229, 223, 249, 237, ' ', 'E', 'X', 'C', 'E', 'L', ' ', 0, 
	HB_P_PUSHNIL,
	HB_P_PUSHSYMNEAR, 14,
	HB_P_PUSHNIL,
	HB_P_FUNCTIONSHORT, 0,
	HB_P_PUSHNIL,
	HB_P_PUSHLOCALNEAR, 10,
	HB_P_PUSHSYMNEAR, 15,
	HB_P_PUSHNIL,
	HB_P_PUSHINT, 230, 0,
	HB_P_PUSHINT, 230, 0,
	HB_P_PUSHINT, 230, 0,
	HB_P_FUNCTIONSHORT, 3,
	HB_P_PUSHSYMNEAR, 15,
	HB_P_PUSHNIL,
	HB_P_PUSHINT, 204, 0,
	HB_P_PUSHINT, 230, 0,
	HB_P_PUSHINT, 255, 0,
	HB_P_FUNCTIONSHORT, 3,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_SENDSHORT, 17,
	HB_P_POPSTATIC, 1, 0,
	HB_P_LINEOFFSET, 18,
	HB_P_MESSAGE, 7, 0,
	HB_P_PUSHSYMNEAR, 16,
	HB_P_PUSHNIL,
	HB_P_FUNCTIONSHORT, 0,
	HB_P_PUSHSTATIC, 1, 0,
	HB_P_PUSHBYTE, 100,
	HB_P_PUSHBYTE, 60,
	HB_P_TRUE,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_TRUE,
	HB_P_SENDSHORT, 7,
	HB_P_POPLOCALNEAR, 1,
	HB_P_LINEOFFSET, 20,
	HB_P_PUSHSYMNEAR, 17,
	HB_P_PUSHNIL,
	HB_P_TRUE,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_FALSE,
	HB_P_FUNCTIONSHORT, 4,
	HB_P_POPLOCALNEAR, 3,
	HB_P_LINEOFFSET, 21,
	HB_P_PUSHSYMNEAR, 18,
	HB_P_PUSHNIL,
	HB_P_PUSHSTRSHORT, 21,
	208, 225, 241, 220, 236, 229, 244, 241, 239, 233, ' ', 197, 246, 225, 241, 236, 239, 227, 222, 242, 0, 
	HB_P_PUSHNIL,
	HB_P_FALSE,
	HB_P_PUSHNIL,
	HB_P_PUSHBLOCK, 85, 0,
	1, 0,
	0, 0,
	HB_P_MESSAGE, 19, 0,
	HB_P_PUSHSTATIC, 1, 0,
	HB_P_PUSHSTRSHORT, 67,
	197, 246, 225, 241, 236, 239, 227, 222, ' ', 203, 239, 227, 233, 243, 244, 233, 234, 222, 242, ' ', 197, 237, 231, 236, 221, 241, 249, 243, 231, 242, ' ', 'E', 'p', 's', 'i', 'l', 'o', 'n', ' ', ' ', ' ', ' ', 225, 240, 252, ' ', 229, 236, 240, 239, 241, 233, 234, 221, 242, ' ', 197, 246, 225, 241, 236, 239, 227, 221, 242, ' ', 0, 
	HB_P_SENDSHORT, 1,
	HB_P_ENDBLOCK,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_FALSE,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_FALSE,
	HB_P_DOSHORT, 15,
	HB_P_LINEOFFSET, 22,
	HB_P_PUSHSYMNEAR, 18,
	HB_P_PUSHNIL,
	HB_P_PUSHSTRSHORT, 31,
	195, 197, 217, 208, 209, 207, 211, 212, 193, 211, 201, 193, ' ', 195, 202, 193, 205, 193, 212, 211, 207, 211, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 0, 
	HB_P_PUSHNIL,
	HB_P_FALSE,
	HB_P_PUSHNIL,
	HB_P_PUSHBLOCK, 13, 0,
	1, 0,
	0, 0,
	HB_P_PUSHSYMNEAR, 20,
	HB_P_PUSHNIL,
	HB_P_FUNCTIONSHORT, 0,
	HB_P_ENDBLOCK,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_FALSE,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_FALSE,
	HB_P_DOSHORT, 15,
	HB_P_LINEOFFSET, 23,
	HB_P_PUSHSYMNEAR, 18,
	HB_P_PUSHNIL,
	HB_P_PUSHSTRSHORT, 31,
	214, 225, 237, 225, 241, 252, 240, 239, 245, 235, 239, 242, ' ', ' ', 193, 194, ' ', 194, 225, 243, 233, 235, 252, 240, 239, 245, 235, 239, 242, ' ', 0, 
	HB_P_PUSHNIL,
	HB_P_FALSE,
	HB_P_PUSHNIL,
	HB_P_PUSHBLOCK, 13, 0,
	1, 0,
	0, 0,
	HB_P_PUSHSYMNEAR, 21,
	HB_P_PUSHNIL,
	HB_P_FUNCTIONSHORT, 0,
	HB_P_ENDBLOCK,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_FALSE,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_FALSE,
	HB_P_DOSHORT, 15,
	HB_P_LINEOFFSET, 24,
	HB_P_PUSHSYMNEAR, 18,
	HB_P_PUSHNIL,
	HB_P_PUSHSTRSHORT, 31,
	194, ' ', '&', ' ', 196, ' ', 203, 225, 236, 240, 241, 239, 245, ' ', 207, 197, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 0, 
	HB_P_PUSHNIL,
	HB_P_FALSE,
	HB_P_PUSHNIL,
	HB_P_PUSHBLOCK, 13, 0,
	1, 0,
	0, 0,
	HB_P_PUSHSYMNEAR, 22,
	HB_P_PUSHNIL,
	HB_P_FUNCTIONSHORT, 0,
	HB_P_ENDBLOCK,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_FALSE,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_FALSE,
	HB_P_DOSHORT, 15,
	HB_P_LINEOFFSET, 28,
	HB_P_PUSHSYMNEAR, 23,
	HB_P_PUSHNIL,
	HB_P_DOSHORT, 0,
	HB_P_LINEOFFSET, 32,
	HB_P_MESSAGE, 24, 0,
	HB_P_PUSHSYMNEAR, 25,
	HB_P_PUSHNIL,
	HB_P_FUNCTIONSHORT, 0,
	HB_P_PUSHSTRSHORT, 7,
	'p', 'e', 'o', 'p', 'l', 'e', 0, 
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHBLOCK, 17, 0,
	1, 0,
	1, 0,
	6, 0,
	HB_P_MESSAGE, 26, 0,
	HB_P_PUSHLOCALNEAR, 255,
	HB_P_SENDSHORT, 0,
	HB_P_ENDBLOCK,
	HB_P_TRUE,
	HB_P_PUSHLOCALNEAR, 1,
	HB_P_FALSE,
	HB_P_PUSHNIL,
	HB_P_PUSHSTRSHORT, 29,
	197, 237, 231, 236, 221, 241, 249, 243, 231, ' ', 194, 239, 231, 232, 231, 244, 233, 234, 254, 237, ' ', 208, 233, 237, 220, 234, 249, 237, 0, 
	HB_P_FALSE,
	HB_P_PUSHNIL,
	HB_P_PUSHSTRSHORT, 18,
	'o', 'B', 't', 'n', '1', ':', 'S', 'h', 'o', 'w', 'P', 'o', 'p', 'u', 'p', '(', ')', 0, 
	HB_P_PUSHNIL,
	HB_P_PUSHSTRSHORT, 15,
	193, 241, 247, 229, 223, 225, '-', 208, 223, 237, 225, 234, 229, 242, 0, 
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHLOCALNEAR, 3,
	HB_P_PUSHNIL,
	HB_P_SENDSHORT, 22,
	HB_P_POPLOCALNEAR, 6,
	HB_P_LINEOFFSET, 37,
	HB_P_PUSHSYMNEAR, 17,
	HB_P_PUSHNIL,
	HB_P_TRUE,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_FALSE,
	HB_P_FUNCTIONSHORT, 4,
	HB_P_POPLOCALNEAR, 4,
	HB_P_LINEOFFSET, 38,
	HB_P_PUSHSYMNEAR, 18,
	HB_P_PUSHNIL,
	HB_P_PUSHSTRSHORT, 13,
	'&', 202, 225, 241, 244, 221, 235, 235, 225, ' ', '0', '1', 0, 
	HB_P_PUSHNIL,
	HB_P_FALSE,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_FALSE,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_FALSE,
	HB_P_DOSHORT, 15,
	HB_P_LINEOFFSET, 39,
	HB_P_PUSHSYMNEAR, 18,
	HB_P_PUSHNIL,
	HB_P_PUSHSTRSHORT, 13,
	'&', 202, 225, 241, 244, 221, 235, 235, 225, ' ', '0', '2', 0, 
	HB_P_PUSHNIL,
	HB_P_FALSE,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_FALSE,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_FALSE,
	HB_P_DOSHORT, 15,
	HB_P_LINEOFFSET, 41,
	HB_P_PUSHSYMNEAR, 23,
	HB_P_PUSHNIL,
	HB_P_DOSHORT, 0,
	HB_P_LINEOFFSET, 45,
	HB_P_MESSAGE, 24, 0,
	HB_P_PUSHSYMNEAR, 25,
	HB_P_PUSHNIL,
	HB_P_FUNCTIONSHORT, 0,
	HB_P_PUSHSTRSHORT, 6,
	'p', 'r', 'i', 'n', 't', 0, 
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHBLOCK, 17, 0,
	1, 0,
	1, 0,
	7, 0,
	HB_P_MESSAGE, 26, 0,
	HB_P_PUSHLOCALNEAR, 255,
	HB_P_SENDSHORT, 0,
	HB_P_ENDBLOCK,
	HB_P_TRUE,
	HB_P_PUSHLOCALNEAR, 1,
	HB_P_FALSE,
	HB_P_PUSHNIL,
	HB_P_PUSHSTRSHORT, 38,
	197, 234, 244, 245, 240, 249, 243, 229, 233, 242, ' ', 'C', 'r', 'y', 's', 't', 'a', 'l', ' ', 'R', 'e', 'p', 'o', 'r', 't', ' ', 'v', 'e', 'r', 's', 'i', 'o', 'n', ' ', '8', '.', '5', 0, 
	HB_P_FALSE,
	HB_P_PUSHNIL,
	HB_P_PUSHSTRSHORT, 18,
	'o', 'B', 't', 'n', '2', ':', 'S', 'h', 'o', 'w', 'P', 'o', 'p', 'u', 'p', '(', ')', 0, 
	HB_P_PUSHNIL,
	HB_P_PUSHSTRSHORT, 11,
	197, 234, 244, 245, 240, 254, 243, 229, 233, 242, 0, 
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHLOCALNEAR, 4,
	HB_P_PUSHNIL,
	HB_P_SENDSHORT, 22,
	HB_P_POPLOCALNEAR, 7,
	HB_P_LINEOFFSET, 53,
	HB_P_MESSAGE, 27, 0,
	HB_P_PUSHSTATIC, 1, 0,
	HB_P_MESSAGE, 7, 0,
	HB_P_PUSHSYMNEAR, 28,
	HB_P_PUSHNIL,
	HB_P_FUNCTIONSHORT, 0,
	HB_P_PUSHSTATIC, 1, 0,
	HB_P_PUSHSTRSHORT, 58,
	'S', 'i', 't', 'e', ':', ' ', ' ', 'w', 'w', 'w', '.', 'd', 'b', 's', 'o', 'f', 't', '.', 'g', 'r', ' ', ' ', ' ', ' ', 'e', 'm', 'a', 'i', 'l', ':', ' ', ' ', 'i', 'n', 'f', 'o', '@', 'd', 'b', 's', 'o', 'f', 't', '.', 'g', 'r', ' ', ' ', ' ', '2', '0', '1', '2', ' ', ' ', ' ', ' ', 0, 
	HB_P_TRUE,
	HB_P_TRUE,
	HB_P_FALSE,
	HB_P_TRUE,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_TRUE,
	HB_P_SENDSHORT, 11,
	HB_P_SENDSHORT, 1,
	HB_P_POP,
	HB_P_LINEOFFSET, 59,
	HB_P_MESSAGE, 29, 0,
	HB_P_PUSHSTATIC, 1, 0,
	HB_P_PUSHSTRSHORT, 10,
	'M', 'A', 'X', 'I', 'M', 'I', 'Z', 'E', 'D', 0, 
	HB_P_MESSAGE, 30, 0,
	HB_P_PUSHSTATIC, 1, 0,
	HB_P_SENDSHORT, 0,
	HB_P_MESSAGE, 31, 0,
	HB_P_PUSHSTATIC, 1, 0,
	HB_P_SENDSHORT, 0,
	HB_P_MESSAGE, 32, 0,
	HB_P_PUSHSTATIC, 1, 0,
	HB_P_SENDSHORT, 0,
	HB_P_MESSAGE, 33, 0,
	HB_P_PUSHSTATIC, 1, 0,
	HB_P_SENDSHORT, 0,
	HB_P_MESSAGE, 34, 0,
	HB_P_PUSHSTATIC, 1, 0,
	HB_P_PUSHBLOCK, 71, 0,
	2, 0,
	1, 0,
	8, 0,
	HB_P_PUSHSYMNEAR, 35,
	HB_P_PUSHNIL,
	HB_P_PUSHLOCALNEAR, 1,
	HB_P_MESSAGE, 36, 0,
	HB_P_PUSHLOCALNEAR, 255,
	HB_P_SENDSHORT, 0,
	HB_P_MESSAGE, 37, 0,
	HB_P_PUSHSTATIC, 1, 0,
	HB_P_SENDSHORT, 0,
	HB_P_PUSHBYTE, 2,
	HB_P_DIVIDE,
	HB_P_MESSAGE, 37, 0,
	HB_P_PUSHLOCALNEAR, 255,
	HB_P_SENDSHORT, 0,
	HB_P_PUSHBYTE, 2,
	HB_P_DIVIDE,
	HB_P_MINUS,
	HB_P_ADDINT, 206, 255,
	HB_P_MESSAGE, 38, 0,
	HB_P_PUSHSTATIC, 1, 0,
	HB_P_SENDSHORT, 0,
	HB_P_PUSHBYTE, 2,
	HB_P_DIVIDE,
	HB_P_MESSAGE, 38, 0,
	HB_P_PUSHLOCALNEAR, 255,
	HB_P_SENDSHORT, 0,
	HB_P_PUSHBYTE, 2,
	HB_P_DIVIDE,
	HB_P_MINUS,
	HB_P_FUNCTIONSHORT, 4,
	HB_P_ENDBLOCK,
	HB_P_SENDSHORT, 1,
	HB_P_MESSAGE, 39, 0,
	HB_P_PUSHSTATIC, 1, 0,
	HB_P_SENDSHORT, 0,
	HB_P_MESSAGE, 40, 0,
	HB_P_PUSHSTATIC, 1, 0,
	HB_P_SENDSHORT, 0,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHBLOCKSHORT, 47,
	HB_P_PUSHSYMNEAR, 41,
	HB_P_PUSHNIL,
	HB_P_PUSHSTRSHORT, 37,
	200, 221, 235, 229, 244, 229, ' ', 237, 225, ' ', 229, 227, 234, 225, 244, 225, 235, 229, 223, 248, 229, 244, 229, ' ', 244, 239, ' ', 208, 241, 252, 227, 241, 225, 236, 236, 225, 0, 
	HB_P_FUNCTIONSHORT, 1,
	HB_P_ENDBLOCK,
	HB_P_PUSHNIL,
	HB_P_MESSAGE, 42, 0,
	HB_P_PUSHSTATIC, 1, 0,
	HB_P_SENDSHORT, 0,
	HB_P_SENDSHORT, 19,
	HB_P_POP,
	HB_P_LINEOFFSET, 61,
	HB_P_PUSHNIL,
	HB_P_RETVALUE,
	HB_P_ENDPROC
   };

   hb_vmExecute( pcode, symbols );
}

HB_FUNC( BUILDMENU )
{
   static const BYTE pcode[] =
   {
	HB_P_FRAME, 1, 0,
	HB_P_SFRAME, 56, 0,
	HB_P_BASELINE, 102, 0,
	HB_P_PUSHSYMNEAR, 17,
	HB_P_PUSHNIL,
	HB_P_FALSE,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_TRUE,
	HB_P_FUNCTIONSHORT, 4,
	HB_P_POPLOCALNEAR, 1,
	HB_P_LINEOFFSET, 1,
	HB_P_PUSHSYMNEAR, 18,
	HB_P_PUSHNIL,
	HB_P_PUSHSTRSHORT, 10,
	'&', 208, 241, 239, 226, 239, 235, 221, 242, 0, 
	HB_P_PUSHNIL,
	HB_P_FALSE,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_FALSE,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_FALSE,
	HB_P_DOSHORT, 15,
	HB_P_LINEOFFSET, 2,
	HB_P_PUSHSYMNEAR, 17,
	HB_P_PUSHNIL,
	HB_P_FALSE,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_FALSE,
	HB_P_DOSHORT, 4,
	HB_P_LINEOFFSET, 3,
	HB_P_PUSHSYMNEAR, 18,
	HB_P_PUSHNIL,
	HB_P_PUSHSTRSHORT, 22,
	'&', 193, 237, 225, 235, 245, 244, 233, 234, 221, 242, ' ', 202, 225, 241, 244, 221, 235, 229, 242, '.', 0, 
	HB_P_PUSHNIL,
	HB_P_FALSE,
	HB_P_PUSHNIL,
	HB_P_PUSHBLOCK, 13, 0,
	1, 0,
	0, 0,
	HB_P_PUSHSYMNEAR, 43,
	HB_P_PUSHNIL,
	HB_P_FUNCTIONSHORT, 0,
	HB_P_ENDBLOCK,
	HB_P_PUSHSTRSHORT, 27,
	'b', 'i', 't', 'm', 'a', 'p', 's', 92, '1', '6', 'x', '1', '6', 92, 'f', 'a', 'v', 'o', 'r', 'i', 't', 'e', '.', 'b', 'm', 'p', 0, 
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_FALSE,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_FALSE,
	HB_P_DOSHORT, 15,
	HB_P_LINEOFFSET, 4,
	HB_P_PUSHSYMNEAR, 18,
	HB_P_PUSHNIL,
	HB_P_PUSHSTRSHORT, 11,
	'&', 'R', 'e', 'p', 'o', 'r', 't', '.', '.', '.', 0, 
	HB_P_MACROTEXT,
	HB_P_PUSHNIL,
	HB_P_FALSE,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_FALSE,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_FALSE,
	HB_P_DOSHORT, 15,
	HB_P_LINEOFFSET, 5,
	HB_P_PUSHSYMNEAR, 17,
	HB_P_PUSHNIL,
	HB_P_FALSE,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_FALSE,
	HB_P_DOSHORT, 4,
	HB_P_LINEOFFSET, 6,
	HB_P_PUSHSYMNEAR, 18,
	HB_P_PUSHNIL,
	HB_P_PUSHSTRSHORT, 12,
	'&', 202, 225, 241, 244, 221, 235, 235, 225, ' ', 'A', 0, 
	HB_P_PUSHNIL,
	HB_P_FALSE,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_FALSE,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_FALSE,
	HB_P_DOSHORT, 15,
	HB_P_LINEOFFSET, 7,
	HB_P_PUSHSYMNEAR, 18,
	HB_P_PUSHNIL,
	HB_P_PUSHSTRSHORT, 12,
	'&', 202, 225, 241, 244, 221, 235, 235, 225, ' ', 'B', 0, 
	HB_P_PUSHNIL,
	HB_P_FALSE,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_FALSE,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_FALSE,
	HB_P_DOSHORT, 15,
	HB_P_LINEOFFSET, 9,
	HB_P_PUSHSYMNEAR, 18,
	HB_P_PUSHNIL,
	HB_P_PUSHSTRSHORT, 10,
	'&', 'T', 'h', 'r', 'e', 'e', '.', '.', '.', 0, 
	HB_P_MACROTEXT,
	HB_P_PUSHNIL,
	HB_P_FALSE,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_FALSE,
	HB_P_PUSHNIL,
	HB_P_PUSHBLOCKSHORT, 4,
	HB_P_FALSE,
	HB_P_ENDBLOCK,
	HB_P_FALSE,
	HB_P_DOSHORT, 15,
	HB_P_LINEOFFSET, 10,
	HB_P_PUSHSYMNEAR, 23,
	HB_P_PUSHNIL,
	HB_P_DOSHORT, 0,
	HB_P_LINEOFFSET, 11,
	HB_P_PUSHSYMNEAR, 18,
	HB_P_PUSHNIL,
	HB_P_DOSHORT, 0,
	HB_P_LINEOFFSET, 12,
	HB_P_PUSHSYMNEAR, 18,
	HB_P_PUSHNIL,
	HB_P_PUSHSTRSHORT, 8,
	'&', 197, 247, 239, 228, 239, 242, 0, 
	HB_P_PUSHNIL,
	HB_P_FALSE,
	HB_P_PUSHNIL,
	HB_P_PUSHBLOCK, 16, 0,
	1, 0,
	0, 0,
	HB_P_MESSAGE, 44, 0,
	HB_P_PUSHSTATIC, 1, 0,
	HB_P_SENDSHORT, 0,
	HB_P_ENDBLOCK,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_FALSE,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_FALSE,
	HB_P_DOSHORT, 15,
	HB_P_LINEOFFSET, 13,
	HB_P_PUSHSYMNEAR, 23,
	HB_P_PUSHNIL,
	HB_P_DOSHORT, 0,
	HB_P_LINEOFFSET, 15,
	HB_P_PUSHSYMNEAR, 18,
	HB_P_PUSHNIL,
	HB_P_PUSHSTRSHORT, 5,
	'E', 'd', 'i', 't', 0, 
	HB_P_PUSHNIL,
	HB_P_FALSE,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_FALSE,
	HB_P_PUSHNIL,
	HB_P_PUSHBLOCKSHORT, 4,
	HB_P_FALSE,
	HB_P_ENDBLOCK,
	HB_P_FALSE,
	HB_P_DOSHORT, 15,
	HB_P_LINEOFFSET, 19,
	HB_P_PUSHSYMNEAR, 18,
	HB_P_PUSHNIL,
	HB_P_PUSHSTRSHORT, 22,
	194, 239, 231, 232, 231, 244, 233, 234, 220, ' ', 208, 241, 239, 227, 241, 220, 236, 236, 225, 244, 225, 0, 
	HB_P_PUSHNIL,
	HB_P_FALSE,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_FALSE,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_FALSE,
	HB_P_DOSHORT, 15,
	HB_P_LINEOFFSET, 20,
	HB_P_PUSHSYMNEAR, 17,
	HB_P_PUSHNIL,
	HB_P_FALSE,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_FALSE,
	HB_P_DOSHORT, 4,
	HB_P_LINEOFFSET, 21,
	HB_P_PUSHSYMNEAR, 18,
	HB_P_PUSHNIL,
	HB_P_PUSHSTRSHORT, 31,
	'&', 193, 237, 225, 228, 233, 239, 241, 227, 220, 237, 249, 243, 231, ' ', 196, 229, 233, 234, 244, 254, 237, ' ', 193, 241, 247, 229, 223, 249, 237, 0, 
	HB_P_PUSHNIL,
	HB_P_FALSE,
	HB_P_FALSE,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_FALSE,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_FALSE,
	HB_P_DOSHORT, 15,
	HB_P_LINEOFFSET, 22,
	HB_P_PUSHSYMNEAR, 18,
	HB_P_PUSHNIL,
	HB_P_PUSHSTRSHORT, 31,
	'&', 193, 237, 244, 223, 227, 241, 225, 246, 225, ' ', 193, 243, 246, 225, 235, 223, 225, 242, '(', 'B', 'a', 'c', 'k', 'u', 'p', ')', '.', '.', '.', 0, 
	HB_P_PUSHNIL,
	HB_P_TRUE,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_FALSE,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_FALSE,
	HB_P_DOSHORT, 15,
	HB_P_LINEOFFSET, 23,
	HB_P_PUSHSYMNEAR, 18,
	HB_P_PUSHNIL,
	HB_P_PUSHSTRSHORT, 31,
	'&', 197, 240, 225, 237, 225, 246, 239, 241, 220, ' ', 193, 241, 247, 229, 223, 249, 237, ' ', '(', 'R', 'e', 's', 't', 'o', 'r', 'e', ')', '.', '.', 0, 
	HB_P_PUSHNIL,
	HB_P_FALSE,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_FALSE,
	HB_P_PUSHNIL,
	HB_P_PUSHBLOCKSHORT, 4,
	HB_P_FALSE,
	HB_P_ENDBLOCK,
	HB_P_FALSE,
	HB_P_DOSHORT, 15,
	HB_P_LINEOFFSET, 24,
	HB_P_PUSHSYMNEAR, 23,
	HB_P_PUSHNIL,
	HB_P_DOSHORT, 0,
	HB_P_LINEOFFSET, 27,
	HB_P_MESSAGE, 45, 0,
	HB_P_PUSHLOCALNEAR, 1,
	HB_P_PUSHSTRSHORT, 21,
	197, 236, 240, 239, 241, 233, 234, 221, 242, ' ', 197, 246, 225, 241, 236, 239, 227, 221, 242, ' ', 0, 
	HB_P_PUSHSTRSHORT, 25,
	'(', 'c', ')', ' ', 'd', 'b', 'S', 'o', 'f', 't', ' ', 'S', 'o', 'f', 't', 'w', 'a', 'r', 'e', ' ', '2', '0', '1', '2', 0, 
	HB_P_SENDSHORT, 2,
	HB_P_POP,
	HB_P_LINEOFFSET, 28,
	HB_P_PUSHSYMNEAR, 23,
	HB_P_PUSHNIL,
	HB_P_DOSHORT, 0,
	HB_P_LINEOFFSET, 30,
	HB_P_PUSHLOCALNEAR, 1,
	HB_P_RETVALUE,
	HB_P_ENDPROC
   };

   hb_vmExecute( pcode, symbols );
}

HB_FUNC( BMPPEL )
{
   static const BYTE pcode[] =
   {
	HB_P_FRAME, 1, 0,
	HB_P_BASELINE, 139, 0,
	HB_P_PUSHSYMNEAR, 46,
	HB_P_PUSHNIL,
	HB_P_PUSHVARIABLE, 1, 0,
	HB_P_FUNCTIONSHORT, 1,
	HB_P_JUMPTRUE, 185, 0,
	HB_P_LINEOFFSET, 1,
	HB_P_PUSHSTRSHORT, 5,
	'T', 'U', 'T', 'H', 0, 
	HB_P_PUSHSYMNEAR, 47,
	HB_P_PUSHNIL,
	HB_P_PUSHVARIABLE, 1, 0,
	HB_P_PUSHBYTE, 5,
	HB_P_PUSHSTRSHORT, 2,
	'0', 0, 
	HB_P_FUNCTIONSHORT, 3,
	HB_P_PLUS,
	HB_P_PUSHSTRSHORT, 5,
	'.', 'b', 'm', 'p', 0, 
	HB_P_PLUS,
	HB_P_POPLOCALNEAR, 1,
	HB_P_LINEOFFSET, 2,
	HB_P_PUSHSYMNEAR, 48,
	HB_P_PUSHNIL,
	HB_P_PUSHSTRSHORT, 23,
	92, 'o', 'r', 'o', 's', ' ', 'A', 'p', 'l', 'i', 'c', 'a', 't', 'i', 'o', 'n', 92, 'M', 'A', 'P', 'S', 92, 0, 
	HB_P_PUSHLOCALNEAR, 1,
	HB_P_PLUS,
	HB_P_FUNCTIONSHORT, 1,
	HB_P_JUMPTRUENEAR, 66,
	HB_P_LINEOFFSET, 3,
	HB_P_PUSHSYMNEAR, 49,
	HB_P_PUSHNIL,
	HB_P_PUSHSTRSHORT, 27,
	92, 'o', 'r', 'o', 's', ' ', 'A', 'p', 'l', 'i', 'c', 'a', 't', 'i', 'o', 'n', 92, 'T', 'U', 'T', 'H', '0', '.', 'b', 'm', 'p', 0, 
	HB_P_PUSHSTRSHORT, 23,
	92, 'o', 'r', 'o', 's', ' ', 'A', 'p', 'l', 'i', 'c', 'a', 't', 'i', 'o', 'n', 92, 'M', 'A', 'P', 'S', 92, 0, 
	HB_P_PUSHLOCALNEAR, 1,
	HB_P_PLUS,
	HB_P_DOSHORT, 2,
	HB_P_LINEOFFSET, 5,
	HB_P_PUSHSYMNEAR, 50,
	HB_P_PUSHNIL,
	HB_P_PUSHSTRSHORT, 35,
	'm', 's', 'p', 'a', 'i', 'n', 't', '.', 'e', 'x', 'e', ' ', 92, 'o', 'r', 'o', 's', ' ', 'A', 'p', 'l', 'i', 'c', 'a', 't', 'i', 'o', 'n', 92, 'M', 'A', 'P', 'S', 92, 0, 
	HB_P_PUSHLOCALNEAR, 1,
	HB_P_PLUS,
	HB_P_DOSHORT, 1,
	HB_P_LINEOFFSET, 9,
	HB_P_PUSHNIL,
	HB_P_RETVALUE,
	HB_P_ENDPROC
   };

   hb_vmExecute( pcode, symbols );
}

HB_FUNC( APPSYS )
{
   static const BYTE pcode[] =
   {
	HB_P_BASELINE, 155, 0,
	HB_P_ENDPROC
   };

   hb_vmExecute( pcode, symbols );
}

HB_FUNC( GETSYSTEMFONT )
{
   static const BYTE pcode[] =
   {
	HB_P_BASELINE, 160, 0,
	HB_P_PUSHSTRSHORT, 12,
	'A', 'r', 'i', 'a', 'l', ' ', 'G', 'r', 'e', 'e', 'k', 0, 
	HB_P_RETVALUE,
	HB_P_ENDPROC
   };

   hb_vmExecute( pcode, symbols );
}

HB_FUNC( OPENXLS )
{
   static const BYTE pcode[] =
   {
	HB_P_BASELINE, 166, 0,
	HB_P_ENDPROC
   };

   hb_vmExecute( pcode, symbols );
}

HB_FUNC_INITSTATICS()
{
   static const BYTE pcode[] =
   {
	HB_P_STATICS, 56, 0, 1, 0,
	HB_P_ENDPROC
   };

   hb_vmExecute( pcode, symbols );
}

HB_FUNC_REGISTERGLOBAL()
{
   hb_vmRegisterGlobals( &pGlobals, 7 );
}

