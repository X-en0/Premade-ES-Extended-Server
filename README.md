# Premade ES Extended Server - Credits to KASH XxFri3ndlyxX and FiveEYZ
 Premade ES Extended Server with working Kashacters

 # How to Start

 1. Drag everything from the zip into a folder of your choice. I reccommend on your C Drive
 
 2. Right click the sevrer.zip and click `extract here`

 3. Run the SQL file in the SQL folder to import the database

 4. Go in the `server-data folder` and edit the `start.bat` to your file directory. Ex. `D:\ESX2\` is my server directory.
 ```
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
echo Server starter by Xeno. 
echo -
start D:\ESX2\FXServer.exe +exec server.cfg
exit
```

If my directory was `C:\MyFXServer` the bat file would look like this

```
@ECHO OFF
:choice
set /P c=Would you like to lelete your sevrer cache?[Y/N]?
if /I "%c%" EQU "Y" goto :somewhere
if /I "%c%" EQU "N" goto :somewhere_else
goto :choice
:somewhere
echo "Deleting server cache"
rd /s /q "C:\MyFXServer\server-data\cache"
echo -
echo ESX 1.2 Server Starter
echo -
start C:\MyFXServer\FXServer.exe +exec server.cfg
exit
:somewhere_else
echo
@echo off
echo -
echo Server starter by Xeno. 
echo -
start C:\MyFXServer\FXServer.exe +exec server.cfg
exit

---

# If you need any help reach out on my Discord:
Nano#5316
