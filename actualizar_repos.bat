@echo off
:: Activamos la expansion retrasada para que las variables funcionen dentro del bucle
setlocal EnableDelayedExpansion
title Actualizando Repositorios y Dependencias...
color 0a
set BASE_DIR=C:\Users\WoodTools-01\Desktop\vscode

echo ==================================================
echo BUSCANDO ACTUALIZACIONES EN GITHUB...
echo ==================================================

for /d %%i in ("%BASE_DIR%\*") do (
    if exist "%%i\.git" (
        echo.
        echo [=========================================]
        echo [Actualizando: %%~nxi]
        cd /d "%%i"
        
        :: REGLA ESPECIAL PARA EL PROGRAMA DE WHATSAPP
        if /I "%%~nxi"=="WhatsAppMessage" (
            echo [Detectado CRM de WhatsApp - Verificando versiones...]
            git fetch origin main
            FOR /F "tokens=*" %%a in ('git rev-parse HEAD') do SET LOCAL_VER=%%a
            FOR /F "tokens=*" %%a in ('git rev-parse origin/main') do SET REMOTE_VER=%%a
            
            if "!LOCAL_VER!"=="!REMOTE_VER!" (
                echo [El codigo ya esta al dia. No hace falta compilar.]
            ) else (
                echo [Descargando nuevo codigo...]
                git pull origin main
                echo [Compilando nueva version del EXE. Por favor espera...]
                
                :: Limpieza y compilacion silenciosa
                if exist "build" rmdir /s /q "build"
                if exist "dist\Gestor de Mensajes Difusion.exe" del /f /q "dist\Gestor de Mensajes Difusion.exe"
                .\venv\Scripts\pyinstaller.exe --noconsole --onefile --hidden-import pandas --hidden-import gspread --hidden-import oauth2client --hidden-import google_auth_oauthlib --name "Gestor de Mensajes Difusion" --icon "Imagenes\logo.ico" --add-data "Imagenes;Imagenes" --add-data "credenciales.json;." interfaz.py
                
                echo [Compilacion exitosa.]
            )
            
        ) else (
            :: COMPORTAMIENTO NORMAL PARA EL RESTO DE REPOSITORIOS
            git pull
            
            :: Si detecta que es un proyecto de Node, actualiza los paquetes
            if exist "package.json" (
                echo [Verificando paquetes de Node.js...]
                call npm install --no-fund --no-audit
            )
        )
    )
)

echo.
echo ==================================================
echo TODO ACTUALIZADO Y LISTO. CERRANDO EN 5 SEGUNDOS...
echo ==================================================
timeout /t 5