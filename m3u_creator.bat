@echo off
if "%~1"=="" echo only drag and drop file or folder&pause&exit

set "_game=%~n1"
set "_match="
set _flag=0

if exist "%~1\" (
	cd /d "%~1"&goto :next
)
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
echo No disc were found

if %_flag% equ 1 set "_match=%_game%"

type nul>"%temp%\temp.1"
for %%g in ("%_match%*.cue") do (
	(echo %%g) >>"%temp%\temp.1"
	
)
::copy to the game directory
copy /y %temp%\temp.1 "%_game%.m3u"

