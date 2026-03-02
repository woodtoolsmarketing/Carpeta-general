@echo off
title Actualizando Repositorios y Dependencias...
color 0a
set BASE_DIR=C:\Users\WoodTools-02\Desktop\vscode

echo ==================================================
echo BUSCANDO ACTUALIZACIONES EN GITHUB...
echo ==================================================

for /d %%i in ("%BASE_DIR%\*") do (
    if exist "%%i\.git" (
        echo.
        echo [=========================================]
        echo [Actualizando: %%~nxi]
        cd /d "%%i"
        git pull
        
        :: Si detecta que es un proyecto de Node, actualiza los paquetes
        if exist "package.json" (
            echo [Verificando paquetes de Node.js...]
            :: Las etiquetas extra son para que no te llene la pantalla de avisos irrelevantes
            call npm install --no-fund --no-audit
        )
    )
)

echo.
echo ==================================================
echo TODO ACTUALIZADO Y LISTO. CERRANDO EN 5 SEGUNDOS...
echo ==================================================
timeout /t 5