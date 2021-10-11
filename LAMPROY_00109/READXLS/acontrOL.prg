FOR i = 1 TO LEN( oDlg:aControls )
    IF UPPER( oDlg:aControls[ i ]:ClassName() ) = "TGET"
        // You found one more GET in oDlg:aControls[ i ]
        // Do what you need with it
    ENDIF
NEXT

