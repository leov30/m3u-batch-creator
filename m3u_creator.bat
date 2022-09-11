@echo off
if "%~1"=="" echo only drag and drop file&pause&exit

set "_game=%~n1"

if exist "%~1\" (
	cd "%~1"&goto :next
)

if not "%_game%"=="%_game:(Disc 1)=%" set "_game=%_game: (Disc 1)=%"&goto :next
if not "%_game%"=="%_game:(Disc 2)=%" set "_game=%_game: (Disc 2)=%"&goto :next
if not "%_game%"=="%_game:(Disc 3)=%" set "_game=%_game: (Disc 3)=%"&goto :next
if not "%_game%"=="%_game:(Disc 4)=%" set "_game=%_game: (Disc 4)=%"&goto :next
if not "%_game%"=="%_game:(Disc 5)=%" set "_game=%_game: (Disc 5)=%"&goto :next
if not "%_game%"=="%_game:(Disc 6)=%" set "_game=%_game: (Disc 6)=%"&goto :next
:next

type nul>"%temp%\temp.1"
for %%g in ("%_game%*.cue") do (
	(echo %%g) >>"%temp%\temp.1"

)
copy /y %temp%\temp.1 "%~dp0\%_game%.m3u"
