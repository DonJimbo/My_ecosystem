@echo off
setlocal enabledelayedexpansion
chcp 65001 >nul

echo ============================================
echo   MY ECOSYSTEM - Registro de lanzadores
echo ============================================
echo.
echo Esto registra 2 protocolos en tu Windows (myeco-recorder:// y
echo myeco-radar://) para que los botones de la web puedan abrir tus
echo apps directamente. Es un registro POR ORDENADOR, se hace una vez.
echo No requiere permisos de administrador (se guarda en tu usuario).
echo.

rem --- Rutas: por defecto, hermanas de esta carpeta (My_ecosystem\..\) ---
rem     Puedes pasarlas a mano: register-launchers.bat "ruta\Life_manager" "ruta\Radar_ingestion"
set "BASE=%~dp0.."
if "%~1"=="" (set "LM_DIR=%BASE%\Life_manager") else (set "LM_DIR=%~1")
if "%~2"=="" (set "RD_DIR=%BASE%\Radar_ingestion") else (set "RD_DIR=%~2")

set "LM_BAT=%LM_DIR%\launch-widget.bat"
set "RD_BAT=%RD_DIR%\Arrancar_Radar_Ingestor.bat"

set "OK=1"

if exist "%LM_BAT%" (
    echo [OK] Smart Recorder encontrado en: %LM_BAT%
    reg add "HKCU\Software\Classes\myeco-recorder" /ve /d "URL:MyEcosystem Recorder" /f >nul
    reg add "HKCU\Software\Classes\myeco-recorder" /v "URL Protocol" /d "" /f >nul
    reg add "HKCU\Software\Classes\myeco-recorder\shell\open\command" /ve /d "\"%LM_BAT%\"" /f >nul
    echo       Protocolo myeco-recorder:// registrado.
) else (
    echo [!!] No encuentro launch-widget.bat en: %LM_BAT%
    echo      Clona Life_manager junto a My_ecosystem, o pasa la ruta como 1er argumento.
    set "OK=0"
)
echo.

if exist "%RD_BAT%" (
    echo [OK] Radar Ingestor encontrado en: %RD_BAT%
    reg add "HKCU\Software\Classes\myeco-radar" /ve /d "URL:MyEcosystem Radar" /f >nul
    reg add "HKCU\Software\Classes\myeco-radar" /v "URL Protocol" /d "" /f >nul
    reg add "HKCU\Software\Classes\myeco-radar\shell\open\command" /ve /d "\"%RD_BAT%\"" /f >nul
    echo       Protocolo myeco-radar:// registrado.
) else (
    echo [!!] No encuentro Arrancar_Radar_Ingestor.bat en: %RD_BAT%
    echo      Clona Radar_ingestion junto a My_ecosystem, o pasa la ruta como 2o argumento.
    set "OK=0"
)
echo.

if "%OK%"=="1" (
    echo Listo. Ya puedes usar los botones "Abrir app" en:
    echo   https://donjimbo.github.io/My_ecosystem/
    echo La primera vez el navegador te pedira confirmar "Abrir la app" - dale a Permitir.
) else (
    echo Registro incompleto - revisa las rutas de arriba.
    echo Uso manual:  register-launchers.bat "C:\ruta\Life_manager" "C:\ruta\Radar_ingestion"
)
echo.
pause
