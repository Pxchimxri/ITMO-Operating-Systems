cd c:\
mkdir c:\lab6
wmic os get Caption, Version > C:\lab6\version.txt
wmic os get FreePhysicalMemory, TotalVisibleMemorySize > c:\lab6\memory.txt
wmic logicaldisk get Caption, Description > c:\lab6\disk.txt
md c:\lab6\TEST
copy c:\lab6\"*" c:\lab6\TEST
cd c:\lab6
copy c:\lab6\"*" files.txt
for /f "skip=1" %%i in ('dir /b/o-d/tc') do del /q %%i