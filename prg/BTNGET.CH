/*
 * $Id: btnget.ch,v 1.1 2001/09/05 16:53:13 RRamirez Exp $
 */


#xcommand REDEFINE TBTNGET [ <oGet> VAR ] <uVar> ;
             [ ID <nId> ] ;
             [ <dlg: OF, WINDOW, DIALOG> <oDlg> ] ;
             [ <help:HELPID, HELP ID> <nHelpId> ] ;
             [ VALID   <ValidFunc> ]       ;
             [ PICTURE <cPict> ] ;
             [ <color:COLOR,COLORS> <nClrFore> [,<nClrBack>] ] ;
             [ FONT <oFont> ] ;
             [ CURSOR <oCursor> ] ;
             [ MESSAGE <cMsg> ] ;
             [ <update: UPDATE> ] ;
             [ WHEN <uWhen> ] ;
             [ ON CHANGE <uChange> ] ;
             [ <readonly: READONLY, NO MODIFY> ] ;
             [ <spin: SPINNER> [ON UP <SpnUp>] [ON DOWN <SpnDn>] [MIN <Min>] [MAX <Max>] ] ;
             [ <resource: BUTTON NAME, RESNAME, RESOURCE> <cResName> ];
             [ <bact: BUTTON ACTION, ACTION> <uAction> ] ;
       => ;
          [ <oGet> := ] TBtnGet():ReDefine( <nId>, bSETGET(<uVar>), <oDlg>,;
             <nHelpId>, <cPict>, <{ValidFunc}>, <nClrFore>, <nClrBack>,;
             <oFont>, <oCursor>, <cMsg>, <.update.>, <{uWhen}>,;
             [ \{|nKey,nFlags,Self| <uChange> \}], <.readonly.>,;
             <.spin.>, <{SpnUp}>, <{SpnDn}>, <{Min}>, <{Max}>, [<cResName>], ;
            [<{uAction}>])

