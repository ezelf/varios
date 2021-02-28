@echo off
title "PROCESS & PORTS"
::cls 
set puerto=%~1
set nl=^& echo.
:: ---------------------------------------------------------- ::
:: Script para identificar relacion entre un puerto tcp/udp
:: y el proceso que lo utiliza.
:: 
:: Uso:    
:: C:\tmp\>pp.bat <port>
:: ---------------------------------------------------------- ::

call %nl%
call %nl% 

echo  //===================================================// 
echo  // Script para identificar relacion entre un puerto  //
echo  // tcp/udp y el proceso que lo utiliza.              //
echo  //===================================================// 

call %nl%
call %nl%

echo  [+] Date: 	  %date%
echo  [+] Time: 	  %time%
call %nl%
echo  [+] Username:    %username%
echo  [+] OS:          %OS% 		(%PROCESSOR_IDENTIFIER%)

echo  [+] Puerto:      %puerto%
for /f "tokens=14" %%i in ('ipconfig ^| findstr "IPv4" ') do @echo  [+] IP Local:    %%i

call %nl%
call %nl%
 
echo ========================= ======== ================ =========== ============ =============== ================================================== ============ =================
echo Image Name                     PID Session Name        Session#    Mem Usage Status          User Name                                              CPU Time Window Title    
echo ========================= ======== ================ =========== ============ =============== ================================================== ============ =================

::for /f "tokens=5" %%i in ('netstat -n -o ^| findstr "ESTABLISHED" ^|findstr %puerto%') do (
for /f "tokens=5" %%i in ('netstat -n -o ^|findstr %puerto%') do (
	call tasklist /v /FI "PID eq %%i" | findstr "%%i"
	
)
call %nl%
call %nl%

echo =================================
echo  Net Status For Port: %puerto%
echo =================================
echo   Proto  Local Address          Foreign Address        State           PID
netstat -n -o |findstr %puerto%

call %nl%
call %nl%
