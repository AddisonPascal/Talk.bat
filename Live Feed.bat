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
goto talk
