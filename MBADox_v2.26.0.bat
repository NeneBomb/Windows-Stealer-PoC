@echo off

rem ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,logo
title MBADox_v2.26.0
color 02
cls
echo ----------------------------------------------------------------------------------------------------------------
:::  __  __ ____    _    ____
::: |  \/  | __ )  / \  |  _ \  ___ _  _
::: | |\/| |  _ \ / _ \ | | | |/ _ \ \/ /
::: | |  | | |_) / ___ \| |_| | (_) >  <
::: |_|  |_|____/_/   \_\____/ \___/_/\_\  v2.26.0

for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo(%%A
echo ----------------------------------------------------------------------------------------------------------------

echo Obteniendo datos del sistema...

rem ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,IP pÃºblica
setlocal

set "url=https://api64.ipify.org?format=json"

for /f "delims=" %%i in ('powershell -command "(Invoke-WebRequest -Uri '%url%').Content"') do (
    set "ip=%%~i"
)

set ip=%ip:~1,-1%

echo %ip% > "%USERPROFILE%\Desktop\Data.txt"
echo -IP Completado. . . . . . . . . . . . . . .: 1/12
endlocal

echo -------------------------------------------------------------------------------------------- >> "%USERPROFILE%\Desktop\Data.txt"
powershell -Command "Get-Volume" >> "%USERPROFILE%\Desktop\Data.txt"
echo -GETVOLUME Completado . . . . . . . . . . .: 2/12
echo -------------------------------------------------------------------------------------------- >> "%USERPROFILE%\Desktop\Data.txt"
echo USERNAME: %USERNAME% >> "%USERPROFILE%\Desktop\Data.txt"
echo -USERNAME COmpletado. . . . . . . . . . . .: 3/12
echo -------------------------------------------------------------------------------------------- >> "%USERPROFILE%\Desktop\Data.txt"
systeminfo >> "%USERPROFILE%\Desktop\Data.txt"
echo -SYSTEMINFO Completado. . . . . . . . . . .: 4/12
echo -------------------------------------------------------------------------------------------- >> "%USERPROFILE%\Desktop\Data.txt"
ipconfig /all >> "%USERPROFILE%\Desktop\Data.txt"
echo -IPCONFIG Completado. . . . . . . . . . . .: 5/12
echo -------------------------------------------------------------------------------------------- >> "%USERPROFILE%\Desktop\Data.txt"
netsh interface ipv4 show config >> "%USERPROFILE%\Desktop\Data.txt"
echo -NETSH INTERFACE Completado . . . . . . . .: 6/12
echo -------------------------------------------------------------------------------------------- >> "%USERPROFILE%\Desktop\Data.txt"
netsh winhttp show Proxy >> "%USERPROFILE%\Desktop\Data.txt"
echo -NETSH WINHTTP Completado . . . . . . . . .: 7/12
echo -------------------------------------------------------------------------------------------- >> "%USERPROFILE%\Desktop\Data.txt"
netstat -a >> "%USERPROFILE%\Desktop\Data.txt"
echo -NETSTAT -A Completado. . . . . . . . . . .: 8/12
echo -------------------------------------------------------------------------------------------- >> "%USERPROFILE%\Desktop\Data.txt"
netstat -n >> "%USERPROFILE%\Desktop\Data.txt"
echo -NETSTAT -N Completado. . . . . . . . . . .: 9/12
echo -------------------------------------------------------------------------------------------- >> "%USERPROFILE%\Desktop\Data.txt"
powershell -Command "Get-NetUDPEndpoint" >> "%USERPROFILE%\Desktop\Data.txt"
echo -NETUDPENDPOINT Completado. . . . . . . . .: 10/12
echo -------------------------------------------------------------------------------------------- >> "%USERPROFILE%\Desktop\Data.txt"
arp -a >> "%USERPROFILE%\Desktop\Data.txt"
echo -ARP -A Completado. . . . . . . . . . . . .: 11/12
echo -------------------------------------------------------------------------------------------- >> "%USERPROFILE%\Desktop\Data.txt"
route print >> "%USERPROFILE%\Desktop\Data.txt"
echo -ROUTE PRINT Completado . . . . . . . . . .: 12/12
echo -------------------------------------------------------------------------------------------- >> "%USERPROFILE%\Desktop\Data.txt"

echo Todos los procesos completados.
echo ----------------------------------------------------------------------------------------------------------------

echo Obteniendo direcciones MAC...
getmac /v >> "%USERPROFILE%\Desktop\Data.txt"
if %errorlevel% equ 0 (
    echo Proceso completado.
) else (
    echo Hubo un error al ejecutar el comando.
)
echo ----------------------------------------------------------------------------------------------------------------
@( echo -------------------------------------------------------------------------------------------- ) >> "%USERPROFILE%\Desktop\Data.txt"

rem ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,Ping
set /p "ping1=Por favor, ingrese la IP o dominio al que desea hacer ping (recomendado: google.com): "
echo Haciendo ping a %ping1%...
ping %ping1% >> "%USERPROFILE%\Desktop\Data.txt"
if %errorlevel% equ 0 (
    echo Prueba de ping realizada exitosamente.
) else (
    echo Hubo un error al ejecutar el comando.
)
echo ----------------------------------------------------------------------------------------------------------------
@( echo -------------------------------------------------------------------------------------------- ) >> "%USERPROFILE%\Desktop\Data.txt"

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
@( echo -------------------------------------------------------------------------------------------- ) >> "%USERPROFILE%\Desktop\Data.txt"
@( echo VPN ) >> "%USERPROFILE%\Desktop\Data.txt"
powershell -Command "Get-VpnConnection -AllUserConnection" >> "%USERPROFILE%\Desktop\Data.txt"
if %errorlevel% equ 0 (
    echo Proceso completado.
) else (
    echo Hubo un error al ejecutar el comando.
)

@( echo -------------------------------------------------------------------------------------------- ) >> "%USERPROFILE%\Desktop\Data.txt"
echo ----------------------------------------------------------------------------------------------------------------

echo Obteniendo datos de NETROUTE...
powershell -command Get-NetRoute >> "%USERPROFILE%\Desktop\Data.txt"
echo Proceso completado.
echo ----------------------------------------------------------------------------------------------------------------

rem ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,Datos hardware
echo Obteniendo datos de hardware...
@( echo -------------------------------------------------------------------------------------------- ) >> "%USERPROFILE%\Desktop\Data.txt"
powershell -Command "Get-WmiObject -Class Win32_Processor | Select-Object Name, NumberOfCores, MaxClockSpeed" >> "%USERPROFILE%\Desktop\Data.txt"
echo -PROCESADOR Completado. . . . . . . . . . .: 1/5
@( echo -------------------------------------------------------------------------------------------- ) >> "%USERPROFILE%\Desktop\Data.txt"
powershell -Command "Get-WmiObject -Class Win32_PhysicalMemory | Select-Object Capacity, Manufacturer, PartNumber, Speed" >> "%USERPROFILE%\Desktop\Data.txt"
echo -MEMORIA Completado . . . . . . . . . . . .: 2/5
@( echo -------------------------------------------------------------------------------------------- ) >> "%USERPROFILE%\Desktop\Data.txt"
powershell -Command "Get-WmiObject -Class Win32_DiskDrive | Select-Object Model, Size, MediaType, InterfaceTyped" >> "%USERPROFILE%\Desktop\Data.txt"
echo -ALMACENAMIENTO Completado. . . . . . . . .: 3/5
@( echo -------------------------------------------------------------------------------------------- ) >> "%USERPROFILE%\Desktop\Data.txt"
powershell -Command "Get-WmiObject -Class Win32_VideoController | Select-Object Name, AdapterRAM, DriverVersion" >> "%USERPROFILE%\Desktop\Data.txt"
echo -ADAPTADOR DE PANTALLA Completado . . . . .: 4/5
@( echo -------------------------------------------------------------------------------------------- ) >> "%USERPROFILE%\Desktop\Data.txt"
powershell -Command "Get-WmiObject -Class Win32_BaseBoard | Select-Object Manufacturer, Product, SerialNumber" >> "%USERPROFILE%\Desktop\Data.txt"
echo -PLACA BASE Completado. . . . . . . . . . .: 5/5
@( echo -------------------------------------------------------------------------------------------- ) >> "%USERPROFILE%\Desktop\Data.txt"

echo Todos los procesos completados.
echo ----------------------------------------------------------------------------------------------------------------

rem ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,

echo Obteniendo datos de programas instalados...
wmic product get name, version >> "%USERPROFILE%\Desktop\Data.txt"
echo -WMIC Completado. . . . . . . . . . . . . .: 1/5
@( echo -------------------------------------------------------------------------------------------- ) >> "%USERPROFILE%\Desktop\Data.txt"
reg query HKEY_LOCAL_MACHINE\SOFTWARE >> "%USERPROFILE%\Desktop\Data.txt"
echo -REG QUERY Completado . . . . . . . . . . .: 2/5
@( echo -------------------------------------------------------------------------------------------- ) >> "%USERPROFILE%\Desktop\Data.txt"
dir /a "C:\Program Files" >> "%USERPROFILE%\Desktop\Data.txt"
echo -DIR PROGRAM FILES Completado . . . . . . .: 3/5
@( echo -------------------------------------------------------------------------------------------- ) >> "%USERPROFILE%\Desktop\Data.txt"
dir /a "C:\Program Files (x86)" >> "%USERPROFILE%\Desktop\Data.txt"
echo -DIR PROGRAM FILES (X86) Completado . . . .: 4/5
@( echo -------------------------------------------------------------------------------------------- ) >> "%USERPROFILE%\Desktop\Data.txt"
dir /a "%appdata%" >> "%USERPROFILE%\Desktop\Data.txt"
echo -DIR APPDATA Completado . . . . . . . . . .: 5/5
@( echo -------------------------------------------------------------------------------------------- ) >> "%USERPROFILE%\Desktop\Data.txt"

echo Todos los procesos completados.
echo ----------------------------------------------------------------------------------------------------------------

echo Obteniendo datos de procesos activos... . . . . . . . . . . : 1/7
@( echo Procesos ) >> "%USERPROFILE%\Desktop\Data.txt"
tasklist >> "%USERPROFILE%\Desktop\Data.txt"
echo Proceso completado.
echo ----------------------------------------------------------------------------------------------------------------
@( echo -------------------------------------------------------------------------------------------- ) >> "%USERPROFILE%\Desktop\Data.txt"
echo Obteniendo datos de BIOS... . . . . . . . . . . . . . . . . : 2/7
@( echo BIOS ) >> "%USERPROFILE%\Desktop\Data.txt"
powershell -command Get-WmiObject -Class Win32_BIOS >> "%USERPROFILE%\Desktop\Data.txt"
echo Proceso completado.
echo ----------------------------------------------------------------------------------------------------------------
@( echo -------------------------------------------------------------------------------------------- ) >> "%USERPROFILE%\Desktop\Data.txt"
echo Obteniendo datos de CMDKEY... . . . . . . . . . . . . . . . : 3/7
cmdkey /list >> "%USERPROFILE%\Desktop\Data.txt"
echo Proceso completado.
echo ----------------------------------------------------------------------------------------------------------------
@( echo -------------------------------------------------------------------------------------------- ) >> "%USERPROFILE%\Desktop\Data.txt"
echo Obteniendo fecha y hora... . . . . . . . . . . . . . . . . .: 4/8
echo DATE: %DATE% >> "%USERPROFILE%\Desktop\Data.txt"
echo TIME: %TIME% >> "%USERPROFILE%\Desktop\Data.txt"
echo Proceso completado.
echo ----------------------------------------------------------------------------------------------------------------
@( echo -------------------------------------------------------------------------------------------- ) >> "%USERPROFILE%\Desktop\Data.txt"
echo Obteniendo datos de los servicios en funcionamiento... . . .: 5/8
@( echo RUNNING SERVICES ) >> "%USERPROFILE%\Desktop\Data.txt"
net start >> "%USERPROFILE%\Desktop\Data.txt"
echo Proceso completado.
echo ----------------------------------------------------------------------------------------------------------------
@( echo -------------------------------------------------------------------------------------------- ) >> "%USERPROFILE%\Desktop\Data.txt"
echo Obteniendo datos de los controladores instalados... . . . . : 6/8
@( echo INSTALLED DRIVERS ) >> "%USERPROFILE%\Desktop\Data.txt"
driverquery >> "%USERPROFILE%\Desktop\Data.txt"
echo Proceso completado.
echo ----------------------------------------------------------------------------------------------------------------
@( echo -------------------------------------------------------------------------------------------- ) >> "%USERPROFILE%\Desktop\Data.txt"
echo Obteniendo datos de las cuentas de usuario... . . . . . . . : 7/8
@( echo USER ACCOUNTS ) >> "%USERPROFILE%\Desktop\Data.txt"
net user >> "%USERPROFILE%\Desktop\Data.txt"
echo Proceso completado.
echo ----------------------------------------------------------------------------------------------------------------
@( echo -------------------------------------------------------------------------------------------- ) >> "%USERPROFILE%\Desktop\Data.txt"
echo Obteniendo datos de seguridad locales... . . . . . . . . . .: 8/8
@( echo LOCAL SECURITY ) >> "%USERPROFILE%\Desktop\Data.txt"
secedit /export /cfg "%USERPROFILE%\Desktop\Data.txt"
echo Proceso completado.
echo ----------------------------------------------------------------------------------------------------------------
@( echo -------------------------------------------------------------------------------------------- ) >> "%USERPROFILE%\Desktop\Data.txt"

netstat -ano >> "%USERPROFILE%\Desktop\Data.txt"
echo NETSTAT -ANO Completado. . . . . . . . . . . . . .: 1/4
@( echo -------------------------------------------------------------------------------------------- ) >> "%USERPROFILE%\Desktop\Data.txt"
ver >> "%USERPROFILE%\Desktop\Data.txt"
echo VER Completado . . . . . . . . . . . . . . . . . .: 2/4
@( echo -------------------------------------------------------------------------------------------- ) >> "%USERPROFILE%\Desktop\Data.txt"
net start >> "%USERPROFILE%\Desktop\Data.txt"
echo NET START Completado . . . . . . . . . . . . . . .: 3/4
@( echo -------------------------------------------------------------------------------------------- ) >> "%USERPROFILE%\Desktop\Data.txt"
wevtutil qe Security /c:1 /rd:true /f:text >> "%USERPROFILE%\Desktop\Data.txt"
rem
if %errorlevel% neq 0 (
    echo Hubo un error al ejecutar el comando WEVTUTIL
) else (
    echo WEVTUTIL Completado. . . . . . . . . . . . . . . .: 4/4
)

echo ----------------------------------------------------------------------------------------------------------------
echo Obteniendo datos de controladores de audio...
@( echo AUDIO DRIVERS ) >> "%USERPROFILE%\Desktop\Data.txt"
wmic sounddev get caption, status >> "%USERPROFILE%\Desktop\Data.txt"
echo Proceso completado.
echo ----------------------------------------------------------------------------------------------------------------
@( echo -------------------------------------------------------------------------------------------- ) >> "%USERPROFILE%\Desktop\Data.txt"
echo Obteniendo datos de las cÃ¡maras web...
@( echo WEBCAM ) >> "%USERPROFILE%\Desktop\Data.txt"
wmic path Win32_PnPEntity where "Caption like '%camera%'" get Caption >> "%USERPROFILE%\Desktop\Data.txt"
echo Proceso completado.
echo ----------------------------------------------------------------------------------------------------------------
@( echo -------------------------------------------------------------------------------------------- ) >> "%USERPROFILE%\Desktop\Data.txt"
echo Obteniendo datos de dispositivos de almacenamiento USB conectados...
@( echo CONNECTED USB STORAGE DEVICES ) >> "%USERPROFILE%\Desktop\Data.txt"
wmic logicaldisk where "drivetype=2" get deviceid, volumename, description >> "%USERPROFILE%\Desktop\Data.txt"
echo Proceso completado.
echo ----------------------------------------------------------------------------------------------------------------
@( echo -------------------------------------------------------------------------------------------- ) >> "%USERPROFILE%\Desktop\Data.txt"
echo Obteniendo datos de los controladores de red...
@( echo NETWORK DRIVERS ) >> "%USERPROFILE%\Desktop\Data.txt"
wmic nic get name, speed >> "%USERPROFILE%\Desktop\Data.txt"
echo Proceso completado.
echo ----------------------------------------------------------------------------------------------------------------
@( echo -------------------------------------------------------------------------------------------- ) >> "%USERPROFILE%\Desktop\Data.txt"
echo Obteniendo datos de los controladores de red...
@( echo NETWORK DRIVERS ) >> "%USERPROFILE%\Desktop\Data.txt"
wmic nic get name, speed >> "%USERPROFILE%\Desktop\Data.txt"
echo Proceso completado.
echo ----------------------------------------------------------------------------------------------------------------
@( echo -------------------------------------------------------------------------------------------- ) >> "%USERPROFILE%\Desktop\Data.txt"
echo Obteniendo datos de los dispositivos de almacenamiento extraÃ­bles...
@( echo REMOVABLE STORAGE DEVICES ) >> "%USERPROFILE%\Desktop\Data.txt"
wmic logicaldisk where "drivetype=2" get caption, volumename, size >> "%USERPROFILE%\Desktop\Data.txt"
echo Proceso completado.
echo ----------------------------------------------------------------------------------------------------------------
@( echo -------------------------------------------------------------------------------------------- ) >> "%USERPROFILE%\Desktop\Data.txt"
echo Obteniendo datos de los puertos serie...
@( echo SERIAL PORTS ) >> "%USERPROFILE%\Desktop\Data.txt"
wmic path Win32_SerialPort get DeviceID, Name, MaxBaudRate >> "%USERPROFILE%\Desktop\Data.txt"
echo Proceso completado.
echo ----------------------------------------------------------------------------------------------------------------
@( echo -------------------------------------------------------------------------------------------- ) >> "%USERPROFILE%\Desktop\Data.txt"

rem ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,Mensaje final
echo
echo MBADox_v2.26.0 (05/04/2024)
echo Todos los datos han sido guardados en: %USERPROFILE%\Desktop\Data.txt

pause
