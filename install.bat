@echo off
setlocal enabledelayedexpansion

echo ============================================
echo   MY ECOSYSTEM - Instalador de 1 clic
echo ============================================
echo.
echo Esto va a:
echo   1. Descargar (clonar) tus 3 repos
echo   2. Registrar los botones "Abrir app" de la web
echo Todo en tu carpeta de usuario, sin admin.
echo.

set "DEST=%USERPROFILE%\MyEcosystem"
echo Carpeta de instalacion: %DEST%
echo (Enter para aceptar, o escribe otra ruta y Enter)
set /p "INPUT=> "
if not "%INPUT%"=="" set "DEST=%INPUT%"

if not exist "%DEST%" mkdir "%DEST%"
cd /d "%DEST%"
if errorlevel 1 (
    echo No puedo entrar en %DEST%
    pause
    exit /b 1
)

rem --- Git es necesario para descargar los repos ---
where git >nul 2>nul
if errorlevel 1 (
    echo.
    echo Git no esta instalado. Lo instalo con winget, dame un momento...
    winget install --id Git.Git -e --source winget
    echo.
    echo Git instalado. AHORA CIERRA ESTA VENTANA y vuelve a hacer
    echo doble clic en install.bat para continuar. Windows necesita
    echo reiniciar la consola para detectar git nuevo.
    pause
    exit /b 0
)

echo.
echo Descargando/actualizando repos...
for %%R in (My_ecosystem Life_manager Radar_ingestion) do (
    if exist "%%R\.git" (
        echo   - %%R ya existe, actualizando...
        pushd "%%R"
        git pull --quiet
        popd
    ) else (
        echo   - Clonando %%R...
        git clone --quiet https://github.com/DonJimbo/%%R.git
        if errorlevel 1 (
            echo     Fallo al clonar %%R. Puede que git te pida iniciar sesion
            echo     en el navegador la primera vez - hazlo y vuelve a ejecutar.
        )
    )
)

echo.
echo Registrando lanzadores...
if exist "%DEST%\My_ecosystem\setup\register-launchers.bat" (
    call "%DEST%\My_ecosystem\setup\register-launchers.bat" "%DEST%\Life_manager" "%DEST%\Radar_ingestion" <nul
) else (
    echo No encuentro setup\register-launchers.bat dentro de My_ecosystem.
)

echo.
echo ============================================
echo   LISTO
echo ============================================
echo Ya puedes usar los botones "Abrir app" en:
echo   https://donjimbo.github.io/My_ecosystem/
echo.
pause
