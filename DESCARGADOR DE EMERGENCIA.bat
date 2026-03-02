@echo off
title EMERGENCIA: Restaurando desde GitHub...
color 0c

echo ==================================================
echo ATENCION: ESTO BORRARA TUS CAMBIOS LOCALES NO GUARDADOS
echo Y DEJARA LA CARPETA EXACTAMENTE IGUAL QUE EN GITHUB.
echo ==================================================
pause

echo.
echo Forzando sincronizacion con la nube...
git fetch --all
git reset --hard HEAD
git pull

echo.
echo ==================================================
echo ¡DESCARGA DE EMERGENCIA COMPLETADA!
echo ==================================================
pause