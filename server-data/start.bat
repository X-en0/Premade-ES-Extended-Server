@ECHO OFF
:choice
set /P c=Would you like to lelete your sevrer cache?[Y/N]?
if /I "%c%" EQU "Y" goto :somewhere
if /I "%c%" EQU "N" goto :somewhere_else
goto :choice
:somewhere
echo "Deleting server cache"
rd /s /q "D:\ESX2\server-data\cache"
echo -
echo ESX 1.2 Server Starter
echo -
start D:\ESX2\FXServer.exe +exec server.cfg
exit
:somewhere_else
echo
@echo off
echo -
echo Server starter by Dan. 
echo -
start D:\ESX2\FXServer.exe +exec server.cfg
exit