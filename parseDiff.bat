ECHO start parcing...

SET parent=%~dp0

:: CONSTANTS
SET sOpenFile=^</div^>^<button class="section"^>
SET sCloseFile=^</button^>^<div class="section-content"^>^<div^>
SET sOpenCodeBlock=^</div^>^<div^>
SET sOpenCodeLine=^<pre^>
SET sCloseCodeLine=^</pre^>
SET sOpenAddCodeLine=^<pre class="add"^>
SET sOpenRemoveCodeLine=^<pre class="remove"^>

:: open tag for main cotent
ECHO ^<main^>>>niceDiff-report.html

:: init code block
ECHO ^<div^>>> niceDiff-report.html
:: init file section
ECHO ^<div^>>> niceDiff-report.html

SETLOCAL enabledelayedexpansion
FOR /F "usebackq tokens=*" %%A IN ("%parent%/diff.txt") DO (
	SET line1=%%A
	SET line2=!line1:^<=^&lt;!
	SET line=!line2:^>=^&gt;!
	IF "!line:~0,10!"=="diff --git" (
	  rem close last code block in previous file
      ECHO ^</div^>>> niceDiff-report.html
	  rem new file
	  ECHO !sOpenFile! >> niceDiff-report.html
	) ELSE IF "!line:~0,5!"=="--- a" (
	  rem get file name	 
	  ECHO !line:~5!!sCloseFile! >> niceDiff-report.html
	) ELSE IF "!line:~0,5!"=="+++ b" (
	  rem skip line	 
	) ELSE IF "!line:~0,6!"=="index " (
	  rem skip line	 
	) ELSE IF "!line:~0,3!"=="@@ " (
	  rem start diff block
	  ECHO !sOpenCodeBlock!!sOpenCodeLine!!line!!sCloseCodeLine! >> niceDiff-report.html
	) ELSE IF "!line:~0,1!"=="-" (
	  rem start remove line
	  ECHO !sOpenRemoveCodeLine!!line:~1!!sCloseCodeLine! >> niceDiff-report.html
	) ELSE IF "!line:~0,1!"=="+" (
	  rem start add line
	  ECHO !sOpenAddCodeLine!!line:~1!!sCloseCodeLine! >> niceDiff-report.html
	) ELSE (
	  rem default add line
	  ECHO !sOpenCodeLine!!line!!sCloseCodeLine! >> niceDiff-report.html
	)
)
:: close last code block
ECHO ^</div^>>> niceDiff-report.html
:: close file section
ECHO ^</div^>>> niceDiff-report.html

:: add bottom part of template
TYPE %parent%template_bottom_report.html>> niceDiff-report.html

ECHO complited

