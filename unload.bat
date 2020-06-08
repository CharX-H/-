SCHTASKS /Delete /TN mytask 
for /d %%j in (*) do rd /S /Q "%%j" 
for /r %~dp0 %%i in (*) do del  /S /Q "%%i"

pause>nul
