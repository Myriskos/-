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

   Local aMsg := { "МШх", ;                              // ::aMsg[ 1 ]
                   "Ооа", ;                              // ::aMsg[ 2 ]
                   "Ж ЬЪЪиШну оиЮйагжзжаЬхлШа", ;        // ::aMsg[ 3 ]
                   "ПижйзсЯЮйЬ зсва", ;                  // ::aMsg[ 4 ]
                   "Ж ЬЪЪиШну ЫЬд бШлШориуЯЮбЬ", ;       // ::aMsg[ 5 ]
                   "АдШхиЬй&Ю", ;                        // ::aMsg[ 6 ]
                   "Адла&ЪиШну СлувЮк", ;                // ::aMsg[ 7 ]
                   "Аз&жбжзу СлувЮк", ;                  // ::aMsg[ 8 ]
                   "&ДзабцввЮйЮ СлувЮк", ;               // ::aMsg[ 9 ]
                   "Г&аШЪиШну СлувЮк", ;                 // ::aMsg[ 10 ]
                   "ГаШЪиШну", ;                         // ::aMsg[ 11 ]
                   "АдлаЪиШну", ;                        // ::aMsg[ 12 ]
                   "Азжбжзу", ;                          // ::aMsg[ 13 ]
                   "ЙхдЮйЮ зижк лШ &бслр", ;             // ::aMsg[ 14 ]
                   "ЙхдЮйЮ &ГЬеас", ;                    // ::aMsg[ 15 ]
                   "ЙхдЮйЮ зижк лШ &Ьзсдр", ;            // ::aMsg[ 16 ]
                   "ЙхдЮйЮ &АиайлЬис", ;                 // ::aMsg[ 17 ]
                   "ЙхдЮйЮ ДзцгЬ&дж", ;                  // ::aMsg[ 18 ]
                   "&ЙтийжиШк", ;                        // ::aMsg[ 19 ]
                   "ЖгЬижгЮдхШ:", ;                      // ::aMsg[ 20 ]
                   "СЬвхЫШ:", ;                          // ::aMsg[ 21 ]
                   "ЧиШ:", ;                             // ::aMsg[ 22 ]
                   "(ПижЬзайбцзЮйЮ)", ;                  // ::aMsg[ 23 ]
                   "СлувЮ", ;                            // ::aMsg[ 24 ]
                   "ОиШлу зЬиажоу", ;                    // ::aMsg[ 25 ]
                   "Пвслжк СлувЮк", ;                    // ::aMsg[ 26 ]
                   "Tsbrowse SetFilter() О лчзжк Шмлжк ЫЬд ШдлШзжбихдЬлШа йлжд лчзж лжм бвЬаЫажч лжм ЬмиЬлЮихжм", ;
                   "КсЯжк", ;                            // ::aMsg[ 28 ]
                   "Тж АиоЬхж", ;                        // ::aMsg[ 29 ]
                   "ЫЬд мзсиоЬа", ;                      // ::aMsg[ 30 ]
                   "Пвслжк:", ;                          // ::aMsg[ 31 ]
                   "ПЬЫхж ЙЬагтджм", ;                   // ::aMsg[ 32 ]
                   "ДзЬеЬиЪШйхШ:", ;                     // ::aMsg[ 33 ]
                   "&АзжЫжоу", ;                         // ::aMsg[ 34 ]
                   "А&бчирйЮ", ;                         // ::aMsg[ 35 ]
                   "&БжуЯЬаШ", ;                         // ::aMsg[ 36 ]
                   "ГаШЪиШну ДЪЪиШнук ;", ;              // ::aMsg[ 37 ]
                   "ГаШЪиШну ВиШггук ;", ;               // ::aMsg[ 38 ]
                   "ДзаЩЬЩШхрйЮ", ;                      // ::aMsg[ 39 ]
                   "Ж ЬЪЪиШну оиЮйагжзжаЬхлШа, ЫЬд гзжиЬх дШ бвЬаЫрЯЬх", ;    // ::aMsg[ 40 ]
                   "ПслЮйЬ [Esc] ЪаШ дШ ШбмищйЬак лЮд ЬзЬеЬиЪШйхШ", ;         // ::aMsg[ 41 ]
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
   Local aProper := { " СЬ ", ;     // ::aMsg[ 51 ]
                      " Азж ", ;    // ::aMsg[ 52 ]
                      " ЛтйШ ", ;   // ::aMsg[ 53 ]
                      " ЙШа ", ;    // ::aMsg[ 54 ]
                      " Ж " }       // ::aMsg[ 55 ]

   AEval( aProper, { |e| AAdd( aMsg, e ) } )

   For nEle := 1 To Len( aMsg )
       aMsg[ nEle ] := OemToAnsi( aMsg[ nEle ] )
   Next

Return aMsg
