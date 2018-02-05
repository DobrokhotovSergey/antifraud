@REM ----------------------------------------------------------------------------
@REM  Copyright 2001-2006 The Apache Software Foundation.
@REM
@REM  Licensed under the Apache License, Version 2.0 (the "License");
@REM  you may not use this file except in compliance with the License.
@REM  You may obtain a copy of the License at
@REM
@REM       http://www.apache.org/licenses/LICENSE-2.0
@REM
@REM  Unless required by applicable law or agreed to in writing, software
@REM  distributed under the License is distributed on an "AS IS" BASIS,
@REM  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
@REM  See the License for the specific language governing permissions and
@REM  limitations under the License.
@REM ----------------------------------------------------------------------------
@REM
@REM   Copyright (c) 2001-2006 The Apache Software Foundation.  All rights
@REM   reserved.

@echo off

set ERROR_CODE=0

:init
@REM Decide how to startup depending on the version of windows

@REM -- Win98ME
if NOT "%OS%"=="Windows_NT" goto Win9xArg

@REM set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" @setlocal

@REM -- 4NT shell
if "%eval[2+2]" == "4" goto 4NTArgs

@REM -- Regular WinNT shell
set CMD_LINE_ARGS=%*
goto WinNTGetScriptDir

@REM The 4NT Shell from jp software
:4NTArgs
set CMD_LINE_ARGS=%$
goto WinNTGetScriptDir

:Win9xArg
@REM Slurp the command line arguments.  This loop allows for an unlimited number
@REM of arguments (up to the command line limit, anyway).
set CMD_LINE_ARGS=
:Win9xApp
if %1a==a goto Win9xGetScriptDir
set CMD_LINE_ARGS=%CMD_LINE_ARGS% %1
shift
goto Win9xApp

:Win9xGetScriptDir
set SAVEDIR=%CD%
%0\
cd %0\..\.. 
set BASEDIR=%CD%
cd %SAVEDIR%
set SAVE_DIR=
goto repoSetup

:WinNTGetScriptDir
set BASEDIR=%~dp0\..

:repoSetup
set REPO=


if "%JAVACMD%"=="" set JAVACMD=java

if "%REPO%"=="" set REPO=%BASEDIR%\repo

set CLASSPATH="%BASEDIR%"\etc;"%REPO%"\junit\junit\4.12\junit-4.12.jar;"%REPO%"\org\hamcrest\hamcrest-core\1.3\hamcrest-core-1.3.jar;"%REPO%"\org\springframework\spring-websocket\4.3.4.RELEASE\spring-websocket-4.3.4.RELEASE.jar;"%REPO%"\org\springframework\spring-context\4.3.4.RELEASE\spring-context-4.3.4.RELEASE.jar;"%REPO%"\org\springframework\spring-messaging\4.3.4.RELEASE\spring-messaging-4.3.4.RELEASE.jar;"%REPO%"\org\springframework\spring-beans\4.3.4.RELEASE\spring-beans-4.3.4.RELEASE.jar;"%REPO%"\org\springframework\spring-core\4.3.4.RELEASE\spring-core-4.3.4.RELEASE.jar;"%REPO%"\commons-logging\commons-logging\1.2\commons-logging-1.2.jar;"%REPO%"\org\springframework\spring-orm\4.3.4.RELEASE\spring-orm-4.3.4.RELEASE.jar;"%REPO%"\org\springframework\spring-tx\4.3.4.RELEASE\spring-tx-4.3.4.RELEASE.jar;"%REPO%"\org\springframework\spring-web\4.3.4.RELEASE\spring-web-4.3.4.RELEASE.jar;"%REPO%"\org\springframework\spring-aop\4.3.4.RELEASE\spring-aop-4.3.4.RELEASE.jar;"%REPO%"\org\springframework\spring-webmvc\4.3.4.RELEASE\spring-webmvc-4.3.4.RELEASE.jar;"%REPO%"\org\springframework\spring-expression\4.3.4.RELEASE\spring-expression-4.3.4.RELEASE.jar;"%REPO%"\org\springframework\spring-jdbc\4.3.4.RELEASE\spring-jdbc-4.3.4.RELEASE.jar;"%REPO%"\org\springframework\security\spring-security-messaging\4.2.3.RELEASE\spring-security-messaging-4.2.3.RELEASE.jar;"%REPO%"\aopalliance\aopalliance\1.0\aopalliance-1.0.jar;"%REPO%"\org\springframework\security\spring-security-core\4.2.3.RELEASE\spring-security-core-4.2.3.RELEASE.jar;"%REPO%"\org\springframework\security\spring-security-web\4.2.3.RELEASE\spring-security-web-4.2.3.RELEASE.jar;"%REPO%"\org\springframework\security\spring-security-config\4.2.3.RELEASE\spring-security-config-4.2.3.RELEASE.jar;"%REPO%"\org\springframework\security\spring-security-taglibs\4.2.3.RELEASE\spring-security-taglibs-4.2.3.RELEASE.jar;"%REPO%"\org\springframework\security\spring-security-acl\4.2.3.RELEASE\spring-security-acl-4.2.3.RELEASE.jar;"%REPO%"\org\slf4j\slf4j-simple\1.7.21\slf4j-simple-1.7.21.jar;"%REPO%"\org\slf4j\slf4j-api\1.7.21\slf4j-api-1.7.21.jar;"%REPO%"\org\apache\commons\commons-lang3\3.5\commons-lang3-3.5.jar;"%REPO%"\jstl\jstl\1.2\jstl-1.2.jar;"%REPO%"\org\postgresql\postgresql\9.4.1212\postgresql-9.4.1212.jar;"%REPO%"\com\fasterxml\jackson\core\jackson-core\2.5.0\jackson-core-2.5.0.jar;"%REPO%"\com\fasterxml\jackson\core\jackson-databind\2.5.0\jackson-databind-2.5.0.jar;"%REPO%"\com\fasterxml\jackson\core\jackson-annotations\2.5.0\jackson-annotations-2.5.0.jar;"%REPO%"\com\google\guava\guava\18.0\guava-18.0.jar;"%REPO%"\com\codahale\metrics\metrics-core\3.0.1\metrics-core-3.0.1.jar;"%REPO%"\commons-fileupload\commons-fileupload\1.3.1\commons-fileupload-1.3.1.jar;"%REPO%"\commons-io\commons-io\2.2\commons-io-2.2.jar;"%REPO%"\org\apache\tomcat\embed\tomcat-embed-core\8.5.23\tomcat-embed-core-8.5.23.jar;"%REPO%"\org\apache\tomcat\tomcat-annotations-api\8.5.23\tomcat-annotations-api-8.5.23.jar;"%REPO%"\org\apache\tomcat\embed\tomcat-embed-jasper\8.5.23\tomcat-embed-jasper-8.5.23.jar;"%REPO%"\org\apache\tomcat\embed\tomcat-embed-el\8.5.23\tomcat-embed-el-8.5.23.jar;"%REPO%"\org\eclipse\jdt\ecj\3.12.3\ecj-3.12.3.jar;"%REPO%"\org\apache\tomcat\tomcat-jasper\8.5.23\tomcat-jasper-8.5.23.jar;"%REPO%"\org\apache\tomcat\tomcat-servlet-api\8.5.23\tomcat-servlet-api-8.5.23.jar;"%REPO%"\org\apache\tomcat\tomcat-juli\8.5.23\tomcat-juli-8.5.23.jar;"%REPO%"\org\apache\tomcat\tomcat-el-api\8.5.23\tomcat-el-api-8.5.23.jar;"%REPO%"\org\apache\tomcat\tomcat-api\8.5.23\tomcat-api-8.5.23.jar;"%REPO%"\org\apache\tomcat\tomcat-util-scan\8.5.23\tomcat-util-scan-8.5.23.jar;"%REPO%"\org\apache\tomcat\tomcat-util\8.5.23\tomcat-util-8.5.23.jar;"%REPO%"\org\apache\tomcat\tomcat-jasper-el\8.5.23\tomcat-jasper-el-8.5.23.jar;"%REPO%"\org\apache\tomcat\tomcat-jsp-api\8.5.23\tomcat-jsp-api-8.5.23.jar;"%REPO%"\ua\varus\antifraud\1.0-SNAPSHOT\antifraud-1.0-SNAPSHOT.jar

set ENDORSED_DIR=
if NOT "%ENDORSED_DIR%" == "" set CLASSPATH="%BASEDIR%"\%ENDORSED_DIR%\*;%CLASSPATH%

if NOT "%CLASSPATH_PREFIX%" == "" set CLASSPATH=%CLASSPATH_PREFIX%;%CLASSPATH%

@REM Reaching here means variables are defined and arguments have been captured
:endInit

%JAVACMD% %JAVA_OPTS%  -classpath %CLASSPATH% -Dapp.name="webapp" -Dapp.repo="%REPO%" -Dapp.home="%BASEDIR%" -Dbasedir="%BASEDIR%" launch.Main %CMD_LINE_ARGS%
if %ERRORLEVEL% NEQ 0 goto error
goto end

:error
if "%OS%"=="Windows_NT" @endlocal
set ERROR_CODE=%ERRORLEVEL%

:end
@REM set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" goto endNT

@REM For old DOS remove the set variables from ENV - we assume they were not set
@REM before we started - at least we don't leave any baggage around
set CMD_LINE_ARGS=
goto postExec

:endNT
@REM If error code is set to 1 then the endlocal was done already in :error.
if %ERROR_CODE% EQU 0 @endlocal


:postExec

if "%FORCE_EXIT_ON_ERROR%" == "on" (
  if %ERROR_CODE% NEQ 0 exit %ERROR_CODE%
)

exit /B %ERROR_CODE%
