@ECHO OFF

set PROJECT_HOME=%~f0
:strip
set TMP_CHAR=%PROJECT_HOME:~-1%
set PROJECT_HOME=%PROJECT_HOME:~0,-1%
if NOT "%TMP_CHAR%"=="\" goto strip

set LIB=%PROJECT_HOME%\lib

dir /b "%LIB%\*.jar" > ajar.tmp
FOR /F %%I IN (ajar.tmp) DO CALL "%PROJECT_HOME%\ajar.bat" %LIB%\%%I

SET TMP_CP=%TMP_CP%;

set CLASSPATH=%PROJECT_HOME%\classes;%TMP_CP%

set TMP_CHAR=
set TMP_CP=
del ajar.tmp

set COMPILE=%PROJECT_HOME%\compile

dir /b "%COMPILE%\*.jar" > ajar.tmp
FOR /F %%I IN (ajar.tmp) DO CALL "%PROJECT_HOME%\ajar.bat" %COMPILE%\%%I

SET TMP_CP=%TMP_CP%;%CLASSPATH%

SET CLASSPATH=%TMP_CP%;

set TMP_CP=

del ajar.tmp

@ECHO ON

set MEM_OPTS=-Xms256M -Xmx512M
set ANT_OPTS=%MEM_OPTS%
set ANT_HOME=C:\ant
set JAVA_HOME=C:\jdk1.8.0
set PROJECT_HOME=%PROJECT_HOME%

set PATH=%PROJECT_HOME%\bin;%ANT_HOME%\bin;%JAVA_HOME%\bin;%SystemRoot%\system32;%SystemRoot%;%SystemRoot%\System32\Wbem;

