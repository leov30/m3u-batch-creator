@echo off

:: batch file to create .m3u from (Disc #) in file name, mainly to be used with retroarch
:: will only look for .cue and .chd files to add into the .m3u
:: files or folder can be drag and droped to the batch script
:: or the script can be run in the folder were the .cue/.chd files are located, will also scan in folders too
:: path inside the m3u file will depend if its a file or folder



::recursive mode
if "%~1"=="" goto :recursive

::folder mode
if exist "%~1\" goto :folder
REM if "%~x1"=="" goto :folder

::single file mode
set "_ext=cue"
if "%~x1"==".chd" set "_ext=chd"

set "_game=%~n1"

set "_match="

:: folder name, m3u file name
if not "%_game%"=="%_game:(Disc 1)=%" set "_file=%_game: (Disc 1)=%"&set "_match=%_game:(Disc 1)=(Disc ?)%"&goto :next
if not "%_game%"=="%_game:(Disc 2)=%" set "_file=%_game: (Disc 2)=%"&set "_match=%_game:(Disc 2)=(Disc ?)%"&goto :next
if not "%_game%"=="%_game:(Disc 3)=%" set "_file=%_game: (Disc 3)=%"&set "_match=%_game:(Disc 3)=(Disc ?)%"&goto :next
if not "%_game%"=="%_game:(Disc 4)=%" set "_file=%_game: (Disc 4)=%"&set "_match=%_game:(Disc 4)=(Disc ?)%"&goto :next
if not "%_game%"=="%_game:(Disc 5)=%" set "_file=%_game: (Disc 5)=%"&set "_match=%_game:(Disc 5)=(Disc ?)%"&goto :next
if not "%_game%"=="%_game:(Disc 6)=%" set "_file=%_game: (Disc 6)=%"&set "_match=%_game:(Disc 6)=(Disc ?)%"&goto :next

echo No disc file was found
:next

if exist "%_file%.m3u" del "%_file%.m3u"
for %%g in ("%_match%.%_ext%") do (
	(echo %%g) >>"%_file%.m3u"
	
)
exit
:: ---------------------- folder ----------------------------------------
:folder

set "_folder=%~n1"
set "_ext=cue"
if exist "%_folder%\*.chd" set "_ext=chd"

if exist "%_folder%.m3u" del "%_folder%.m3u"
for %%g in ("%_folder%\*.%_ext%") do (
	(echo %%g) >>"%_folder%.m3u"
	
)
move /y "%_folder%.m3u" .

exit
:: ---------------------- recursive folder mode --------------------------------
:recursive

::look if folders exist first
for /d %%g in (*) do set "_found=%%g"
if not defined _found goto :skip_folders


::check extensions for every folder
for /d %%g in (*) do (
	if exist "%%g.m3u" del "%%g.m3u"
	
	call :check_ext "%%g"

) 


:skip_folders
::look for cue, chd files if exist go to file recursive mode
set "_ext=cue"
if exist "*.cue" goto :recursive_files
if exist "*.chd" goto :recursive_files


exit

:check_ext
set "_ext=cue"
if exist "%~1\*.chd" set "_ext=chd"

for %%h in ("%~1\*.%_ext%") do (
	(echo %%h) >>"%~1.m3u"
	
)

exit /b

:: --------------------- recursive file mode -------------------------------
:recursive_files
for /f "delims=" %%g in ('dir /b *.%_ext% ^| findstr /r /c:"(Disc 1)"') do (
	call :check_files "%%g"
)

::look for cue files first, then look for chd
if "%_ext%"=="cue" set "_ext=chd"&goto :recursive_files


exit

:check_files

set "_game=%~n1"
set "_match="

:: folder name, m3u file name
if not "%_game%"=="%_game:(Disc 1)=%" set "_file=%_game: (Disc 1)=%"&set "_match=%_game:(Disc 1)=(Disc ?)%"&goto :next2
if not "%_game%"=="%_game:(Disc 2)=%" set "_file=%_game: (Disc 2)=%"&set "_match=%_game:(Disc 2)=(Disc ?)%"&goto :next2
if not "%_game%"=="%_game:(Disc 3)=%" set "_file=%_game: (Disc 3)=%"&set "_match=%_game:(Disc 3)=(Disc ?)%"&goto :next2
if not "%_game%"=="%_game:(Disc 4)=%" set "_file=%_game: (Disc 4)=%"&set "_match=%_game:(Disc 4)=(Disc ?)%"&goto :next2
if not "%_game%"=="%_game:(Disc 5)=%" set "_file=%_game: (Disc 5)=%"&set "_match=%_game:(Disc 5)=(Disc ?)%"&goto :next2
if not "%_game%"=="%_game:(Disc 6)=%" set "_file=%_game: (Disc 6)=%"&set "_match=%_game:(Disc 6)=(Disc ?)%"&goto :next2

echo No disc file was found
:next2

if exist "%_file%.m3u" del "%_file%.m3u"
for %%g in ("%_match%.%_ext%") do (
	(echo %%g) >>"%_file%.m3u"
	
)

exit /b
