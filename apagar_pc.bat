@echo off
title Sincronizando y Apagando...
color 0b
set BASE_DIR=C:\Users\WoodTools-02\Desktop\vscode

echo ==================================================
echo INICIANDO RESPALDO DE TODOS LOS REPOSITORIOS...
echo ==================================================

for /d %%i in ("%BASE_DIR%\*") do (
    if exist "%%i\.git" (
        echo.
        echo [Subiendo cambios de: %%~nxi]
        cd /d "%%i"
        git add .
        :: Usamos las variables nativas de fecha y hora de Windows para el mensaje
        git commit -m "actualizacion-code-%date% %time%"
        git push
    )
)

echo.
echo ==================================================
echo RESPALDO COMPLETADO. APAGANDO LA PC EN 10 SEGUNDOS...
echo ==================================================
:: El comando que apaga la PC (apaga /s, tiempo /t 10 segundos)
shutdown /s /t 10