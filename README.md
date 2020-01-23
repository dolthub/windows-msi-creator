# Windows MSI Creator for Dolt

## Steps

1. Run `prepare.bat` in the Windows Command Prompt (`cmd.exe`).
2. Copy `dolt-windows-386.tar.gz` & `dolt-windows-amd64.tar.gz` to the `archives` folder.
    * This is created in `prepare.bat` if it did not already exist.
3. Update the `Version` attribute of the `Product` XML element in the following files:
    * `dolt-windows-386.wxs`
    * `dolt-windows-amd64.wxs`
4. Run `process.bat` in the Windows Command Prompt.
    * `warning LGHT1076 : ICE90` may be safely ignored.
5. Grab the files from the `output` folder.
    * You may remove the files from the `archives` folder as they're no longer necessary.
