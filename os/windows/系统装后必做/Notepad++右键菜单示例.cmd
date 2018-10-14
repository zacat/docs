CD /D "%~dp0"
REG ADD "HKEY_CLASSES_ROOT\*\shell\NotePad++" /ve /t REG_SZ /d "ÓÃ&Notepad++´ò¿ª" /f
REG ADD "HKEY_CLASSES_ROOT\*\shell\NotePad++" /v "Icon" /t REG_SZ /d "\"%CD%\Notepad++.exe\"" /f
REG ADD "HKEY_CLASSES_ROOT\*\shell\NotePad++\Command" /ve /t REG_SZ /d "\"%CD%\notepad++.exe\" \"%%1\""  /f
pause