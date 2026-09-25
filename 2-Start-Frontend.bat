@echo off
title UniLibrary - Angular Web Frontend (Port 4200)
color 0B
echo ======================================================================
echo          Central University Library Management System
echo                  Starting Angular 18 Web Frontend
echo ======================================================================
echo.
echo URL: http://localhost:4200
echo.
echo ======================================================================
echo.

cd /d "%~dp0frontend"

echo Launching Angular development server and opening browser...
echo.

if exist "%~dp0frontend\node_modules\.bin\ng.cmd" (
    call "%~dp0frontend\node_modules\.bin\ng.cmd" serve --port 4200 --open
) else (
    call npm start -- --port 4200 --open
)

if %ERRORLEVEL% neq 0 (
    echo.
    echo [ERROR] Frontend process terminated with error code %ERRORLEVEL%.
)
pause