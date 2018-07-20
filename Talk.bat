:: Made by Addison Djatschenko

@echo off
mode 1000
title Talk.bat
echo Your Name: 
set /p userName= "-->"
title Talk.bat - Type "exit" to exit - Leave blank or type "update" to update.
cls
if not exist "%~dp0/messages.txt" (
goto createLogfile
)
(
@echo off
type "%~dp0/messages.txt"
echo. 
echo. 
echo %userName%, on %computername%, on %time%, %date% joined messages.txt. 
)>messages2.txt
del "%~dp0/messages.txt"
ren "%~dp0/messages2.txt" "messages.txt"
goto talk

:createLogfile
(
@echo off
echo At %time%, %date%, messages.txt was created. 
echo. 
echo. 
echo %userName%, on %computername%, on %time%, %date% joined messages.txt. 
)>messages.txt

:talk
cls
type "%~dp0/messages.txt"
echo. 
set tlk=update
set /p tlk= "%userName%: "
if "%tlk%"=="update" goto talk
if "%tlk%"=="exit" goto exit
goto saveConversation

:saveConversation
(
@echo off
type "%~dp0/messages.txt"
echo. 
echo. 
echo %userName%, on %computername%, on %time%, %date%:
echo "%tlk%"
)>messages2.txt
del "%~dp0/messages.txt"
ren "%~dp0/messages2.txt" "messages.txt"
goto talk

:exit
cls
(
@echo off
type "%~dp0/messages.txt"
echo. 
echo. 
echo %userName%, on %computername%, on %time%, %date% left messages.txt. 
)>messages2.txt
del "%~dp0/messages.txt"
ren "%~dp0/messages2.txt" "messages.txt"


::This allows 2 people on the same network to communicate. 
