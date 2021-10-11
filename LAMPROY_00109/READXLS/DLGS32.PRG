// 32 bits common dialogs from 16 bits apps

#include "FiveWin.ch"

#define INIFILE GetWinDir()+"\rundlg32.ini"

static nFilterIndex := 0

//----------------------------------------------------------------------------//

Function cGetFile32(cFileMask, cTitle, nDefaultMask, cInitDir, lSave, nFlags)

   local cSection, cFile
   local nRet

   DEFAULT lSave := .f.

   // On cGetFile() that parameter is a boolean for long filenames

   if nFlags != Nil .and. Valtype(nFlags) != "N"
      nFlags := Nil
   endif

   if !lSave
      cSection := "GetOpenFileName"
   else
      cSection := "GetSaveFileName"
   endif

   if File(INIFILE)
      Ferase(INIFILE)
   endif

   if cFileMask != Nil
      if "|"$cFileMask
         cFileMask := StrTran(cFileMask, " |", "|")
         cFileMask := StrTran(cFileMask, "| ", "|")
         WritePProString( cSection, "lpstrFilter", cFileMask, INIFILE )
      else
         WritePProString( cSection, "lpstrFile", cFileMask, INIFILE )
      endif
   endif

   if cTitle != Nil
      WritePProString( cSection, "lpstrTitle", cTitle, INIFILE )
   endif

   if nDefaultMask != Nil
      WritePProString( cSection, "nFilterIndex", ltrim(Str(nDefaultMask)), INIFILE )
   endif

   if cInitDir != Nil
      WritePProString( cSection, "lpstrInitialDir", cInitDir, INIFILE )
   endif

   if nFlags != Nil
      WritePProString( cSection, "Flags", ltrim(Str(nFlags)), INIFILE )
   endif

   WritePProString( cSection, "hwndOwner", lTrim(Str( GetActiveWindow()) ),;
                    INIFILE )
   if IsWin2000()
     nRet := WinExec( "rundlg32 "+iif( lSave, "2", "1") )
   else
     nRet := 0
   endif
   if nRet > 21 .or. nRet < 0
      StopUntil( {|| GetPvProfString( cSection, "working", "0", INIFILE ) != "1"} )
      /*while GetPvProfString( cSection, "working", "0", INIFILE ) == "1"
         SysRefresh()
      end*/

      cFile        := GetPvProfString( cSection, "lpstrFile", "", INIFILE )
      nFilterIndex := Val(GetPvProfString( cSection, "nFilterIndex", "", INIFILE ))
   else
       cFile := cGetFile(cFileMask, cTitle, nDefaultMask, cInitDir, lSave,, nFlags)
   endif

   Ferase(INIFILE)

return cFile

//----------------------------------------------------------------------------//

Function nGetFilter32()

Return nFilterIndex

//----------------------------------------------------------------------------//

Function cGetDir32(cTitle)

   local cDir
   local nRet

   if File(INIFILE)
      Ferase(INIFILE)
   endif

   if cTitle != Nil
      WritePProString( "GetDirectory", "lpstrTitle", cTitle, INIFILE )
   endif

   WritePProString( "GetDirectory", "hwndOwner", lTrim(Str( GetActiveWindow()) ),;
                    INIFILE )

   nRet := WinExec( "rundlg32 3" )

   if nRet > 21 .or. nRet < 0
      StopUntil( {|| GetPvProfString( "GetDirectory", "working", "0", INIFILE ) != "1"} )
      /*while GetPvProfString( "GetDirectory", "working", "0", INIFILE ) == "1"
         SysRefresh()
      end*/
      cDir := GetPvProfString( "GetDirectory", "lpstrDirectory", "", INIFILE )
   else
      cDir := cGetDir(cTitle)
   endif

   Ferase(INIFILE)

return cDir

//----------------------------------------------------------------------------//

///FUNCTION IsWin2000() ; RETURN IsWinNT() .and. GetWinVer()[2] == 95

