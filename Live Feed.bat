:: Made by Addison Djatschenko

@echo off
title Current Feed
cls
goto talk

:createLogfile
(
@echo off
echo At %time%, %date%, messages.txt was created. 
)>messages.txt

:talk
if not exist "%~dp0/messages.txt" (
call :createLogfile
)
cls
type "%~dp0/messages.txt"
timeout /t 5 >nul
if not exist "%~dp0message.txt" goto talk
(
@echo off
type "%~dp0/messages.txt"
echo. 
echo. 
type "%~dp0/message.txt"
echo. 
)>messages2.txt
del "%~dp0/messages.txt"
ren "%~dp0/messages2.txt" "messages.txt"
del "%~dp0message.txt"
goto talk
