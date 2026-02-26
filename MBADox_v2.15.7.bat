@echo off

rem ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,logo
title MBADox_v2.15.7
color 02
cls
echo ----------------------------------------------------------------------------------------------------------------
:::  __  __ ____    _    ____
::: |  \/  | __ )  / \  |  _ \  ___ _  _
::: | |\/| |  _ \ / _ \ | | | |/ _ \ \/ /
::: | |  | | |_) / ___ \| |_| | (_) >  <
::: |_|  |_|____/_/   \_\____/ \___/_/\_\  v2.15.7

for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo(%%A
echo ----------------------------------------------------------------------------------------------------------------

echo Obteniendo datos del sistema...

rem ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,IP pública
setlocal

set "url=https://api64.ipify.org?format=json"

for /f "delims=" %%i in ('powershell -command "(Invoke-WebRequest -Uri '%url%').Content"') do (
    set "ip=%%~i"
)

set ip=%ip:~1,-1%

@( echo %ip% ) > %USERPROFILE%\Desktop\Data.txt
echo -IP Completado. . . . . . . . . . . . . . .: 1/10
endlocal

rem ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,Datos
@( echo -------------------------------------------------------------------------------------------- ) >> %USERPROFILE%\Desktop\Data.txt
powershell -Command "Get-Volume" >> %USERPROFILE%\Desktop\Data.txt
echo -GETVOLUME Completado . . . . . . . . . . .: 2/10
@( echo -------------------------------------------------------------------------------------------- ) >> %USERPROFILE%\Desktop\Data.txt
echo USERNAME: %USERNAME% >> %USERPROFILE%\Desktop\Data.txt
systeminfo >> %USERPROFILE%\Desktop\Data.txt
echo -SYSTEMINFO Completado. . . . . . . . . . .: 3/10
@( echo -------------------------------------------------------------------------------------------- ) >> %USERPROFILE%\Desktop\Data.txt
ipconfig /all >> %USERPROFILE%\Desktop\Data.txt
echo -IPCONFIG Completado. . . . . . . . . . . .: 4/10
@( echo -------------------------------------------------------------------------------------------- ) >> %USERPROFILE%\Desktop\Data.txt
netsh interface ipv4 show config >> %USERPROFILE%\Desktop\Data.txt
@( echo -------------------------------------------------------------------------------------------- ) >> %USERPROFILE%\Desktop\Data.txt
netsh winhttp show Proxy >> %USERPROFILE%\Desktop\Data.txt
echo -NETSH Completado . . . . . . . . . . . . .: 5/10
@( echo -------------------------------------------------------------------------------------------- ) >> %USERPROFILE%\Desktop\Data.txt
netstat -a >> %USERPROFILE%\Desktop\Data.txt
echo -NETSTAT -A Completado. . . . . . . . . . .: 6/10
@( echo -------------------------------------------------------------------------------------------- ) >> %USERPROFILE%\Desktop\Data.txt
netstat -n >> %USERPROFILE%\Desktop\Data.txt
echo -NETSTAT -N Completado. . . . . . . . . . .: 7/10
@( echo -------------------------------------------------------------------------------------------- ) >> %USERPROFILE%\Desktop\Data.txt
powershell -Command "Get-NetUDPEndpoint" >> %USERPROFILE%\Desktop\Data.txt
echo -NETUDPENDPOINT Completado. . . . . . . . .: 8/10
@( echo -------------------------------------------------------------------------------------------- ) >> %USERPROFILE%\Desktop\Data.txt
arp -a >> %USERPROFILE%\Desktop\Data.txt
echo -ARP -A Completado. . . . . . . . . . . . .: 9/10
@( echo -------------------------------------------------------------------------------------------- ) >> %USERPROFILE%\Desktop\Data.txt
route print >> %USERPROFILE%\Desktop\Data.txt
echo -ROUTE PRINT Completado . . . . . . . . . .: 10/10
@( echo -------------------------------------------------------------------------------------------- ) >> %USERPROFILE%\Desktop\Data.txt

echo Todos los procesos completados.
echo ----------------------------------------------------------------------------------------------------------------

echo Obteniendo direcciones MAC...
getmac /v >> %USERPROFILE%\Desktop\Data.txt
if %errorlevel% equ 0 (
    echo Proceso completado.
) else (
    echo Hubo un error al ejecutar el comando.
)
echo ----------------------------------------------------------------------------------------------------------------
@( echo -------------------------------------------------------------------------------------------- ) >> %USERPROFILE%\Desktop\Data.txt

rem ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,Ping
set /p "ping1=Por favor, ingrese la IP o dominio al que desea hacer ping (recomendado: google.com): "
echo Haciendo ping a %ping1%...
ping %ping1% >> %USERPROFILE%\Desktop\Data.txt
if %errorlevel% equ 0 (
    echo Prueba de ping realizada exitosamente.
) else (
    echo Hubo un error al ejecutar el comando.
)
echo ----------------------------------------------------------------------------------------------------------------
@( echo -------------------------------------------------------------------------------------------- ) >> %USERPROFILE%\Desktop\Data.txt

rem ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,Datos wifi
setlocal

:main
set /p "tipo=Por favor, ingrese su tipo de conectividad (lan/wlan): "
echo Obteniendo datos de red e internet...
netsh "%tipo%" show profiles

:profile_input
set /p "profile=Por favor, ingrese un perfil para mostrar sus datos (o escriba 'salir' para salir): "

if /i "%profile%"=="salir" (
    echo Saliendo del programa.
    goto :end
)

netsh "%tipo%" show profile "%profile%" key=clear >> "%USERPROFILE%\Desktop\Data.txt"
if %errorlevel% equ 0 (
    echo Proceso completado.
) else (
    echo Hubo un error al ejecutar el comando.
)

choice /c sn /m "Desea ingresar otro perfil?: "
if errorlevel 2 (
    goto :end
)

goto :main

:end
echo Proceso completado.

echo ----------------------------------------------------------------------------------------------------------------

rem ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,DNS
echo Obteniendo datos de conexiones VPN...
@( echo -------------------------------------------------------------------------------------------- ) >> %USERPROFILE%\Desktop\Data.txt
@( echo VPN ) >> %USERPROFILE%\Desktop\Data.txt
powershell -Command "Get-VpnConnection -AllUserConnection" >> %USERPROFILE%\Desktop\Data.txt
if %errorlevel% equ 0 (
    echo Proceso completado.
) else (
    echo Hubo un error al ejecutar el comando.
)

@( echo -------------------------------------------------------------------------------------------- ) >> %USERPROFILE%\Desktop\Data.txt
echo ----------------------------------------------------------------------------------------------------------------

echo Obteniendo datos de NETROUTE...
powershell -command Get-NetRoute >> %USERPROFILE%\Desktop\Data.txt
echo Proceso completado.
echo ----------------------------------------------------------------------------------------------------------------

rem ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,Datos hardware
echo Obteniendo datos de hardware...
@( echo -------------------------------------------------------------------------------------------- ) >> %USERPROFILE%\Desktop\Data.txt
powershell -Command "Get-WmiObject -Class Win32_Processor | Select-Object Name, NumberOfCores, MaxClockSpeed" >> %USERPROFILE%\Desktop\Data.txt
echo -PROCESADOR Completado. . . . . . . . . . .: 1/5
@( echo -------------------------------------------------------------------------------------------- ) >> %USERPROFILE%\Desktop\Data.txt
powershell -Command "Get-WmiObject -Class Win32_PhysicalMemory | Select-Object Capacity, Manufacturer, PartNumber, Speed" >> %USERPROFILE%\Desktop\Data.txt
echo -MEMORIA Completado . . . . . . . . . . . .: 2/5
@( echo -------------------------------------------------------------------------------------------- ) >> %USERPROFILE%\Desktop\Data.txt
powershell -Command "Get-WmiObject -Class Win32_DiskDrive | Select-Object Model, Size, MediaType, InterfaceTyped" >> %USERPROFILE%\Desktop\Data.txt
echo -ALMACENAMIENTO Completado. . . . . . . . .: 3/5
@( echo -------------------------------------------------------------------------------------------- ) >> %USERPROFILE%\Desktop\Data.txt
powershell -Command "Get-WmiObject -Class Win32_VideoController | Select-Object Name, AdapterRAM, DriverVersion" >> %USERPROFILE%\Desktop\Data.txt
echo -PLACA DE VIDEO Completado. . . . . . . . .: 4/5
@( echo -------------------------------------------------------------------------------------------- ) >> %USERPROFILE%\Desktop\Data.txt
powershell -Command "Get-WmiObject -Class Win32_BaseBoard | Select-Object Manufacturer, Product, SerialNumber" >> %USERPROFILE%\Desktop\Data.txt
echo -PLACA MADRE Completado . . . . . . . . . .: 5/5
@( echo -------------------------------------------------------------------------------------------- ) >> %USERPROFILE%\Desktop\Data.txt

echo Todos los procesos completados.
echo ----------------------------------------------------------------------------------------------------------------

rem ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,Datos programas instalados
echo Obteniendo datos de programas instalados...
wmic product get name, version >> %USERPROFILE%\Desktop\Data.txt
echo -WMIC Completado. . . . . . . . . . . . . .: 1/5
reg query HKEY_LOCAL_MACHINE\SOFTWARE >> %USERPROFILE%\Desktop\Data.txt
echo -REG QUERY Completado . . . . . . . . . . .: 2/5
dir /a "C:\Program Files" >> %USERPROFILE%\Desktop\Data.txt
echo -DIR PROGRAM FILES Completado . . . . . . .: 3/5
dir /a "C:\Program Files (x86)" >> %USERPROFILE%\Desktop\Data.txt
echo -DIR PROGRAM FILES (X86) Completado . . . .: 4/5
dir /a "%appdata%" >> %USERPROFILE%\Desktop\Data.txt
echo -DIR APPDATA Completado . . . . . . . . . .: 5/5
@( echo -------------------------------------------------------------------------------------------- ) >> %USERPROFILE%\Desktop\Data.txt

echo Todos los procesos completados.
echo ----------------------------------------------------------------------------------------------------------------

echo Obteniendo datos de procesos activos...
@( echo Procesos ) >> %USERPROFILE%\Desktop\Data.txt
tasklist >> %USERPROFILE%\Desktop\Data.txt
echo Proceso completado.
echo ----------------------------------------------------------------------------------------------------------------
@( echo -------------------------------------------------------------------------------------------- ) >> %USERPROFILE%\Desktop\Data.txt
echo Obteniendo datos de BIOS...
@( echo BIOS ) >> %USERPROFILE%\Desktop\Data.txt
powershell -command Get-WmiObject -Class Win32_BIOS >> %USERPROFILE%\Desktop\Data.txt
echo Proceso completado.
echo ----------------------------------------------------------------------------------------------------------------
@( echo -------------------------------------------------------------------------------------------- ) >> %USERPROFILE%\Desktop\Data.txt
echo Obteniendo datos de CMDKEY...
cmdkey /list >> %USERPROFILE%\Desktop\Data.txt
echo Proceso completado.
echo ----------------------------------------------------------------------------------------------------------------
@( echo -------------------------------------------------------------------------------------------- ) >> %USERPROFILE%\Desktop\Data.txt

echo Obteniendo fecha y hora...
echo DATE: %DATE% >> %USERPROFILE%\Desktop\Data.txt
echo TIME: %TIME% >> %USERPROFILE%\Desktop\Data.txt
echo Proceso completado.
echo ----------------------------------------------------------------------------------------------------------------

rem ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,Mensaje final
echo Todos los datos han sido guardados en: %USERPROFILE%\Desktop\Data.txt

pause