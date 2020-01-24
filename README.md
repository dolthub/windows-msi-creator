# Windows MSI Creator for Dolt

## Steps

1. Create the `archives` & `output` folders if they do not exist.
2. Copy `dolt-windows-386.zip` & `dolt-windows-amd64.zip` to the `archives` folder.
    * This is created in `prepare.bat` if it did not already exist.
3. Run `process.bat` in the Windows Command Prompt.
    * `warning LGHT1076 : ICE90` may be safely ignored.
4. Grab the files from the `output` folder.
    * You may remove the files from the `archives` folder as they're no longer necessary.
