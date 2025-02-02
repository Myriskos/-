/*
   SBMsgEng.prg
   Program to load messages for TSBrowse Multi-Lingual feature
   Author: Manuel Mercado

   Language ID: GRE
   ISO Name...: Greek
   Translator.: Yanni Yannas <letrentis@otenet.gr>
   Country....: Greece
   Date.......: February 22th, 2002
*/

#include "FiveWin.ch"

//--------------------------------------------------------------------------//

Function LoadMsg()

   Local nEle

   Local aMsg := { "���", ;                              // ::aMsg[ 1 ]
                   "���", ;                              // ::aMsg[ 2 ]
                   "� ������� �����������嫘�", ;        // ::aMsg[ 3 ]
                   "�����៞�� �ᢠ", ;                  // ::aMsg[ 4 ]
                   "� ������� ��� ������㟞��", ;       // ::aMsg[ 5 ]
                   "���娜�&�", ;                        // ::aMsg[ 6 ]
                   "����&����� ��㢞�", ;                // ::aMsg[ 7 ]
                   "��&����� ��㢞�", ;                  // ::aMsg[ 8 ]
                   "&����梢��� ��㢞�", ;               // ::aMsg[ 9 ]
                   "�&������� ��㢞�", ;                 // ::aMsg[ 10 ]
                   "��������", ;                         // ::aMsg[ 11 ]
                   "���������", ;                        // ::aMsg[ 12 ]
                   "�������", ;                          // ::aMsg[ 13 ]
                   "�夞�� ���� �� &���", ;             // ::aMsg[ 14 ]
                   "�夞�� &�����", ;                    // ::aMsg[ 15 ]
                   "�夞�� ���� �� &����", ;            // ::aMsg[ 16 ]
                   "�夞�� &��������", ;                 // ::aMsg[ 17 ]
                   "�夞�� ��棜&��", ;                  // ::aMsg[ 18 ]
                   "&�⨩����", ;                        // ::aMsg[ 19 ]
                   "���������:", ;                      // ::aMsg[ 20 ]
                   "���囘:", ;                          // ::aMsg[ 21 ]
                   "���:", ;                             // ::aMsg[ 22 ]
                   "(��������槞��)", ;                  // ::aMsg[ 23 ]
                   "��㢞", ;                            // ::aMsg[ 24 ]
                   "����� �������", ;                    // ::aMsg[ 25 ]
                   "��᫦� ��㢞�", ;                    // ::aMsg[ 26 ]
                   "Tsbrowse SetFilter() � �秦� ����� ��� ��������夜��� ���� �秦 ��� �������� ��� �������妬", ;
                   "�៦�", ;                            // ::aMsg[ 28 ]
                   "�� �����", ;                        // ::aMsg[ 29 ]
                   "��� ��ᨮ��", ;                      // ::aMsg[ 30 ]
                   "��᫦�:", ;                          // ::aMsg[ 31 ]
                   "���� ����⤦�", ;                   // ::aMsg[ 32 ]
                   "����������:", ;                     // ::aMsg[ 33 ]
                   "&�������", ;                         // ::aMsg[ 34 ]
                   "�&��ਫ਼", ;                         // ::aMsg[ 35 ]
                   "&��㟜��", ;                         // ::aMsg[ 36 ]
                   "�������� ������� ;", ;              // ::aMsg[ 37 ]
                   "�������� ������ ;", ;               // ::aMsg[ 38 ]
                   "��������ਫ਼", ;                      // ::aMsg[ 39 ]
                   "� ������� �����������嫘�, ��� ������ �� ���������", ;    // ::aMsg[ 40 ]
                   "�᫞�� [Esc] ��� �� ����驜�� ��� ����������", ;         // ::aMsg[ 41 ]
                   "", ;           // ::aMsg[ 42 ]  (future posible usage)
                   "", ;           // ::aMsg[ 43 ]
                   "", ;           // ::aMsg[ 44 ]
                   "", ;           // ::aMsg[ 45 ]
                   "", ;           // ::aMsg[ 46 ]
                   "", ;           // ::aMsg[ 47 ]
                   "", ;           // ::aMsg[ 48 ]
                   "", ;           // ::aMsg[ 49 ]
                   "" }            // ::aMsg[ 50 ]

   // some conjunctions and prepositions for TSBrowse:Proper() method
   // keep spaces and capitals
   Local aProper := { " �� ", ;     // ::aMsg[ 51 ]
                      " ��� ", ;    // ::aMsg[ 52 ]
                      " �⩘ ", ;   // ::aMsg[ 53 ]
                      " ��� ", ;    // ::aMsg[ 54 ]
                      " � " }       // ::aMsg[ 55 ]

   AEval( aProper, { |e| AAdd( aMsg, e ) } )

   For nEle := 1 To Len( aMsg )
       aMsg[ nEle ] := OemToAnsi( aMsg[ nEle ] )
   Next

Return aMsg
