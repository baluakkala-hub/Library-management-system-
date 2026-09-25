@echo off
title UniLibrary - Spring Boot Backend (Port 8080)
color 0A
echo ======================================================================
echo          Central University Library Management System
echo                  Starting Spring Boot 3 Backend
echo ======================================================================
echo.
echo Port: 8080
echo REST API Base:         http://localhost:8080/api
echo Swagger Documentation: http://localhost:8080/swagger-ui.html
echo Database:               MySQL (localhost:3306/lms_db)
echo.
echo ======================================================================
echo.

cd /d "%~dp0backend"

set "MVN_CMD=mvn"
where mvn >nul 2>nul
if %ERRORLEVEL% neq 0 (
    if exist "C:\Users\balua\Desktop\apache-maven-3.9.6\bin\mvn.cmd" (
        set "MVN_CMD=C:\Users\balua\Desktop\apache-maven-3.9.6\bin\mvn.cmd"
    ) else (
        echo [ERROR] Maven not found in PATH or at C:\Users\balua\Desktop\apache-maven-3.9.6\bin\mvn.cmd!
        pause
        exit /b 1
    )
)

echo Executing: %MVN_CMD% spring-boot:run ...
echo.
"%MVN_CMD%" spring-boot:run
if %ERRORLEVEL% neq 0 (
    echo.
    echo [ERROR] Backend process terminated with error code %ERRORLEVEL%.
)
pause