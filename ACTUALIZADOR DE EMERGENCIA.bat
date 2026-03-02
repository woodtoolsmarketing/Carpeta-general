@echo off
title Subiendo a GitHub...
color 0b

echo ==================================================
echo EMPAQUETANDO Y SUBIENDO ARCHIVOS A GITHUB...
echo ==================================================

git add .
git commit -m "Respaldo manual - %date% %time%"
git push

echo.
echo ==================================================
echo ¡SUBIDA COMPLETADA CON EXITO! TODO ESTA EN LA NUBE.
echo ==================================================
pause