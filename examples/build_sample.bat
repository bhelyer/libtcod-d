REM Source dir, for dmd -I...
set TCOD_SOURCEDIR=..\source

REM List of all the .d files.
set TCOD_SOURCES=
set TCOD_SOURCES=%TCOD_SOURCES% %TCOD_SOURCEDIR%\sdl\c\video.d 
set TCOD_SOURCES=%TCOD_SOURCES% %TCOD_SOURCEDIR%\tcod\c\all.d 
set TCOD_SOURCES=%TCOD_SOURCES% %TCOD_SOURCEDIR%\tcod\c\functions.d 
set TCOD_SOURCES=%TCOD_SOURCES% %TCOD_SOURCEDIR%\tcod\c\types.d

REM Compile samples_d.d with TCOD
dmd -I%TCOD_SOURCEDIR% samples_d.d %TCOD_SOURCES%

REM Copy DLLs into this directory (This is a Windows security requirement)
xcopy /y/x/r/k ..\libs\*.dll .
