/*

   Test TFileRead
   
   Main purpose of this program is test of TFileRead() function / class of Harbour.

   For that goal, the program attempt a "File Copy" process by using TFileRead() 
   function / class of Harbour.

   For detailed description of TFileRead() look at TFileRead.txt.
   
   Author : Bicahi Esgici
   
   May 2013

   Sample build script :
   
      c:\harbour\bin\hbmk2 Test_TFR -lhbmisc 
   
*/

#include "fileio.ch"

PROCEDURE Main( cInFile, cOutFile )

   LOCAL oFile := TFileRead():New( cInFile ),;
         lContinue := .F.
   
   SetMode( 25, 80 )
   
   IF !EMPTY( cInFile )
      
      IF !EMPTY( cOutFile ) 
         
         IF FILE( cOutFile )
            lContinue := ( ALERT( cOutFile + " Output file EXIST; Overwrite ?",;
                                  { "Yes, Overwrite", "No, exit" } ) = 1 )
         ELSE
            lContinue := .T.
         ENDIF FILE( cOutFile )
         
         IF lContinue
            SET ALTE TO ( cOutFile )
            SET ALTE ON
            IF FILE( cInFile )
               oFile:Open()
               
               IF oFile:Error()
                  QOUT( oFile:ErrorMsg( "FileRead: " ) )
               ELSE
                  WHILE oFile:MoreToRead()
                     QOUT( oFile:ReadLine() )
                  END WHILE
                  oFile:Close()
               END IF
            ELSE
               ALERT( cInFile + " file not found." )
            ENDIF FILE( cInFile )
            SET ALTE OFF
            SET ALTE TO
            
         ENDIF lContinue
         
      ELSE
         ALERT( " Output file not specified." )
      ENDIF !EMPTY( cOutFile )
   ELSE
      ALERT( " Input file not specified."  )
   ENDIF !EMPTY( cInFile )
   
RETURN // TFileRead.Main()  

