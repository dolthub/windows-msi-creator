@echo off
cls
SET PATH=%PATH%;.\wix

:: Check that the files and directories exist
if not exist "archives" mkdir "archives"
if not exist "output" mkdir "output"
if not exist "archives\dolt-windows-amd64.zip" echo Could not find "dolt-windows-amd64.zip" in archives & exit /B
:: Cleanup any previous output files
del /F /Q "output\dolt-windows-386.msi" 2> nul
del /F /Q "output\dolt-windows-amd64.msi" 2> nul
echo ------------------------- Checking Dolt Version --------------------------
:: Extract to a top-level dolt directory
7z.exe x -oarchives archives/dolt-windows-amd64.zip > nul
ren "archives\dolt-windows-amd64" dolt > nul
move "archives\dolt" dolt > nul
:: Get the first line of the command `dolt version`
for /f "tokens=*" %%i in ('dolt\bin\dolt.exe version') do set (PROCESSED_DOLT_VERSION=%%i & goto next)
:next
:: Filter out the text `dolt version `
set PROCESSED_DOLT_VERSION=%PROCESSED_DOLT_VERSION:dolt version =%
echo Dolt version is '%PROCESSED_DOLT_VERSION%'
powershell -Command "(gc dolt-windows-386.wxs) -replace 'PROCESSED_DOLT_VERSION', '%PROCESSED_DOLT_VERSION%' | Out-File -encoding ASCII dolt-windows-386-proc.wxs"
powershell -Command "(gc dolt-windows-amd64.wxs) -replace 'PROCESSED_DOLT_VERSION', '%PROCESSED_DOLT_VERSION%' | Out-File -encoding ASCII dolt-windows-amd64-proc.wxs"
echo.
echo ---------------------------- Creating x64 MSI ----------------------------
:: Compile the MSI
candle dolt-windows-amd64-proc.wxs > nul
light -ext WixUIExtension -cultures:en-us dolt-windows-amd64-proc.wixobj
ren dolt-windows-amd64-proc.msi dolt-windows-amd64.msi > nul
move dolt-windows-amd64.msi output > nul
:: Cleanup
del /F /Q dolt-windows-amd64-proc.wxs 2> nul
del /F /Q dolt-windows-amd64-proc.wixpdb 2> nul
del /F /Q dolt-windows-amd64-proc.wixobj 2> nul
rmdir /Q /S dolt > nul
:: Skip x86 if it does not exist
if not exist "archives\dolt-windows-386.zip" del /F /Q dolt-windows-386-proc.wxs 2> nul & exit /B
echo.
echo ---------------------------- Creating x86 MSI ----------------------------
:: Extract to a top-level dolt directory
7z.exe x -oarchives archives/dolt-windows-386.zip > nul
ren "archives\dolt-windows-386" dolt > nul
move "archives\dolt" dolt > nul
:: Compile the MSI
candle dolt-windows-386-proc.wxs > nul
light -ext WixUIExtension -cultures:en-us dolt-windows-386-proc.wixobj
ren dolt-windows-386-proc.msi dolt-windows-386.msi > nul
move dolt-windows-386.msi output > nul
:: Cleanup
del /F /Q dolt-windows-386-proc.wxs 2> nul
del /F /Q dolt-windows-386-proc.wixpdb 2> nul
del /F /Q dolt-windows-386-proc.wixobj 2> nul
rmdir /Q /S dolt > nul