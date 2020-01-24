# Windows MSI Creator for Dolt

## Steps

1. Create the `archives` & `output` folders if they do not exist.
2. Copy `dolt-windows-386.zip` & `dolt-windows-amd64.zip` to the `archives` folder.
3. Run `process.bat` in the Windows Command Prompt.
    * Verify that the version displayed is the version that is expected. Should be in the form of `'X.X.X'`.
    * `warning LGHT1076 : ICE90` may be safely ignored.
4. Grab the files from the `output` folder.
    * You may remove the files from the `archives` folder as they're no longer necessary.
