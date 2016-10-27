@echo off
color cf
setlocal enabledelayedexpansion
title Quick BC SFTP Connect
mode 60,9
set "cmdwidth=60"
:Display
cls
echo.
:start
set "Center=BC Quick Connect Tool!! COOL!" & call :CenterText Center strLen
set "Center=Tool to Quickly Connect to a BC Site via SFTP!! COOL!" & call :CenterText Center strLen
set "Center=Created by Greg Pace @ Chicago Digital" & call :CenterText Center strLen
echo.
set /P url=URL Prefix: 
set /P email=Email: 
powershell -Command $pword = read-host "Password" -AsSecureString ; ^
    $BSTR=[System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($pword) ; ^
        [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR) > .tmp.txt 
set /P password=<.tmp.txt & del .tmp.txt
cd "C:\Program Files\FileZilla FTP Client"
filezilla sftp://%url%.worldsecuresystems.com/%email%:%password%@%url%.worldsecuresystems.com:22
set choice=
echo.
set /p choice="Session Completed"
if '%choice%'=='' exit
:: New CenterText Module
:CenterText
  if not "!%1:~%len%!"=="" set /A len+=1 & goto :CenterText
(endlocal & set %2=%len%)
goto CenterTextDisplay
:AddSpace
set "spaces=%spaces% "
goto :eof
:CenterTextDisplay
set /a "indent=(cmdwidth - strLen)/2" 
set "spaces= "
for /l %%a in (1,1,%indent%) do call :AddSpace
echo %spaces%%Center%
set "len=0"
goto :eof
:: New CenterText Module

exit
