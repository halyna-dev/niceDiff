@echo OFF
SETLOCAL ENABLEEXTENSIONS
:: name of running script
SET me=%~n0 
:: path to script folder
SET parent=%~dp0

SET branchA=%1
SET branchB=%2
SET comparePath=%3

::validate 1st parametr
IF "%branchA%"=="" (
  echo %me%: incorrect parameters. Please use: niceDiff ^<branch1-name^> ^<branch2-name^> [optional ^<path-to-comparing-files^>]
  GOTO:EOF
)

::validate 2nd parametr
IF "%branchB%"=="" (
  echo %me%: incorrect parameters. Please use: niceDiff ^<branch1-name^> ^<branch2-name^> [optional ^<path-to-comparing-files^>]
  GOTO:EOF
)

:: get difference and write into file
ECHO preparing raw difference...
git diff --minimal %branchA% %branchB% %3 > %parent%/diff.txt
:: note: --minimal flag get line different, --word-diff is nuclear diff

:: parce file into html
call parceDiff.bat 

