@echo off
title Sincronizando y Apagando...
color 0b
set BASE_DIR=C:\Users\WoodTools-02\Desktop\vscode

echo ==================================================
echo INICIANDO SINCRONIZACION DE TODOS LOS REPOSITORIOS...
echo ==================================================

for /d %%i in ("%BASE_DIR%\*") do (
    if exist "%%i\.git" (
        echo.
        echo ==================================================
        echo Procesando repositorio: %%~nxi
        echo ==================================================
        cd /d "%%i"
        
        :: 1. Guardamos tus cambios locales primero (para que Git no bloquee la descarga)
        git add .
        git commit -m "actualizacion-code-%date% %time%"
        
        :: 2. Descargamos cualquier cambio de la nube (Pull)
        echo [Descargando actualizaciones de la nube...]
        git pull --no-edit
        
        :: 3. Subimos todo unificado (Push)
        echo [Subiendo a la nube...]
        git push
    )
)

echo.
echo ==================================================
echo RESPALDO COMPLETADO. APAGANDO LA PC EN 10 SEGUNDOS...
echo ==================================================
:: El comando que apaga la PC (apaga /s, tiempo /t 10 segundos)
shutdown /s /t 10