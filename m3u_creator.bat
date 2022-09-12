@echo off
::recursive mode
if "%~1"=="" goto :recursive

::folder mode
if exist "%~1\" goto :folder

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
for %%g in ("%_match%.cue") do (
	(echo %%g) >>"%_file%.m3u"
	
)
exit
:: ---------------------- folder ----------------------------------------
:folder

set "_folder=%~n1"

if exist "%_folder%.m3u" del "%_folder%.m3u"
for %%g in ("%_folder%\*.cue") do (
	(echo %%g) >>"%_folder%.m3u"
	
)
move /y "%_folder%.m3u" .

exit
:: ---------------------- recursive mode --------------------------------
:recursive

::recursive files mode
if exist "*.cue" goto :recursive_files

for /d %%g in (*) do (
	if exist "%%g.m3u" del "%%g.m3u"
	
	for %%h in ("%%g\*.cue") do (
		(echo %%h) >>"%%g.m3u"
		
	)
) 

exit
:: --------------------- recursive file mode -------------------------------
:recursive_files
for /f "delims=" %%g in ('dir /b *.cue ^| findstr /r /c:"(Disc 1)"') do (
	call :check_files "%%g"
)

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
for %%g in ("%_match%.cue") do (
	(echo %%g) >>"%_file%.m3u"
	
)

exit /b
