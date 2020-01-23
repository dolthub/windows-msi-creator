1) Run prepare.bat in cmd.exe
2) Copy dolt-windows-386.tar.gz & dolt-windows-amd64.tar.gz to the archives folder
3) Update the version in dolt-windows-386.wxs & dolt-windows-386.wxs ("Product" XML element)
4) Run process.bat in cmd.exe
5) Grab the files from the output folder
6) OPTIONAL: you may remove the files from the archives folder

NOTE: "warning LGHT1076 : ICE90" may be safely ignored