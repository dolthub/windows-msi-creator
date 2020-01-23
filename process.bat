@echo off
cls
SET PATH=.\wix


echo ------------------------- Creating x86 ZIP ^& MSI -------------------------
:: Extract to a top-level dolt directory
del /F /Q "output\dolt-windows-386.msi" 2> nul
del /F /Q "output\dolt-windows-386.zip" 2> nul
7z.exe x -oarchives archives/dolt-windows-386.tar.gz > nul
7z.exe x -oarchives archives/dolt-windows-386.tar > nul
del /F /Q "archives\dolt-windows-386.tar" 2> nul
ren "archives\dolt-windows-386" dolt  > nul
move "archives\dolt" dolt > nul
:: Compress the contents into a ZIP file
cd dolt
"..\7z.exe" a -mx9 -tzip -r dolt-windows-386.zip *
cd ..
move "dolt\dolt-windows-386.zip" output > nul
:: Compile the MSI
candle dolt-windows-386.wxs > nul
light -ext WixUIExtension -cultures:en-us dolt-windows-386.wixobj
move dolt-windows-386.msi output > nul
:: Cleanup
del /F /Q dolt-windows-386.wixpdb 2> nul
del /F /Q dolt-windows-386.wixobj 2> nul
rmdir /Q /S dolt > nul

echo  
echo ------------------------- Creating x64 ZIP ^& MSI -------------------------
:: Extract to a top-level dolt directory
del /F /Q "output\dolt-windows-amd64.msi" 2> nul
del /F /Q "output\dolt-windows-amd64.zip" 2> nul
7z.exe x -oarchives archives/dolt-windows-amd64.tar.gz > nul
7z.exe x -oarchives archives/dolt-windows-amd64.tar > nul
del /F /Q "archives\dolt-windows-amd64.tar" 2> nul
ren "archives\dolt-windows-amd64" dolt > nul
move "archives\dolt" dolt > nul
:: Compress the contents into a ZIP file
cd dolt
"..\7z.exe" a -mx9 -tzip -r dolt-windows-amd64.zip *
cd ..
move "dolt\dolt-windows-amd64.zip" output > nul
:: Compile the MSI
candle dolt-windows-amd64.wxs > nul
light -ext WixUIExtension -cultures:en-us dolt-windows-amd64.wixobj
move dolt-windows-amd64.msi output > nul
:: Cleanup
del /F /Q dolt-windows-amd64.wixpdb 2> nul
del /F /Q dolt-windows-amd64.wixobj 2> nul
rmdir /Q /S dolt > nul