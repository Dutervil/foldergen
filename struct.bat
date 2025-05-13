@echo off
setlocal enabledelayedexpansion

echo Creating enterprise project structure...

rem Use the current directory as base package
set "BASE_DIR=%cd%"

rem Standard enterprise package structure
set DIRS=^
config ^
controller ^
dto ^
entity ^
exception ^
repository ^
service\impl ^
service ^
util ^
security ^
mapper ^
domain ^
event ^
validation

for %%D in (%DIRS%) do (
    mkdir "%BASE_DIR%\%%D"
  
)

rem Additional folders outside base package
set "RESOURCES_DIR=%BASE_DIR:\src\main\java=%src\main\resources"
if not exist "%RESOURCES_DIR%" mkdir "%RESOURCES_DIR%"

set "STATIC_DIR=%RESOURCES_DIR%\static"
set "TEMPLATES_DIR=%RESOURCES_DIR%\templates"
set "APPLICATION_YML=%RESOURCES_DIR%\application.yml"

mkdir "%STATIC_DIR%"
mkdir "%TEMPLATES_DIR%"
if not exist "%APPLICATION_YML%" (
    echo # Default Spring Boot configuration > "%APPLICATION_YML%"
)

echo.
echo ✅ Enterprise structure created successfully in:
echo %BASE_DIR%
pause
