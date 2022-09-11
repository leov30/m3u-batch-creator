@echo off
::recursive mode
if "%~1"=="" goto :recursive

::folder mode
if exist "%~1\" goto :folder

set "_game=%~n1"
set "_match="
set _flag=0

::search for title and country code only if (Disc #) is at the end
if "%_game%"=="%_game:(Disc 1).cue=%" (
	for /f "tokens=1,2 delims=)(" %%g in ("%_game%") do set "_match=%%g(%%h)"
)else (
	set _flag=1

)
:: folder name, m3u file name
if not "%_game%"=="%_game:(Disc 1)=%" set "_game=%_game: (Disc 1)=%"&goto :next
if not "%_game%"=="%_game:(Disc 2)=%" set "_game=%_game: (Disc 2)=%"&goto :next
if not "%_game%"=="%_game:(Disc 3)=%" set "_game=%_game: (Disc 3)=%"&goto :next
if not "%_game%"=="%_game:(Disc 4)=%" set "_game=%_game: (Disc 4)=%"&goto :next
if not "%_game%"=="%_game:(Disc 5)=%" set "_game=%_game: (Disc 5)=%"&goto :next
if not "%_game%"=="%_game:(Disc 6)=%" set "_game=%_game: (Disc 6)=%"&goto :next
:next
echo No disc file was found

if %_flag% equ 1 set "_match=%_game%"

if exist "%_game%.m3u" del "%_game%.m3u"
for %%g in ("%_match%*.cue") do (
	(echo %%g) >>"%_game%.m3u"
	
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
if exist "*.cue" echo recursive mode

for /d %%g in (*) do (
	if exist "%%g.m3u" del "%%g.m3u"
	
	for %%h in ("%%g\*.cue") do (
		(echo %%h) >>"%%g.m3u"
		
	)
) 