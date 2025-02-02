/*
 * xHarbour build 1.1.0 Intl. (SimpLex)
 * Generated C source code from <FILEREAD.PRG>
 * Command: C:\Xharbour\bin\harbour.exe C:\GEFYRES\PRG\FILEREAD.PRG /n /es2 /gc1 /oC:\GEFYRES\PRG\FILEREAD /iC:\FWH\INCLUDE /iC:\xHarbour\include /iC:\FWH\include;C:\GEFYRES\PRG /iC:\Xharbour\include 
 * Created: 2021.08.02 15:34:24 (Borland C++ 5.5.1)
 */

#include "hbvmpub.h"
#include "hbpcode.h"
#include "hbinit.h"

#define __PRG_SOURCE__ "FILEREAD.PRG"

HB_FUNC( TFILEREAD );
HB_FUNC_STATIC( TFILEREAD_NEW );
HB_FUNC_STATIC( TFILEREAD_OPEN );
HB_FUNC_STATIC( TFILEREAD_READLINE );
HB_FUNC_STATIC( TFILEREAD_EOL_POS );
HB_FUNC_STATIC( TFILEREAD_CLOSE );
HB_FUNC_STATIC( TFILEREAD_NAME );
HB_FUNC_STATIC( TFILEREAD_ISOPEN );
HB_FUNC_STATIC( TFILEREAD_MORETOREAD );
HB_FUNC_STATIC( TFILEREAD_ERROR );
HB_FUNC_STATIC( TFILEREAD_ERRORNO );
HB_FUNC_STATIC( TFILEREAD_ERRORMSG );
HB_FUNC( HB_NTOS );
HB_FUNC_INITSTATICS();
HB_FUNC_EXTERN( HBCLASS );
HB_FUNC_EXTERN( HBOBJECT );
HB_FUNC_EXTERN( __CLSINST );
HB_FUNC_EXTERN( __OBJHASMSG );
HB_FUNC_EXTERN( HB_APARAMS );
HB_FUNC_EXTERN( PCOUNT );
HB_FUNC_EXTERN( FOPEN );
HB_FUNC_EXTERN( FERROR );
HB_FUNC_EXTERN( FSEEK );
HB_FUNC_EXTERN( LEN );
HB_FUNC_EXTERN( FREADSTR );
HB_FUNC_EXTERN( EMPTY );
HB_FUNC_EXTERN( LEFT );
HB_FUNC_EXTERN( SUBSTR );
HB_FUNC_EXTERN( AT );
HB_FUNC_EXTERN( MIN );
HB_FUNC_EXTERN( FCLOSE );
HB_FUNC_EXTERN( LTRIM );
HB_FUNC_EXTERN( STR );

#undef HB_PRG_PCODE_VER
#define HB_PRG_PCODE_VER 9

#include "hbapi.h"


HB_INIT_SYMBOLS_BEGIN( hb_vm_SymbolInit_FILEREAD )
{ "TFILEREAD", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( TFILEREAD )}, NULL },
{ "NEW", {HB_FS_PUBLIC | HB_FS_MEMVAR | HB_FS_MESSAGE}, {NULL}, NULL },
{ "HBCLASS", {HB_FS_PUBLIC}, {HB_FUNCNAME( HBCLASS )}, NULL },
{ "CLASSH", {HB_FS_PUBLIC | HB_FS_MEMVAR | HB_FS_MESSAGE}, {NULL}, NULL },
{ "HBOBJECT", {HB_FS_PUBLIC}, {HB_FUNCNAME( HBOBJECT )}, NULL },
{ "ADDMULTIDATA", {HB_FS_PUBLIC | HB_FS_MEMVAR | HB_FS_MESSAGE}, {NULL}, NULL },
{ "ADDMETHOD", {HB_FS_PUBLIC | HB_FS_MEMVAR | HB_FS_MESSAGE}, {NULL}, NULL },
{ "TFILEREAD_NEW", {HB_FS_STATIC | HB_FS_LOCAL}, {HB_FUNCNAME( TFILEREAD_NEW )}, &ModuleFakeDyn },
{ "TFILEREAD_OPEN", {HB_FS_STATIC | HB_FS_LOCAL}, {HB_FUNCNAME( TFILEREAD_OPEN )}, &ModuleFakeDyn },
{ "TFILEREAD_CLOSE", {HB_FS_STATIC | HB_FS_LOCAL}, {HB_FUNCNAME( TFILEREAD_CLOSE )}, &ModuleFakeDyn },
{ "TFILEREAD_READLINE", {HB_FS_STATIC | HB_FS_LOCAL}, {HB_FUNCNAME( TFILEREAD_READLINE )}, &ModuleFakeDyn },
{ "TFILEREAD_NAME", {HB_FS_STATIC | HB_FS_LOCAL}, {HB_FUNCNAME( TFILEREAD_NAME )}, &ModuleFakeDyn },
{ "TFILEREAD_ISOPEN", {HB_FS_STATIC | HB_FS_LOCAL}, {HB_FUNCNAME( TFILEREAD_ISOPEN )}, &ModuleFakeDyn },
{ "TFILEREAD_MORETOREAD", {HB_FS_STATIC | HB_FS_LOCAL}, {HB_FUNCNAME( TFILEREAD_MORETOREAD )}, &ModuleFakeDyn },
{ "TFILEREAD_ERROR", {HB_FS_STATIC | HB_FS_LOCAL}, {HB_FUNCNAME( TFILEREAD_ERROR )}, &ModuleFakeDyn },
{ "TFILEREAD_ERRORNO", {HB_FS_STATIC | HB_FS_LOCAL}, {HB_FUNCNAME( TFILEREAD_ERRORNO )}, &ModuleFakeDyn },
{ "TFILEREAD_ERRORMSG", {HB_FS_STATIC | HB_FS_LOCAL}, {HB_FUNCNAME( TFILEREAD_ERRORMSG )}, &ModuleFakeDyn },
{ "TFILEREAD_EOL_POS", {HB_FS_STATIC | HB_FS_LOCAL}, {HB_FUNCNAME( TFILEREAD_EOL_POS )}, &ModuleFakeDyn },
{ "CREATE", {HB_FS_PUBLIC | HB_FS_MEMVAR | HB_FS_MESSAGE}, {NULL}, NULL },
{ "__CLSINST", {HB_FS_PUBLIC}, {HB_FUNCNAME( __CLSINST )}, NULL },
{ "HCLASS", {HB_FS_PUBLIC | HB_FS_MEMVAR | HB_FS_MESSAGE}, {NULL}, NULL },
{ "__OBJHASMSG", {HB_FS_PUBLIC}, {HB_FUNCNAME( __OBJHASMSG )}, NULL },
{ "INITCLASS", {HB_FS_PUBLIC | HB_FS_MEMVAR | HB_FS_MESSAGE}, {NULL}, NULL },
{ "HB_APARAMS", {HB_FS_PUBLIC}, {HB_FUNCNAME( HB_APARAMS )}, NULL },
{ "PCOUNT", {HB_FS_PUBLIC}, {HB_FUNCNAME( PCOUNT )}, NULL },
{ "CONSTRUCTORCALL", {HB_FS_PUBLIC | HB_FS_MEMVAR | HB_FS_MESSAGE}, {NULL}, NULL },
{ "_CFILE", {HB_FS_PUBLIC | HB_FS_MEMVAR | HB_FS_MESSAGE}, {NULL}, NULL },
{ "_NHAN", {HB_FS_PUBLIC | HB_FS_MEMVAR | HB_FS_MESSAGE}, {NULL}, NULL },
{ "_LEOF", {HB_FS_PUBLIC | HB_FS_MEMVAR | HB_FS_MESSAGE}, {NULL}, NULL },
{ "_NERROR", {HB_FS_PUBLIC | HB_FS_MEMVAR | HB_FS_MESSAGE}, {NULL}, NULL },
{ "_NLASTOP", {HB_FS_PUBLIC | HB_FS_MEMVAR | HB_FS_MESSAGE}, {NULL}, NULL },
{ "_CBUFFER", {HB_FS_PUBLIC | HB_FS_MEMVAR | HB_FS_MESSAGE}, {NULL}, NULL },
{ "_NREADSIZE", {HB_FS_PUBLIC | HB_FS_MEMVAR | HB_FS_MESSAGE}, {NULL}, NULL },
{ "NHAN", {HB_FS_PUBLIC | HB_FS_MEMVAR | HB_FS_MESSAGE}, {NULL}, NULL },
{ "FOPEN", {HB_FS_PUBLIC}, {HB_FUNCNAME( FOPEN )}, NULL },
{ "CFILE", {HB_FS_PUBLIC | HB_FS_MEMVAR | HB_FS_MESSAGE}, {NULL}, NULL },
{ "FERROR", {HB_FS_PUBLIC}, {HB_FUNCNAME( FERROR )}, NULL },
{ "FSEEK", {HB_FS_PUBLIC}, {HB_FUNCNAME( FSEEK )}, NULL },
{ "EOL_POS", {HB_FS_PUBLIC | HB_FS_MEMVAR | HB_FS_MESSAGE}, {NULL}, NULL },
{ "LEN", {HB_FS_PUBLIC}, {HB_FUNCNAME( LEN )}, NULL },
{ "CBUFFER", {HB_FS_PUBLIC | HB_FS_MEMVAR | HB_FS_MESSAGE}, {NULL}, NULL },
{ "LEOF", {HB_FS_PUBLIC | HB_FS_MEMVAR | HB_FS_MESSAGE}, {NULL}, NULL },
{ "FREADSTR", {HB_FS_PUBLIC}, {HB_FUNCNAME( FREADSTR )}, NULL },
{ "NREADSIZE", {HB_FS_PUBLIC | HB_FS_MEMVAR | HB_FS_MESSAGE}, {NULL}, NULL },
{ "EMPTY", {HB_FS_PUBLIC}, {HB_FUNCNAME( EMPTY )}, NULL },
{ "NERROR", {HB_FS_PUBLIC | HB_FS_MEMVAR | HB_FS_MESSAGE}, {NULL}, NULL },
{ "LEFT", {HB_FS_PUBLIC}, {HB_FUNCNAME( LEFT )}, NULL },
{ "SUBSTR", {HB_FS_PUBLIC}, {HB_FUNCNAME( SUBSTR )}, NULL },
{ "AT", {HB_FS_PUBLIC}, {HB_FUNCNAME( AT )}, NULL },
{ "MIN", {HB_FS_PUBLIC}, {HB_FUNCNAME( MIN )}, NULL },
{ "FCLOSE", {HB_FS_PUBLIC}, {HB_FUNCNAME( FCLOSE )}, NULL },
{ "NLASTOP", {HB_FS_PUBLIC | HB_FS_MEMVAR | HB_FS_MESSAGE}, {NULL}, NULL },
{ "HB_NTOS", {HB_FS_PUBLIC | HB_FS_LOCAL | HB_FS_FIRST}, {HB_FUNCNAME( HB_NTOS )}, NULL },
{ "LTRIM", {HB_FS_PUBLIC}, {HB_FUNCNAME( LTRIM )}, NULL },
{ "STR", {HB_FS_PUBLIC}, {HB_FUNCNAME( STR )}, NULL },
{ "(_INITSTATICS00002)", {HB_FS_INITEXIT}, {hb_INITSTATICS}, &ModuleFakeDyn }
HB_INIT_SYMBOLS_END( hb_vm_SymbolInit_FILEREAD )

#if defined(HB_PRAGMA_STARTUP)
   #pragma startup hb_vm_SymbolInit_FILEREAD
#elif defined(HB_MSC_STARTUP)
   #if _MSC_VER >= 1010
      #pragma data_seg( ".CRT$XIY" )
      #pragma comment( linker, "/Merge:.CRT=.data" )
   #else
      #pragma data_seg( "XIY" )
   #endif
   static HB_$INITSYM hb_vm_auto_SymbolInit_FILEREAD = hb_vm_SymbolInit_FILEREAD;
   #pragma data_seg()
#endif

HB_FUNC( TFILEREAD )
{
   static const BYTE pcode[] =
   {
	HB_P_FRAME, 2, 255,
	HB_P_SFRAME, 55, 0,
	HB_P_LOCALNEARSETINT, 2, 1, 0,
	HB_P_PUSHSTATIC, 1, 0,
	HB_P_PUSHNIL,
	HB_P_EXACTLYEQUAL,
	HB_P_JUMPFALSE, 84, 2,
	HB_P_MESSAGE, 1, 0,
	HB_P_PUSHSYMNEAR, 2,
	HB_P_PUSHNIL,
	HB_P_FUNCTIONSHORT, 0,
	HB_P_PUSHSTRSHORT, 10,
	'T', 'F', 'i', 'l', 'e', 'R', 'e', 'a', 'd', 0, 
	HB_P_MESSAGE, 3, 0,
	HB_P_PUSHSYMNEAR, 4,
	HB_P_PUSHNIL,
	HB_P_FUNCTIONSHORT, 0,
	HB_P_SENDSHORT, 0,
	HB_P_ARRAYGEN, 1, 0,
	HB_P_SENDSHORT, 2,
	HB_P_POPSTATIC, 1, 0,
	HB_P_BASELINE, 28, 0,
	HB_P_MESSAGE, 5, 0,
	HB_P_PUSHSTATIC, 1, 0,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHLOCALNEAR, 2,
	HB_P_PUSHSTRSHORT, 6,
	'c', 'F', 'i', 'l', 'e', 0, 
	HB_P_ARRAYGEN, 1, 0,
	HB_P_FALSE,
	HB_P_FALSE,
	HB_P_SENDSHORT, 6,
	HB_P_POP,
	HB_P_LINEOFFSET, 1,
	HB_P_MESSAGE, 5, 0,
	HB_P_PUSHSTATIC, 1, 0,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHLOCALNEAR, 2,
	HB_P_PUSHSTRSHORT, 5,
	'n', 'H', 'a', 'n', 0, 
	HB_P_ARRAYGEN, 1, 0,
	HB_P_FALSE,
	HB_P_FALSE,
	HB_P_SENDSHORT, 6,
	HB_P_POP,
	HB_P_LINEOFFSET, 2,
	HB_P_MESSAGE, 5, 0,
	HB_P_PUSHSTATIC, 1, 0,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHLOCALNEAR, 2,
	HB_P_PUSHSTRSHORT, 5,
	'l', 'E', 'O', 'F', 0, 
	HB_P_ARRAYGEN, 1, 0,
	HB_P_FALSE,
	HB_P_FALSE,
	HB_P_SENDSHORT, 6,
	HB_P_POP,
	HB_P_LINEOFFSET, 3,
	HB_P_MESSAGE, 5, 0,
	HB_P_PUSHSTATIC, 1, 0,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHLOCALNEAR, 2,
	HB_P_PUSHSTRSHORT, 7,
	'n', 'E', 'r', 'r', 'o', 'r', 0, 
	HB_P_ARRAYGEN, 1, 0,
	HB_P_FALSE,
	HB_P_FALSE,
	HB_P_SENDSHORT, 6,
	HB_P_POP,
	HB_P_LINEOFFSET, 4,
	HB_P_MESSAGE, 5, 0,
	HB_P_PUSHSTATIC, 1, 0,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHLOCALNEAR, 2,
	HB_P_PUSHSTRSHORT, 8,
	'n', 'L', 'a', 's', 't', 'O', 'p', 0, 
	HB_P_ARRAYGEN, 1, 0,
	HB_P_FALSE,
	HB_P_FALSE,
	HB_P_SENDSHORT, 6,
	HB_P_POP,
	HB_P_LINEOFFSET, 5,
	HB_P_MESSAGE, 5, 0,
	HB_P_PUSHSTATIC, 1, 0,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHLOCALNEAR, 2,
	HB_P_PUSHSTRSHORT, 8,
	'c', 'B', 'u', 'f', 'f', 'e', 'r', 0, 
	HB_P_ARRAYGEN, 1, 0,
	HB_P_FALSE,
	HB_P_FALSE,
	HB_P_SENDSHORT, 6,
	HB_P_POP,
	HB_P_LINEOFFSET, 6,
	HB_P_MESSAGE, 5, 0,
	HB_P_PUSHSTATIC, 1, 0,
	HB_P_PUSHNIL,
	HB_P_PUSHNIL,
	HB_P_PUSHLOCALNEAR, 2,
	HB_P_PUSHSTRSHORT, 10,
	'n', 'R', 'e', 'a', 'd', 'S', 'i', 'z', 'e', 0, 
	HB_P_ARRAYGEN, 1, 0,
	HB_P_FALSE,
	HB_P_FALSE,
	HB_P_SENDSHORT, 6,
	HB_P_POP,
	HB_P_LINEOFFSET, 9,
	HB_P_MESSAGE, 6, 0,
	HB_P_PUSHSTATIC, 1, 0,
	HB_P_PUSHSTRSHORT, 4,
	'N', 'e', 'w', 0, 
	HB_P_PUSHSYMNEAR, 7,
	HB_P_FUNCPTR,
	HB_P_PUSHLOCALNEAR, 2,
	HB_P_FALSE,
	HB_P_SENDSHORT, 4,
	HB_P_POP,
	HB_P_LINEOFFSET, 10,
	HB_P_MESSAGE, 6, 0,
	HB_P_PUSHSTATIC, 1, 0,
	HB_P_PUSHSTRSHORT, 5,
	'O', 'p', 'e', 'n', 0, 
	HB_P_PUSHSYMNEAR, 8,
	HB_P_FUNCPTR,
	HB_P_PUSHLOCALNEAR, 2,
	HB_P_FALSE,
	HB_P_SENDSHORT, 4,
	HB_P_POP,
	HB_P_LINEOFFSET, 11,
	HB_P_MESSAGE, 6, 0,
	HB_P_PUSHSTATIC, 1, 0,
	HB_P_PUSHSTRSHORT, 6,
	'C', 'l', 'o', 's', 'e', 0, 
	HB_P_PUSHSYMNEAR, 9,
	HB_P_FUNCPTR,
	HB_P_PUSHLOCALNEAR, 2,
	HB_P_FALSE,
	HB_P_SENDSHORT, 4,
	HB_P_POP,
	HB_P_LINEOFFSET, 12,
	HB_P_MESSAGE, 6, 0,
	HB_P_PUSHSTATIC, 1, 0,
	HB_P_PUSHSTRSHORT, 9,
	'R', 'e', 'a', 'd', 'L', 'i', 'n', 'e', 0, 
	HB_P_PUSHSYMNEAR, 10,
	HB_P_FUNCPTR,
	HB_P_PUSHLOCALNEAR, 2,
	HB_P_FALSE,
	HB_P_SENDSHORT, 4,
	HB_P_POP,
	HB_P_LINEOFFSET, 13,
	HB_P_MESSAGE, 6, 0,
	HB_P_PUSHSTATIC, 1, 0,
	HB_P_PUSHSTRSHORT, 5,
	'N', 'a', 'm', 'e', 0, 
	HB_P_PUSHSYMNEAR, 11,
	HB_P_FUNCPTR,
	HB_P_PUSHLOCALNEAR, 2,
	HB_P_FALSE,
	HB_P_SENDSHORT, 4,
	HB_P_POP,
	HB_P_LINEOFFSET, 14,
	HB_P_MESSAGE, 6, 0,
	HB_P_PUSHSTATIC, 1, 0,
	HB_P_PUSHSTRSHORT, 7,
	'I', 's', 'O', 'p', 'e', 'n', 0, 
	HB_P_PUSHSYMNEAR, 12,
	HB_P_FUNCPTR,
	HB_P_PUSHLOCALNEAR, 2,
	HB_P_FALSE,
	HB_P_SENDSHORT, 4,
	HB_P_POP,
	HB_P_LINEOFFSET, 15,
	HB_P_MESSAGE, 6, 0,
	HB_P_PUSHSTATIC, 1, 0,
	HB_P_PUSHSTRSHORT, 11,
	'M', 'o', 'r', 'e', 'T', 'o', 'R', 'e', 'a', 'd', 0, 
	HB_P_PUSHSYMNEAR, 13,
	HB_P_FUNCPTR,
	HB_P_PUSHLOCALNEAR, 2,
	HB_P_FALSE,
	HB_P_SENDSHORT, 4,
	HB_P_POP,
	HB_P_LINEOFFSET, 16,
	HB_P_MESSAGE, 6, 0,
	HB_P_PUSHSTATIC, 1, 0,
	HB_P_PUSHSTRSHORT, 6,
	'E', 'r', 'r', 'o', 'r', 0, 
	HB_P_PUSHSYMNEAR, 14,
	HB_P_FUNCPTR,
	HB_P_PUSHLOCALNEAR, 2,
	HB_P_FALSE,
	HB_P_SENDSHORT, 4,
	HB_P_POP,
	HB_P_LINEOFFSET, 17,
	HB_P_MESSAGE, 6, 0,
	HB_P_PUSHSTATIC, 1, 0,
	HB_P_PUSHSTRSHORT, 8,
	'E', 'r', 'r', 'o', 'r', 'N', 'o', 0, 
	HB_P_PUSHSYMNEAR, 15,
	HB_P_FUNCPTR,
	HB_P_PUSHLOCALNEAR, 2,
	HB_P_FALSE,
	HB_P_SENDSHORT, 4,
	HB_P_POP,
	HB_P_LINEOFFSET, 18,
	HB_P_MESSAGE, 6, 0,
	HB_P_PUSHSTATIC, 1, 0,
	HB_P_PUSHSTRSHORT, 9,
	'E', 'r', 'r', 'o', 'r', 'M', 's', 'g', 0, 
	HB_P_PUSHSYMNEAR, 16,
	HB_P_FUNCPTR,
	HB_P_PUSHLOCALNEAR, 2,
	HB_P_FALSE,
	HB_P_SENDSHORT, 4,
	HB_P_POP,
	HB_P_LOCALNEARSETINT, 2, 4, 0,
	HB_P_LINEOFFSET, 22,
	HB_P_MESSAGE, 6, 0,
	HB_P_PUSHSTATIC, 1, 0,
	HB_P_PUSHSTRSHORT, 8,
	'E', 'O', 'L', '_', 'p', 'o', 's', 0, 
	HB_P_PUSHSYMNEAR, 17,
	HB_P_FUNCPTR,
	HB_P_PUSHLOCALNEAR, 2,
	HB_P_FALSE,
	HB_P_SENDSHORT, 4,
	HB_P_POP,
	HB_P_MESSAGE, 18, 0,
	HB_P_PUSHSTATIC, 1, 0,
	HB_P_SENDSHORT, 0,
	HB_P_POP,
	HB_P_PUSHSYMNEAR, 19,
	HB_P_PUSHNIL,
	HB_P_MESSAGE, 20, 0,
	HB_P_PUSHSTATIC, 1, 0,
	HB_P_SENDSHORT, 0,
	HB_P_FUNCTIONSHORT, 1,
	HB_P_POPLOCALNEAR, 1,
	HB_P_PUSHSYMNEAR, 21,
	HB_P_PUSHNIL,
	HB_P_PUSHLOCALNEAR, 1,
	HB_P_PUSHSTRSHORT, 10,
	'I', 'n', 'i', 't', 'C', 'l', 'a', 's', 's', 0, 
	HB_P_FUNCTIONSHORT, 2,
	HB_P_JUMPFALSENEAR, 32,
	HB_P_MESSAGE, 22, 0,
	HB_P_PUSHLOCALNEAR, 1,
	HB_P_PUSHSYMNEAR, 23,
	HB_P_PUSHNIL,
	HB_P_FUNCTIONSHORT, 0,
	HB_P_SENDSHORT, 1,
	HB_P_POP,
	HB_P_JUMPNEAR, 17,
	HB_P_PUSHSYMNEAR, 19,
	HB_P_PUSHNIL,
	HB_P_MESSAGE, 20, 0,
	HB_P_PUSHSTATIC, 1, 0,
	HB_P_SENDSHORT, 0,
	HB_P_FUNCTIONSHORT, 1,
	HB_P_POPLOCALNEAR, 1,
	HB_P_PUSHSYMNEAR, 24,
	HB_P_PUSHNIL,
	HB_P_FUNCTIONSHORT, 0,
	HB_P_ZERO,
	HB_P_GREATER,
	HB_P_JUMPFALSENEAR, 19,
	HB_P_MESSAGE, 25, 0,
	HB_P_PUSHSTATIC, 1, 0,
	HB_P_PUSHLOCALNEAR, 1,
	HB_P_PUSHSYMNEAR, 23,
	HB_P_PUSHNIL,
	HB_P_FUNCTIONSHORT, 0,
	HB_P_SENDSHORT, 2,
	HB_P_RETVALUE,
	HB_P_ENDPROC,
	HB_P_PUSHLOCALNEAR, 1,
	HB_P_RETVALUE,
	HB_P_ENDPROC
   };

   hb_vmExecute( pcode, symbols );
}

HB_FUNC_STATIC( TFILEREAD_NEW )
{
   static const BYTE pcode[] =
   {
	HB_P_FRAME, 1, 2,
	HB_P_PUSHSELF,
	HB_P_POPLOCALNEAR, 3,
	HB_P_BASELINE, 56, 0,
	HB_P_PUSHLOCALNEAR, 2,
	HB_P_PUSHNIL,
	HB_P_EXACTLYEQUAL,
	HB_P_DUPLICATE,
	HB_P_JUMPTRUENEAR, 7,
	HB_P_POP,
	HB_P_PUSHLOCALNEAR, 2,
	HB_P_ONE,
	HB_P_LESS,
	HB_P_JUMPFALSENEAR, 8,
	HB_P_LINEOFFSET, 3,
	HB_P_LOCALNEARSETINT, 2, 0, 16,
	HB_P_LINEOFFSET, 6,
	HB_P_MESSAGE, 26, 0,
	HB_P_PUSHLOCALNEAR, 3,
	HB_P_PUSHLOCALNEAR, 1,
	HB_P_SENDSHORT, 1,
	HB_P_POP,
	HB_P_LINEOFFSET, 7,
	HB_P_MESSAGE, 27, 0,
	HB_P_PUSHLOCALNEAR, 3,
	HB_P_PUSHBYTE, 255,
	HB_P_SENDSHORT, 1,
	HB_P_POP,
	HB_P_LINEOFFSET, 8,
	HB_P_MESSAGE, 28, 0,
	HB_P_PUSHLOCALNEAR, 3,
	HB_P_TRUE,
	HB_P_SENDSHORT, 1,
	HB_P_POP,
	HB_P_LINEOFFSET, 9,
	HB_P_MESSAGE, 29, 0,
	HB_P_PUSHLOCALNEAR, 3,
	HB_P_ZERO,
	HB_P_SENDSHORT, 1,
	HB_P_POP,
	HB_P_LINEOFFSET, 10,
	HB_P_MESSAGE, 30, 0,
	HB_P_PUSHLOCALNEAR, 3,
	HB_P_ONE,
	HB_P_SENDSHORT, 1,
	HB_P_POP,
	HB_P_LINEOFFSET, 11,
	HB_P_MESSAGE, 31, 0,
	HB_P_PUSHLOCALNEAR, 3,
	HB_P_PUSHSTRSHORT, 1,
	0, 
	HB_P_SENDSHORT, 1,
	HB_P_POP,
	HB_P_LINEOFFSET, 12,
	HB_P_MESSAGE, 32, 0,
	HB_P_PUSHLOCALNEAR, 3,
	HB_P_PUSHLOCALNEAR, 2,
	HB_P_SENDSHORT, 1,
	HB_P_POP,
	HB_P_LINEOFFSET, 14,
	HB_P_PUSHLOCALNEAR, 3,
	HB_P_RETVALUE,
	HB_P_ENDPROC
   };

   hb_vmExecute( pcode, symbols );
}

HB_FUNC_STATIC( TFILEREAD_OPEN )
{
   static const BYTE pcode[] =
   {
	HB_P_FRAME, 1, 1,
	HB_P_PUSHSELF,
	HB_P_POPLOCALNEAR, 2,
	HB_P_BASELINE, 74, 0,
	HB_P_MESSAGE, 33, 0,
	HB_P_PUSHLOCALNEAR, 2,
	HB_P_SENDSHORT, 0,
	HB_P_PUSHBYTE, 255,
	HB_P_EXACTLYEQUAL,
	HB_P_JUMPFALSENEAR, 118,
	HB_P_LINEOFFSET, 2,
	HB_P_PUSHLOCALNEAR, 1,
	HB_P_PUSHNIL,
	HB_P_EXACTLYEQUAL,
	HB_P_JUMPFALSENEAR, 8,
	HB_P_LINEOFFSET, 3,
	HB_P_LOCALNEARSETINT, 1, 64, 0,
	HB_P_LINEOFFSET, 5,
	HB_P_MESSAGE, 30, 0,
	HB_P_PUSHLOCALNEAR, 2,
	HB_P_PUSHBYTE, 2,
	HB_P_SENDSHORT, 1,
	HB_P_POP,
	HB_P_LINEOFFSET, 6,
	HB_P_MESSAGE, 27, 0,
	HB_P_PUSHLOCALNEAR, 2,
	HB_P_PUSHSYMNEAR, 34,
	HB_P_PUSHNIL,
	HB_P_MESSAGE, 35, 0,
	HB_P_PUSHLOCALNEAR, 2,
	HB_P_SENDSHORT, 0,
	HB_P_PUSHLOCALNEAR, 1,
	HB_P_FUNCTIONSHORT, 2,
	HB_P_SENDSHORT, 1,
	HB_P_POP,
	HB_P_LINEOFFSET, 7,
	HB_P_MESSAGE, 33, 0,
	HB_P_PUSHLOCALNEAR, 2,
	HB_P_SENDSHORT, 0,
	HB_P_PUSHBYTE, 255,
	HB_P_EXACTLYEQUAL,
	HB_P_JUMPFALSENEAR, 30,
	HB_P_LINEOFFSET, 8,
	HB_P_MESSAGE, 29, 0,
	HB_P_PUSHLOCALNEAR, 2,
	HB_P_PUSHSYMNEAR, 36,
	HB_P_PUSHNIL,
	HB_P_FUNCTIONSHORT, 0,
	HB_P_SENDSHORT, 1,
	HB_P_POP,
	HB_P_LINEOFFSET, 9,
	HB_P_MESSAGE, 28, 0,
	HB_P_PUSHLOCALNEAR, 2,
	HB_P_TRUE,
	HB_P_SENDSHORT, 1,
	HB_P_POP,
	HB_P_JUMPNEAR, 86,
	HB_P_LINEOFFSET, 11,
	HB_P_MESSAGE, 29, 0,
	HB_P_PUSHLOCALNEAR, 2,
	HB_P_ZERO,
	HB_P_SENDSHORT, 1,
	HB_P_POP,
	HB_P_LINEOFFSET, 12,
	HB_P_MESSAGE, 28, 0,
	HB_P_PUSHLOCALNEAR, 2,
	HB_P_FALSE,
	HB_P_SENDSHORT, 1,
	HB_P_POP,
	HB_P_JUMPNEAR, 62,
	HB_P_LINEOFFSET, 16,
	HB_P_PUSHSYMNEAR, 37,
	HB_P_PUSHNIL,
	HB_P_MESSAGE, 33, 0,
	HB_P_PUSHLOCALNEAR, 2,
	HB_P_SENDSHORT, 0,
	HB_P_ZERO,
	HB_P_FUNCTIONSHORT, 2,
	HB_P_ZERO,
	HB_P_EXACTLYEQUAL,
	HB_P_JUMPFALSENEAR, 15,
	HB_P_LINEOFFSET, 17,
	HB_P_MESSAGE, 28, 0,
	HB_P_PUSHLOCALNEAR, 2,
	HB_P_FALSE,
	HB_P_SENDSHORT, 1,
	HB_P_POP,
	HB_P_JUMPNEAR, 17,
	HB_P_LINEOFFSET, 19,
	HB_P_MESSAGE, 29, 0,
	HB_P_PUSHLOCALNEAR, 2,
	HB_P_PUSHSYMNEAR, 36,
	HB_P_PUSHNIL,
	HB_P_FUNCTIONSHORT, 0,
	HB_P_SENDSHORT, 1,
	HB_P_POP,
	HB_P_LINEOFFSET, 21,
	HB_P_MESSAGE, 31, 0,
	HB_P_PUSHLOCALNEAR, 2,
	HB_P_PUSHSTRSHORT, 1,
	0, 
	HB_P_SENDSHORT, 1,
	HB_P_POP,
	HB_P_LINEOFFSET, 24,
	HB_P_PUSHLOCALNEAR, 2,
	HB_P_RETVALUE,
	HB_P_ENDPROC
   };

   hb_vmExecute( pcode, symbols );
}

HB_FUNC_STATIC( TFILEREAD_READLINE )
{
   static const BYTE pcode[] =
   {
	HB_P_FRAME, 3, 0,
	HB_P_PUSHSELF,
	HB_P_POPLOCALNEAR, 1,
	HB_P_BASELINE, 101, 0,
	HB_P_LOCALNEARSETSTR, 2, 1, 0,
	0, 
	HB_P_LINEOFFSET, 3,
	HB_P_MESSAGE, 30, 0,
	HB_P_PUSHLOCALNEAR, 1,
	HB_P_PUSHBYTE, 3,
	HB_P_SENDSHORT, 1,
	HB_P_POP,
	HB_P_LINEOFFSET, 5,
	HB_P_MESSAGE, 33, 0,
	HB_P_PUSHLOCALNEAR, 1,
	HB_P_SENDSHORT, 0,
	HB_P_PUSHBYTE, 255,
	HB_P_EXACTLYEQUAL,
	HB_P_JUMPFALSENEAR, 17,
	HB_P_LINEOFFSET, 6,
	HB_P_MESSAGE, 29, 0,
	HB_P_PUSHLOCALNEAR, 1,
	HB_P_PUSHBYTE, 255,
	HB_P_SENDSHORT, 1,
	HB_P_POP,
	HB_P_JUMP, 79, 1,
	HB_P_LINEOFFSET, 9,
	HB_P_MESSAGE, 38, 0,
	HB_P_PUSHLOCALNEAR, 1,
	HB_P_SENDSHORT, 0,
	HB_P_POPLOCALNEAR, 3,
	HB_P_LINEOFFSET, 10,
	HB_P_FALSE,
	HB_P_PUSHLOCALNEAR, 3,
	HB_P_ZERO,
	HB_P_LESSEQUAL,
	HB_P_DUPLICATE,
	HB_P_JUMPTRUENEAR, 21,
	HB_P_POP,
	HB_P_PUSHLOCALNEAR, 3,
	HB_P_PUSHSYMNEAR, 39,
	HB_P_PUSHNIL,
	HB_P_MESSAGE, 40, 0,
	HB_P_PUSHLOCALNEAR, 1,
	HB_P_SENDSHORT, 0,
	HB_P_FUNCTIONSHORT, 1,
	HB_P_ADDINT, 253, 255,
	HB_P_GREATER,
	HB_P_JUMPFALSENEAR, 11,
	HB_P_POP,
	HB_P_MESSAGE, 41, 0,
	HB_P_PUSHLOCALNEAR, 1,
	HB_P_SENDSHORT, 0,
	HB_P_NOT,
	HB_P_JUMPFALSENEAR, 111,
	HB_P_LINEOFFSET, 15,
	HB_P_PUSHSYMNEAR, 42,
	HB_P_PUSHNIL,
	HB_P_MESSAGE, 33, 0,
	HB_P_PUSHLOCALNEAR, 1,
	HB_P_SENDSHORT, 0,
	HB_P_MESSAGE, 43, 0,
	HB_P_PUSHLOCALNEAR, 1,
	HB_P_SENDSHORT, 0,
	HB_P_FUNCTIONSHORT, 2,
	HB_P_POPLOCALNEAR, 2,
	HB_P_LINEOFFSET, 16,
	HB_P_PUSHSYMNEAR, 44,
	HB_P_PUSHNIL,
	HB_P_PUSHLOCALNEAR, 2,
	HB_P_FUNCTIONSHORT, 1,
	HB_P_JUMPFALSENEAR, 43,
	HB_P_LINEOFFSET, 18,
	HB_P_MESSAGE, 29, 0,
	HB_P_PUSHLOCALNEAR, 1,
	HB_P_PUSHSYMNEAR, 36,
	HB_P_PUSHNIL,
	HB_P_FUNCTIONSHORT, 0,
	HB_P_SENDSHORT, 1,
	HB_P_POP,
	HB_P_LINEOFFSET, 19,
	HB_P_MESSAGE, 45, 0,
	HB_P_PUSHLOCALNEAR, 1,
	HB_P_SENDSHORT, 0,
	HB_P_ZERO,
	HB_P_EXACTLYEQUAL,
	HB_P_JUMPFALSENEAR, 35,
	HB_P_LINEOFFSET, 21,
	HB_P_MESSAGE, 28, 0,
	HB_P_PUSHLOCALNEAR, 1,
	HB_P_TRUE,
	HB_P_SENDSHORT, 1,
	HB_P_POP,
	HB_P_JUMPNEAR, 22,
	HB_P_LINEOFFSET, 25,
	HB_P_MESSAGE, 31, 0,
	HB_P_PUSHLOCALNEAR, 1,
	HB_P_MESSAGE, 40, 0,
	HB_P_PUSHLOCALNEAR, 1,
	HB_P_SENDSHORT, 0,
	HB_P_PUSHLOCALNEAR, 2,
	HB_P_PLUS,
	HB_P_SENDSHORT, 1,
	HB_P_POP,
	HB_P_LINEOFFSET, 28,
	HB_P_MESSAGE, 38, 0,
	HB_P_PUSHLOCALNEAR, 1,
	HB_P_SENDSHORT, 0,
	HB_P_POPLOCALNEAR, 3,
	HB_P_JUMP, 108, 255,
	HB_P_LINEOFFSET, 31,
	HB_P_PUSHLOCALNEAR, 3,
	HB_P_ZERO,
	HB_P_LESSEQUAL,
	HB_P_JUMPFALSENEAR, 29,
	HB_P_LINEOFFSET, 34,
	HB_P_MESSAGE, 40, 0,
	HB_P_PUSHLOCALNEAR, 1,
	HB_P_SENDSHORT, 0,
	HB_P_POPLOCALNEAR, 2,
	HB_P_LINEOFFSET, 35,
	HB_P_MESSAGE, 31, 0,
	HB_P_PUSHLOCALNEAR, 1,
	HB_P_PUSHSTRSHORT, 1,
	0, 
	HB_P_SENDSHORT, 1,
	HB_P_POP,
	HB_P_JUMP, 138, 0,
	HB_P_LINEOFFSET, 38,
	HB_P_PUSHLOCALNEAR, 3,
	HB_P_ONE,
	HB_P_GREATER,
	HB_P_JUMPFALSENEAR, 25,
	HB_P_LINEOFFSET, 40,
	HB_P_PUSHSYMNEAR, 46,
	HB_P_PUSHNIL,
	HB_P_MESSAGE, 40, 0,
	HB_P_PUSHLOCALNEAR, 1,
	HB_P_SENDSHORT, 0,
	HB_P_PUSHLOCALNEAR, 3,
	HB_P_ADDINT, 255, 255,
	HB_P_FUNCTIONSHORT, 2,
	HB_P_POPLOCALNEAR, 2,
	HB_P_JUMPNEAR, 9,
	HB_P_LINEOFFSET, 43,
	HB_P_LOCALNEARSETSTR, 2, 1, 0,
	0, 
	HB_P_LINEOFFSET, 47,
	HB_P_PUSHSYMNEAR, 47,
	HB_P_PUSHNIL,
	HB_P_MESSAGE, 40, 0,
	HB_P_PUSHLOCALNEAR, 1,
	HB_P_SENDSHORT, 0,
	HB_P_PUSHLOCALNEAR, 3,
	HB_P_PUSHBYTE, 3,
	HB_P_FUNCTIONSHORT, 3,
	HB_P_PUSHSTRSHORT, 4,
	13, 13, 10, 0, 
	HB_P_EXACTLYEQUAL,
	HB_P_JUMPFALSENEAR, 10,
	HB_P_LINEOFFSET, 51,
	HB_P_LOCALNEARADDINT, 3, 3, 0,
	HB_P_JUMPNEAR, 40,
	HB_P_LINEOFFSET, 52,
	HB_P_PUSHSYMNEAR, 47,
	HB_P_PUSHNIL,
	HB_P_MESSAGE, 40, 0,
	HB_P_PUSHLOCALNEAR, 1,
	HB_P_SENDSHORT, 0,
	HB_P_PUSHLOCALNEAR, 3,
	HB_P_PUSHBYTE, 2,
	HB_P_FUNCTIONSHORT, 3,
	HB_P_PUSHSTRSHORT, 3,
	13, 10, 0, 
	HB_P_EXACTLYEQUAL,
	HB_P_JUMPFALSENEAR, 10,
	HB_P_LINEOFFSET, 54,
	HB_P_LOCALNEARADDINT, 3, 2, 0,
	HB_P_JUMPNEAR, 6,
	HB_P_LINEOFFSET, 57,
	HB_P_LOCALNEARINC, 3,
	HB_P_LINEOFFSET, 59,
	HB_P_MESSAGE, 31, 0,
	HB_P_PUSHLOCALNEAR, 1,
	HB_P_PUSHSYMNEAR, 47,
	HB_P_PUSHNIL,
	HB_P_MESSAGE, 40, 0,
	HB_P_PUSHLOCALNEAR, 1,
	HB_P_SENDSHORT, 0,
	HB_P_PUSHLOCALNEAR, 3,
	HB_P_FUNCTIONSHORT, 2,
	HB_P_SENDSHORT, 1,
	HB_P_POP,
	HB_P_LINEOFFSET, 63,
	HB_P_PUSHLOCALNEAR, 2,
	HB_P_RETVALUE,
	HB_P_ENDPROC
   };

   hb_vmExecute( pcode, symbols );
}

HB_FUNC_STATIC( TFILEREAD_EOL_POS )
{
   static const BYTE pcode[] =
   {
	HB_P_FRAME, 4, 0,
	HB_P_PUSHSELF,
	HB_P_POPLOCALNEAR, 1,
	HB_P_BASELINE, 170, 0,
	HB_P_PUSHSYMNEAR, 48,
	HB_P_PUSHNIL,
	HB_P_PUSHSTRSHORT, 2,
	13, 0, 
	HB_P_MESSAGE, 40, 0,
	HB_P_PUSHLOCALNEAR, 1,
	HB_P_SENDSHORT, 0,
	HB_P_FUNCTIONSHORT, 2,
	HB_P_POPLOCALNEAR, 2,
	HB_P_LINEOFFSET, 1,
	HB_P_PUSHSYMNEAR, 48,
	HB_P_PUSHNIL,
	HB_P_PUSHSTRSHORT, 2,
	10, 0, 
	HB_P_MESSAGE, 40, 0,
	HB_P_PUSHLOCALNEAR, 1,
	HB_P_SENDSHORT, 0,
	HB_P_FUNCTIONSHORT, 2,
	HB_P_POPLOCALNEAR, 3,
	HB_P_LINEOFFSET, 3,
	HB_P_PUSHLOCALNEAR, 2,
	HB_P_ZERO,
	HB_P_EXACTLYEQUAL,
	HB_P_JUMPFALSENEAR, 10,
	HB_P_LINEOFFSET, 5,
	HB_P_PUSHLOCALNEAR, 3,
	HB_P_POPLOCALNEAR, 4,
	HB_P_JUMPNEAR, 31,
	HB_P_LINEOFFSET, 6,
	HB_P_PUSHLOCALNEAR, 3,
	HB_P_ZERO,
	HB_P_EXACTLYEQUAL,
	HB_P_JUMPFALSENEAR, 10,
	HB_P_LINEOFFSET, 8,
	HB_P_PUSHLOCALNEAR, 2,
	HB_P_POPLOCALNEAR, 4,
	HB_P_JUMPNEAR, 15,
	HB_P_LINEOFFSET, 11,
	HB_P_PUSHSYMNEAR, 49,
	HB_P_PUSHNIL,
	HB_P_PUSHLOCALNEAR, 2,
	HB_P_PUSHLOCALNEAR, 3,
	HB_P_FUNCTIONSHORT, 2,
	HB_P_POPLOCALNEAR, 4,
	HB_P_LINEOFFSET, 14,
	HB_P_PUSHLOCALNEAR, 4,
	HB_P_RETVALUE,
	HB_P_ENDPROC
   };

   hb_vmExecute( pcode, symbols );
}

HB_FUNC_STATIC( TFILEREAD_CLOSE )
{
   static const BYTE pcode[] =
   {
	HB_P_FRAME, 1, 0,
	HB_P_PUSHSELF,
	HB_P_POPLOCALNEAR, 1,
	HB_P_BASELINE, 188, 0,
	HB_P_MESSAGE, 30, 0,
	HB_P_PUSHLOCALNEAR, 1,
	HB_P_PUSHBYTE, 4,
	HB_P_SENDSHORT, 1,
	HB_P_POP,
	HB_P_LINEOFFSET, 1,
	HB_P_MESSAGE, 28, 0,
	HB_P_PUSHLOCALNEAR, 1,
	HB_P_TRUE,
	HB_P_SENDSHORT, 1,
	HB_P_POP,
	HB_P_LINEOFFSET, 3,
	HB_P_MESSAGE, 33, 0,
	HB_P_PUSHLOCALNEAR, 1,
	HB_P_SENDSHORT, 0,
	HB_P_PUSHBYTE, 255,
	HB_P_EXACTLYEQUAL,
	HB_P_JUMPFALSENEAR, 16,
	HB_P_LINEOFFSET, 5,
	HB_P_MESSAGE, 29, 0,
	HB_P_PUSHLOCALNEAR, 1,
	HB_P_PUSHBYTE, 255,
	HB_P_SENDSHORT, 1,
	HB_P_POP,
	HB_P_JUMPNEAR, 54,
	HB_P_LINEOFFSET, 8,
	HB_P_PUSHSYMNEAR, 50,
	HB_P_PUSHNIL,
	HB_P_MESSAGE, 33, 0,
	HB_P_PUSHLOCALNEAR, 1,
	HB_P_SENDSHORT, 0,
	HB_P_DOSHORT, 1,
	HB_P_LINEOFFSET, 9,
	HB_P_MESSAGE, 29, 0,
	HB_P_PUSHLOCALNEAR, 1,
	HB_P_PUSHSYMNEAR, 36,
	HB_P_PUSHNIL,
	HB_P_FUNCTIONSHORT, 0,
	HB_P_SENDSHORT, 1,
	HB_P_POP,
	HB_P_LINEOFFSET, 10,
	HB_P_MESSAGE, 27, 0,
	HB_P_PUSHLOCALNEAR, 1,
	HB_P_PUSHBYTE, 255,
	HB_P_SENDSHORT, 1,
	HB_P_POP,
	HB_P_LINEOFFSET, 11,
	HB_P_MESSAGE, 28, 0,
	HB_P_PUSHLOCALNEAR, 1,
	HB_P_TRUE,
	HB_P_SENDSHORT, 1,
	HB_P_POP,
	HB_P_LINEOFFSET, 14,
	HB_P_PUSHLOCALNEAR, 1,
	HB_P_RETVALUE,
	HB_P_ENDPROC
   };

   hb_vmExecute( pcode, symbols );
}

HB_FUNC_STATIC( TFILEREAD_NAME )
{
   static const BYTE pcode[] =
   {
	HB_P_FRAME, 1, 0,
	HB_P_PUSHSELF,
	HB_P_POPLOCALNEAR, 1,
	HB_P_BASELINE, 206, 0,
	HB_P_MESSAGE, 35, 0,
	HB_P_PUSHLOCALNEAR, 1,
	HB_P_SENDSHORT, 0,
	HB_P_RETVALUE,
	HB_P_ENDPROC
   };

   hb_vmExecute( pcode, symbols );
}

HB_FUNC_STATIC( TFILEREAD_ISOPEN )
{
   static const BYTE pcode[] =
   {
	HB_P_FRAME, 1, 0,
	HB_P_PUSHSELF,
	HB_P_POPLOCALNEAR, 1,
	HB_P_BASELINE, 210, 0,
	HB_P_MESSAGE, 33, 0,
	HB_P_PUSHLOCALNEAR, 1,
	HB_P_SENDSHORT, 0,
	HB_P_PUSHBYTE, 255,
	HB_P_NOTEQUAL,
	HB_P_RETVALUE,
	HB_P_ENDPROC
   };

   hb_vmExecute( pcode, symbols );
}

HB_FUNC_STATIC( TFILEREAD_MORETOREAD )
{
   static const BYTE pcode[] =
   {
	HB_P_FRAME, 1, 0,
	HB_P_PUSHSELF,
	HB_P_POPLOCALNEAR, 1,
	HB_P_BASELINE, 215, 0,
	HB_P_MESSAGE, 41, 0,
	HB_P_PUSHLOCALNEAR, 1,
	HB_P_SENDSHORT, 0,
	HB_P_NOT,
	HB_P_DUPLICATE,
	HB_P_JUMPTRUENEAR, 16,
	HB_P_POP,
	HB_P_PUSHSYMNEAR, 44,
	HB_P_PUSHNIL,
	HB_P_MESSAGE, 40, 0,
	HB_P_PUSHLOCALNEAR, 1,
	HB_P_SENDSHORT, 0,
	HB_P_FUNCTIONSHORT, 1,
	HB_P_NOT,
	HB_P_RETVALUE,
	HB_P_ENDPROC
   };

   hb_vmExecute( pcode, symbols );
}

HB_FUNC_STATIC( TFILEREAD_ERROR )
{
   static const BYTE pcode[] =
   {
	HB_P_FRAME, 1, 0,
	HB_P_PUSHSELF,
	HB_P_POPLOCALNEAR, 1,
	HB_P_BASELINE, 219, 0,
	HB_P_MESSAGE, 45, 0,
	HB_P_PUSHLOCALNEAR, 1,
	HB_P_SENDSHORT, 0,
	HB_P_ZERO,
	HB_P_NOTEQUAL,
	HB_P_RETVALUE,
	HB_P_ENDPROC
   };

   hb_vmExecute( pcode, symbols );
}

HB_FUNC_STATIC( TFILEREAD_ERRORNO )
{
   static const BYTE pcode[] =
   {
	HB_P_FRAME, 1, 0,
	HB_P_PUSHSELF,
	HB_P_POPLOCALNEAR, 1,
	HB_P_BASELINE, 223, 0,
	HB_P_MESSAGE, 45, 0,
	HB_P_PUSHLOCALNEAR, 1,
	HB_P_SENDSHORT, 0,
	HB_P_RETVALUE,
	HB_P_ENDPROC
   };

   hb_vmExecute( pcode, symbols );
}

HB_FUNC_STATIC( TFILEREAD_ERRORMSG )
{
   static const BYTE pcode[] =
   {
	HB_P_FRAME, 3, 1,
	HB_P_SFRAME, 55, 0,
	HB_P_PUSHSELF,
	HB_P_POPLOCALNEAR, 2,
	HB_P_BASELINE, 231, 0,
	HB_P_MESSAGE, 45, 0,
	HB_P_PUSHLOCALNEAR, 2,
	HB_P_SENDSHORT, 0,
	HB_P_ZERO,
	HB_P_EXACTLYEQUAL,
	HB_P_JUMPFALSENEAR, 52,
	HB_P_LINEOFFSET, 2,
	HB_P_PUSHSTRSHORT, 34,
	'N', 'o', ' ', 'e', 'r', 'r', 'o', 'r', 's', ' ', 'h', 'a', 'v', 'e', ' ', 'b', 'e', 'e', 'n', ' ', 'r', 'e', 'c', 'o', 'r', 'd', 'e', 'd', ' ', 'f', 'o', 'r', ' ', 0, 
	HB_P_MESSAGE, 35, 0,
	HB_P_PUSHLOCALNEAR, 2,
	HB_P_SENDSHORT, 0,
	HB_P_PLUS,
	HB_P_POPLOCALNEAR, 3,
	HB_P_JUMPNEAR, 119,
	HB_P_LINEOFFSET, 5,
	HB_P_MESSAGE, 51, 0,
	HB_P_PUSHLOCALNEAR, 2,
	HB_P_SENDSHORT, 0,
	HB_P_ONE,
	HB_P_LESS,
	HB_P_DUPLICATE,
	HB_P_JUMPTRUENEAR, 13,
	HB_P_POP,
	HB_P_MESSAGE, 51, 0,
	HB_P_PUSHLOCALNEAR, 2,
	HB_P_SENDSHORT, 0,
	HB_P_PUSHBYTE, 4,
	HB_P_GREATER,
	HB_P_JUMPFALSENEAR, 10,
	HB_P_LINEOFFSET, 6,
	HB_P_LOCALNEARSETINT, 4, 1, 0,
	HB_P_JUMPNEAR, 16,
	HB_P_LINEOFFSET, 8,
	HB_P_MESSAGE, 51, 0,
	HB_P_PUSHLOCALNEAR, 2,
	HB_P_SENDSHORT, 0,
	HB_P_ADDINT, 1, 0,
	HB_P_POPLOCALNEAR, 4,
	HB_P_LINEOFFSET, 10,
	HB_P_PUSHSYMNEAR, 44,
	HB_P_PUSHNIL,
	HB_P_PUSHLOCALNEAR, 1,
	HB_P_FUNCTIONSHORT, 1,
	HB_P_JUMPFALSENEAR, 7,
	HB_P_PUSHSTRSHORT, 1,
	0, 
	HB_P_JUMPNEAR, 4,
	HB_P_PUSHLOCALNEAR, 1,
	HB_P_PUSHSTRSHORT, 7,
	'E', 'r', 'r', 'o', 'r', ' ', 0, 
	HB_P_PLUS,
	HB_P_PUSHSYMNEAR, 52,
	HB_P_PUSHNIL,
	HB_P_MESSAGE, 45, 0,
	HB_P_PUSHLOCALNEAR, 2,
	HB_P_SENDSHORT, 0,
	HB_P_FUNCTIONSHORT, 1,
	HB_P_PLUS,
	HB_P_PUSHSTRSHORT, 2,
	' ', 0, 
	HB_P_PLUS,
	HB_P_PUSHSTATIC, 2, 0,
	HB_P_PUSHLOCALNEAR, 4,
	HB_P_ARRAYPUSH,
	HB_P_PLUS,
	HB_P_PUSHSTRSHORT, 2,
	' ', 0, 
	HB_P_PLUS,
	HB_P_MESSAGE, 35, 0,
	HB_P_PUSHLOCALNEAR, 2,
	HB_P_SENDSHORT, 0,
	HB_P_PLUS,
	HB_P_POPLOCALNEAR, 3,
	HB_P_LINEOFFSET, 13,
	HB_P_PUSHLOCALNEAR, 3,
	HB_P_RETVALUE,
	HB_P_ENDPROC
   };

   hb_vmExecute( pcode, symbols );
}

HB_FUNC( HB_NTOS )
{
   static const BYTE pcode[] =
   {
	HB_P_FRAME, 0, 1,
	HB_P_PUSHSYMNEAR, 53,
	HB_P_PUSHNIL,
	HB_P_PUSHSYMNEAR, 54,
	HB_P_PUSHNIL,
	HB_P_PUSHLOCALNEAR, 1,
	HB_P_FUNCTIONSHORT, 1,
	HB_P_FUNCTIONSHORT, 1,
	HB_P_RETVALUE,
	HB_P_ENDPROC
   };

   hb_vmExecute( pcode, symbols );
}

HB_FUNC_INITSTATICS()
{
   static const BYTE pcode[] =
   {
	HB_P_STATICS, 55, 0, 2, 0,
	HB_P_SFRAME, 55, 0,
	HB_P_PUSHSTRSHORT, 3,
	'o', 'n', 0, 
	HB_P_PUSHSTRSHORT, 20,
	'c', 'r', 'e', 'a', 't', 'i', 'n', 'g', ' ', 'o', 'b', 'j', 'e', 'c', 't', ' ', 'f', 'o', 'r', 0, 
	HB_P_PUSHSTRSHORT, 8,
	'o', 'p', 'e', 'n', 'i', 'n', 'g', 0, 
	HB_P_PUSHSTRSHORT, 13,
	'r', 'e', 'a', 'd', 'i', 'n', 'g', ' ', 'f', 'r', 'o', 'm', 0, 
	HB_P_PUSHSTRSHORT, 8,
	'c', 'l', 'o', 's', 'i', 'n', 'g', 0, 
	HB_P_ARRAYGEN, 5, 0,
	HB_P_POPSTATIC, 2, 0,
	HB_P_ENDPROC
   };

   hb_vmExecute( pcode, symbols );
}

