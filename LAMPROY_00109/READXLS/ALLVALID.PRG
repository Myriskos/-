activate dialog oDlg valid Allvalid(oDlg)

/*
Validates all controls on a dialog. If any control fails, the function
will return false & focus will be given to the offending control.
*/
Function AllValid(oDlg)
local x, lOk := .T.
local nLen := len(oDlg:aControls)

CursorWait()

for x := 1 to nLen
   if !(lOk := oDlg:aControls[x]:lValid())
      oDlg:aControls[x]:SetFocus()
      exit
   endif
next

CursorArrow()
SysRefresh()

Return(lOk)



