@echo off
REM ===========================================================
REM  "El Canto Secreto de Pip" — lanzador
REM  Levanta un mini-servidor local en esta carpeta y abre el
REM  cuento en el navegador. Asi las laminas y los audios
REM  cargan siempre correctamente.
REM  Para cerrar: cierra esta ventana negra.
REM ===========================================================
title El Canto Secreto de Pip
cd /d "%~dp0"

set PORT=8099

REM Buscar Python (py o python)
where py >nul 2>&1
if %errorlevel%==0 (
    set PYCMD=py
    goto :run
)
where python >nul 2>&1
if %errorlevel%==0 (
    set PYCMD=python
    goto :run
)

echo.
echo  No se encontro Python en este equipo.
echo  Abre index.html con doble clic en Chrome o Edge.
echo.
start "" "index.html"
pause
exit /b

:run
echo.
echo   El Canto Secreto de Pip
echo   ------------------------------------
echo   Abriendo el cuento en el navegador...
echo.
echo   Deja esta ventana abierta mientras lees.
echo   Para cerrar el cuento, cierra esta ventana.
echo.

REM Abrir el navegador con un pequeno retardo para que el servidor este listo
start "" cmd /c "timeout /t 2 >nul && start http://localhost:%PORT%/index.html"

REM Iniciar el servidor (bloquea esta ventana hasta cerrarla)
%PYCMD% -m http.server %PORT%
