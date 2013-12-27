@echo off

::used to test the claims that user's network connection cuts out during large downloads.
::the script downloads a fedora iso from the local mirror, deletes it, then starts all over again
::the count variable tracks the number of loops completed
::the filename is the name of the iso
::the httppath is the full path for the file (including name and extension)
set count=1

::The following 2 variables need to be changed if the location of the ISO changes!!!!!
set filename=filename.iso
set httppath=http://servername.com/filename.iso

::deletes any old log that is present, and deletes any old copies of the iso
if exist downloadlog.txt del downloadlog.txt
if exist %filename% del %filename%

::displays the welcome message and waits for the user to press a key before continuing
echo This script is designed to test the stability of network connections!
echo How many loops can YOU complete?
echo.
pause

::start of the main loop
:start

cls
echo Starting Loop #%count%...
echo.

::this step takes the longest out of anything, especially if the network connection is slow
wget %httppath%

::updates the log, deletes the iso, and updates the counter
echo %date% %time%  Loop #%count% completed >> downloadlog.txt
if exist %filename% del %filename%
set /a count=%count% + 1

::restarts the whole process
goto start
