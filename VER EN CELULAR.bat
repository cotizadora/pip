@echo off
REM ===========================================================
REM  "El Canto Secreto de Pip" — ver en el CELULAR
REM  Comparte el cuento en tu red Wi-Fi local.
REM  El celular debe estar en la MISMA red Wi-Fi que este PC.
REM  Para cerrar: cierra esta ventana negra.
REM ===========================================================
title Ver el cuento en el celular
cd /d "%~dp0"

set PORT=8099

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
echo  No se encontro Python. No se puede compartir en la red.
pause
exit /b

:run
echo.
echo   ============================================
echo    EL CANTO SECRETO DE PIP
echo   ============================================
echo.
echo    En tu CELULAR (misma red Wi-Fi) abre:
echo.

REM Mostrar todas las IP locales para que elijas la que funcione
for /f "tokens=2 delims=:" %%a in ('ipconfig ^| findstr /c:"IPv4"') do (
    for /f "tokens=* delims= " %%b in ("%%a") do echo         http://%%b:%PORT%/index.html
)

echo.
echo    Deja esta ventana abierta mientras lo ves.
echo   ============================================
echo.

%PYCMD% -m http.server %PORT%
