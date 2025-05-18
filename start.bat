chcp 65001

set now=%date:~6,4%-%date:~3,2%-%date:~0,2% %time:~0,2%:%time:~3,2%
echo.%now%

:::::::::::::::::::::::::::::::::::::::::::::::::::::
:: mensagem inicial
:::::::::::::::::::::::::::::::::::::::::::::::::::::
:: @ECHO Estamos no drive %cd:~0,2%
:: @ECHO Em %~dp0
@ECHO OFF

:::::::::::::::::::::::::::::::::::::::::::::::::::::
:: variáveis com url para download dos programas complementares
:::::::::::::::::::::::::::::::::::::::::::::::::::::
::set downvscode=https://vscode.download.prss.microsoft.com/dbazure/download/stable/5437499feb04f7a586f677b155b039bc2b3669eb/VSCode-win32-x64-1.90.2.zip
set downvscode=https://vscode.download.prss.microsoft.com/dbazure/download/stable/f1a4fb101478ce6ec82fe9627c43efbf9e98c813/VSCode-win32-x64-1.95.3.zip
set arqvscode=VSCode-win32-x64-1.95.3.zip
set nomevscode=vscode

::link dos arquivos -> mais lento
::set downnetbeans=https://archive.apache.org/dist/netbeans/netbeans/25/netbeans-25-bin.zip
set downnetbeans=https://dlcdn.apache.org/netbeans/netbeans/25/netbeans-25-bin.zip
set arqnetbeans=netbeans-25-bin.zip
set nomenetbeans=netbeans

set downandroidstudio=https://redirector.gvt1.com/edgedl/android/studio/ide-zips/2024.3.2.14/android-studio-2024.3.2.14-windows.zip
set arqandroidstudio=android-studio-2024.3.2.14-windows.zip
set downcommandlinetools=https://dl.google.com/android/repository/commandlinetools-win-13114758_latest.zip
set arqcommandlinetools=commandlinetools-win-13114758_latest.zip
set downplatformtools=https://dl.google.com/android/repository/platform-tools-latest-windows.zip
set arqplatformtools=platform-tools-latest-windows.zip
set downflutter=https://storage.googleapis.com/flutter_infra_release/releases/stable/windows/flutter_windows_3.29.0-stable.zip
set arqflutter=flutter_windows_3.29.0-stable.zip

::set downnode=https://nodejs.org/download/release/v18.19.0/node-v18.19.0-win-x64.zip
::set arqnode=node-v18.19.0-win-x64.zip
::set nomenode=node-v18.19.0-win-x64
set downnode=https://nodejs.org/dist/v22.15.0/node-v22.15.0-win-x64.zip
set arqnode=node-v22.15.0-win-x64.zip
set nomenode=node-v22.15.0-win-x64

::set downjdk=https://download.java.net/java/GA/jdk21.0.2/f2283984656d49d69e91c558476027ac/13/GPL/openjdk-21.0.2_windows-x64_bin.zip
::set arqjdk=openjdk-21.0.2_windows-x64_bin.zip
::set nomejdk=jdk-21.0.2
set downjdk=https://download.java.net/java/GA/jdk17.0.2/dfd4a8d0985749f896bed50d7138ee7f/8/GPL/openjdk-17.0.2_windows-x64_bin.zip
set arqjdk=openjdk-17.0.2_windows-x64_bin.zip
set nomejdk=jdk-17.0.2

set downgradle=https://services.gradle.org/distributions/gradle-8.12-bin.zip
set arqgradle=gradle-8.12-bin.zip
set nomegradle=gradle-8.12

set downmaven=https://dlcdn.apache.org/maven/maven-3/3.9.8/binaries/apache-maven-3.9.8-bin.zip
set arqmaven=apache-maven-3.9.8-bin.zip
set nomemaven=apache-maven-3.9.8

set downmysql=https://dev.mysql.com/get/Downloads/MySQL-8.0/mysql-8.0.39-winx64.zip
set arqmysql=mysql-8.0.39-winx64.zip
set nomemysql=mysql-8.0.39-winx64

set downmariadb=https://dlm.mariadb.com/3829199/MariaDB/mariadb-11.4.2/winx64-packages/mariadb-11.4.2-winx64.zip
set arqmariadb=mariadb-11.4.2-winx64.zip
set nomemariadb=mariadb-11.4.2-winx64

set downgit=https://github.com/git-for-windows/git/releases/download/v2.41.0.windows.3/PortableGit-2.41.0.3-64-bit.7z.exe
set arqgit=PortableGit-2.41.0.3-64-bit.7z.exe

::set downpython=https://www.python.org/ftp/python/3.12.4/python-3.12.4-embed-amd64.zip
set downpython=https://www.python.org/ftp/python/3.13.0/python-3.13.0-amd64.exe
set arqpython=python-3.13.0-amd64.exe
set nomepython=python
set downgetpip=https://bootstrap.pypa.io/get-pip.py

set downdbeaver=https://dbeaver.io/files/dbeaver-ce-latest-win32.win32.x86_64.zip
set arqdbeaver=dbeaver-ce-latest-win32.win32.x86_64.zip
set nomedbeaver=dbeaver-ce-latest-win32.win32.x86_64

set downyed=https://www.yworks.com/resources/yed/demo/yEd-3.23.2.zip
set arqyed=yEd-3.23.2.zip
set nomeyed=yEd-3.23.2

set downneo4j=https://neo4j.com/artifact.php?name=neo4j-community-5.17.0-windows.zip
set arqneo4j=neo4j-community-5.17.0-windows.zip
set nomeneo4j=neo4j-community-5.17.0

set downmongodb=https://fastdl.mongodb.org/windows/mongodb-windows-x86_64-7.0.11.zip
set arqmongodb=mongodb-windows-x86_64-7.0.11.zip
set nomemongodb=mongodb-win32-x86_64-windows-7.0.11

set downmongosh=https://downloads.mongodb.com/compass/mongosh-2.5.1-win32-x64.zip
set arqmongosh=mongosh-2.5.1-win32-x64.zip
set nomemongosh=mongosh-2.5.1-win32-x64

set downputty=https://the.earth.li/~sgtatham/putty/latest/w64/putty.exe

::set downpostgres=https://get.enterprisedb.com/postgresql/postgresql-16.3-2-windows-x64-binaries.zip
::set arqpostgres=postgresql-16.3-2-windows-x64-binaries.zip
set downpostgres=https://get.enterprisedb.com/postgresql/postgresql-15.7-2-windows-x64-binaries.zip
set arqpostgres=postgresql-15.7-2-windows-x64-binaries.zip

::set downnotepad=https://objects.githubusercontent.com/github-production-release-asset-2e65be/33014811/e44d9112-1b97-44d3-b414-9e877a0fda16?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=releaseassetproduction%2F20240909%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20240909T101544Z&X-Amz-Expires=300&X-Amz-Signature=7a33466221bba714917708d253ea2d2d498965055b1582f267f075ba4fcf1c48&X-Amz-SignedHeaders=host&actor_id=28950782&key_id=0&repo_id=33014811&response-content-disposition=attachment%3B%20filename%3Dnpp.8.6.9.portable.x64.zip&response-content-type=application%2Foctet-stream
::set downnotepad=https://github.com/notepad-plus-plus/notepad-plus-plus/releases/download/v8.6.9/npp.8.6.9.portable.7z
set downnotepad=http://download.notepad-plus-plus.org/repository/8.x/8.6.9/npp.8.6.9.portable.x64.zip
set arqnotepad=npp.8.6.9.portable.x64.zip


:::::::::::::::::::::::::::::::::::::::::::::::::::::
:: variaveis de ambiente para o windows
:: configura o caminho para o sdk android
:: para o jdk, node, vscode etc
:: sempre execute os programas usando esse arquivo
:: para ter sempre funcionando corretamente
:::::::::::::::::::::::::::::::::::::::::::::::::::::
set ANDROID_STUDIO_HOME=%~dp0%android\android-studio
set ANDROID_HOME=%~dp0%android\sdk
set ANDROID_SDK_ROOT=%~dp0%android\sdk
set FLUTTER_HOME=%~dp0%flutter
set JAVA_HOME=%~dp0%jdk
set MAVEN_HOME=%~dp0%maven
set NODE_HOME=%~dp0%node
set VSCODE_HOME=%~dp0%vscode
set NETBEANS_HOME=%~dp0%netbeans
set DBEAVER_HOME=%~dp0%dbeaver
set MARIADB_HOME=%~dp0%mariadb
set MYSQL_HOME=%~dp0%mysql
set WGET_HOME=%~dp0%wget
set SEVENZIP_HOME=%~dp0%sevenzip
set NOTEPAD_HOME=%~dp0%notepad
set GIT_HOME=%~dp0%git
set PYTHON_HOME=%~dp0%python
set NEO4J_HOME=%~dp0%neo4j
set MONGODB_HOME=%~dp0%mongodb
set MONGOSH_HOME=%~dp0%mongosh
set PUTTY_HOME=%~dp0%putty
set POSTGRES_HOME=%~dp0%pgsql
set GRADLE_HOME=%~dp0%gradle

SET PGDATA=%POSTGRES_HOME%\data
SET PGDATABASE=postgres
SET PGUSER=postgres
SET PGPORT=5439
SET PGLOCALEDIR=%POSTGRES_HOME%\share\locale

:::::::::::::::::::::::::::::::::::::::::::::::::::::
:: altera o path do windows adicinoando os novos diretórios
:: adiciona o path original no final
:: set PathAUX=%JAVA_HOME%\bin;%NODE_HOME%;%ANDROID_HOME%\platform-tools;%ANDROID_HOME%\tools;%ANDROID_HOME%\emulator;%VSCODE_HOME%;%WGET_HOME%;%SEVENZIP_HOME%;%NOTEPAD_HOME%;%GIT_HOME%\bin
set PathAUX=%JAVA_HOME%\bin;%MAVEN_HOME%\bin;%NODE_HOME%;%ANDROID_HOME%\platform-tools;%ANDROID_HOME%\emulator;%ANDROID_HOME%\tools;%VSCODE_HOME%;%WGET_HOME%;%SEVENZIP_HOME%;%NOTEPAD_HOME%;%GIT_HOME%\bin;%PYTHON_HOME%;%PYTHON_HOME%\Scripts;%NEO4J_HOME%;%MONGODB_HOME%;%MONGOSH_HOME%;%PUTTY_HOME%
set PathAUX=%PathAUX%;%ANDROID_HOME%\cmdline-tools\latest\bin;%ANDROID_HOME%\platform-tools
set PathAUX=%PathAUX%;%POSTGRES_HOME%\bin
set PathAUX=%PathAUX%;%FLUTTER_HOME%\bin
set PathAUX=%PathAUX%;%GRADLE_HOME%\bin
set Path=%PathAUX%;%Path%;
::::::::::::::::::::::::::::::::::::::::::::::::::::


:TOP
cls
@ECHO OFF
color 1F
ECHO -------------------------------------------------------
ECHO     DEVAPP v-3.0 
ECHO.
ECHO            Prof. Rômulo (rfdouro@gmail.com) 
ECHO.
ECHO                                   %now% 
ECHO -------------------------------------------------------
ECHO.
ECHO --^>  SEMPRE EXECUTE OS PROGRAMAS AQUI ("start.bat") ^<--
ECHO. 
ECHO -------------------------------------------------------
ECHO --- OPCOES --------------------------------------------
ECHO ( 0 ) SAIR
ECHO ( 1 ) PROGRAMAÇÃO E BANCO DE DADOS
ECHO ( 2 ) INSTALAÇÕES
ECHO ( 3 ) AUXILIARES
ECHO ::::::::::::::::::::::::::::::::::::::::::::::::::::::::
SET /P UserInput=Escolha uma opcao: 
ECHO.
cls
ECHO Opcao escolhida = %UserInput%
ECHO.
SET /A Evaluated=UserInput
if %Evaluated% EQU %UserInput% (
    IF %UserInput% EQU 0 ( GOTO :EOF )
	IF %UserInput% EQU 1 ( GOTO :Executar )
	IF %UserInput% EQU 2 ( GOTO :Instalar )
	IF %UserInput% EQU 3 ( GOTO :Auxiliares )
) ELSE (
    ECHO Non-Integer
)
GOTO :TOP


:Executar
color E0
ECHO --- OPÇÕES DE EXECUÇÃO ------------------------------
ECHO ( 0 ) Voltar
ECHO -----------------------------------------------------
ECHO ( 1 ) NETBEANS
ECHO ( 2 ) VSCODE
ECHO ( 3 ) ANDROID STUDIO
ECHO ( 4 ) DBEAVER
ECHO ( 41 ) POSTGRES
ECHO ( 42 ) MYSQL
ECHO ( 43 ) MARIADB
ECHO ( 44 ) NEO4J
ECHO ( 45 ) MONGODB
ECHO ( 46 ) MONGOSH
ECHO ( 5 ) PUTTY
ECHO ( 6 ) NOTEPAD++
ECHO :::::::::::::::::::::::::::::::::::::::::::::::::::::
SET /P UserInput=Escolha uma opcao: 
ECHO.
cls
ECHO Opcao escolhida = %UserInput%
ECHO.
SET /A Evaluated=UserInput
if %Evaluated% EQU %UserInput% (
    IF %UserInput% EQU 0 ( GOTO :TOP )
	IF %UserInput% EQU 1 ( GOTO :ExecNETBEANS )
	IF %UserInput% EQU 2 ( GOTO :ExecVSCODE )
    IF %UserInput% EQU 3 ( GOTO :ExecANDROIDSTUDIO )
	IF %UserInput% EQU 4 ( GOTO :ExecDBEAVER )
	IF %UserInput% EQU 41 ( GOTO :ExecPOSTGRES )
    IF %UserInput% EQU 42 ( GOTO :ExecMYSQL )
	IF %UserInput% EQU 43 ( GOTO :ExecMARIADB )
	IF %UserInput% EQU 44 ( GOTO :ExecNEO4J)
    IF %UserInput% EQU 45 ( GOTO :ExecMONGODB )
	IF %UserInput% EQU 46 ( GOTO :ExecMONGOSH )
	IF %UserInput% EQU 5 ( GOTO :ExecPUTTY )
	IF %UserInput% EQU 6 ( GOTO :ExecNOTEPAD )
) ELSE (
    ECHO Non-Integer
)
GOTO :TOP


:Instalar
color A0
ECHO --- OPÇÕES DE INSTALAÇÃO ------------------------------
ECHO ( 0 ) Voltar
ECHO -----------------------------------------------------
ECHO ( 1 ) Instala JDK + Maven
ECHO ( 11 ) NetBeans	
ECHO ( 2 ) Instala VSCODE + Configurações
ECHO ( 3 ) Instala NODE + VueCLI + Git	
ECHO ( 4 ) Instala SDK Android CLI Basico
ECHO ( 41 ) Instalar o Android Studio **Use SDK Android em DEVAPP\android\sdk**
ECHO ( 42 ) Instalar o Flutter SDK
ECHO ( 43 ) Instalar o Gradle
ECHO ( 5 ) Instalar o Postgres + DBeaver
ECHO ( 51 ) Instalar o MySQL
ECHO ( 52 ) Instalar o MariaDB
ECHO ( 53 ) Instalar o Neo4J		
ECHO ( 54 ) Instalar o MongoDB
ECHO ( 541 ) Instalar o MongoSH
ECHO ( 6 ) Instalar o Putty
ECHO ( 7 ) Instalar o PYTHON
ECHO ( 8 ) Instalar o NOTEPAD++
ECHO :::::::::::::::::::::::::::::::::::::::::::::::::::::
SET /P UserInput=Escolha uma opcao: 
ECHO.
cls
ECHO Opcao escolhida = %UserInput%
ECHO.
SET /A Evaluated=UserInput
if %Evaluated% EQU %UserInput% (
	IF %UserInput% EQU 0 ( GOTO :TOP )
	IF %UserInput% EQU 1 ( GOTO :BaixaJDK )
	IF %UserInput% EQU 11 ( GOTO :BaixaNETBEANS )
	IF %UserInput% EQU 2 ( GOTO :BaixaVSCODE )	
	IF %UserInput% EQU 3 ( GOTO :BaixaNode )	
	IF %UserInput% EQU 4 ( GOTO :BaixaSDKANDROID )
	IF %UserInput% EQU 41 ( GOTO :BaixaANDROID )
	IF %UserInput% EQU 42 ( GOTO :BaixaFlutter )
	IF %UserInput% EQU 43 ( GOTO :BaixaGradle )
	IF %UserInput% EQU 5 ( GOTO :BaixaPOSTGRES )
	IF %UserInput% EQU 51 ( GOTO :BaixaMYSQL )		
	IF %UserInput% EQU 52 ( GOTO :BaixaMARIADB )		
	IF %UserInput% EQU 53 ( GOTO :BaixaNEO4J )
	IF %UserInput% EQU 54 ( GOTO :BaixaMongoDB )
	IF %UserInput% EQU 541 ( GOTO :BaixaMongoSH )	
	IF %UserInput% EQU 6 ( GOTO :BaixaPUTTY )
	IF %UserInput% EQU 7 ( GOTO :BaixaPYTHON )	
	IF %UserInput% EQU 8 ( GOTO :BaixaNOTEPAD )
) ELSE (
    ECHO Non-Integer
)
GOTO :TOP

:Auxiliares
color B0
ECHO --- OPÇÕES AUXILIARES ------------------------------
ECHO ( 0 ) Voltar
ECHO -----------------------------------------------------
ECHO ( 1 ) Abrir o CMD	
ECHO ( 2 ) Abrir Visual Paradigm Online
ECHO ( 3 ) Abrir YED Online
ECHO ( 4 ) Abrir Draw.IO
ECHO :::::::::::::::::::::::::::::::::::::::::::::::::::::
SET /P UserInput=Escolha uma opcao: 
ECHO.
cls
ECHO Opcao escolhida = %UserInput%
ECHO.
SET /A Evaluated=UserInput
if %Evaluated% EQU %UserInput% (
	IF %UserInput% EQU 0 ( GOTO :TOP )
	IF %UserInput% EQU 1 ( GOTO :AbreCMD )
	IF %UserInput% EQU 2 ( GOTO :AbreVisualParadigm )
	IF %UserInput% EQU 3 ( GOTO :AbreYed )
	IF %UserInput% EQU 4 ( GOTO :AbreDrawIO )
) ELSE (
    ECHO Non-Integer
)
GOTO :TOP






:::::::::::::::::::::::::::::::::::::::::::::::::::::
:::::::::::::::::::::::::::::::::::::::::::::::::::::
:: 
:: seção de execuções
::
:::::::::::::::::::::::::::::::::::::::::::::::::::::
:::::::::::::::::::::::::::::::::::::::::::::::::::::

:AbreCMD
:: ECHO %~dp0
start "CMD" cmd /c "start"
GOTO :TOP

:AbreVisualParadigm
start https://online.visual-paradigm.com/pt/diagrams/solutions/free-visual-paradigm-online/
GOTO :TOP

:AbreYed
start https://www.yworks.com/yed-live/
GOTO :TOP

:AbreDrawIO
start https://app.diagrams.net/
GOTO :TOP

:ExecVSCODE
IF EXIST "%VSCODE_HOME%\code.exe" (
	::start "VSCode" cmd /c "start %VSCODE_HOME%\code.exe --extensions-dir %VSCODE_HOME%\extensions --user-data-dir %VSCODE_HOME%\userdir"
	cmd /c start "" "%VSCODE_HOME%\code.exe" --extensions-dir "%VSCODE_HOME%\extensions" --user-data-dir "%VSCODE_HOME%\userdir"
) ELSE (
	color 4F
	ECHO VSCODE NAO INSTALADO - USE A OPCAO DE INSTALACAO
	ECHO ......................................
	PAUSE
)
GOTO :TOP

:ExecNETBEANS
IF EXIST "%NETBEANS_HOME%\bin\netbeans64.exe" (
	::start "Netbeans" cmd /c "start %NETBEANS_HOME%\bin\netbeans64.exe --jdkhome %JAVA_HOME%"
	cmd /c start "" "%NETBEANS_HOME%\bin\netbeans64.exe" --jdkhome "%JAVA_HOME%"
) ELSE (
	color 4F
	ECHO NETBEANS NAO INSTALADO - USE A OPCAO DE INSTALACAO
	ECHO ......................................
	PAUSE
)
GOTO :TOP

:ExecDBEAVER
IF EXIST "%DBEAVER_HOME%\dbeaver.exe" (
	::start "%DBEAVER_HOME%"\dbeaver.exe
	start "" "%DBEAVER_HOME%\dbeaver.exe"
) ELSE (
	color 4F
	ECHO DBEAVER NAO INSTALADO - USE A OPCAO DE INSTALACAO
	ECHO ......................................
	PAUSE
)
GOTO :TOP

:ExecANDROIDSTUDIO
IF EXIST "%ANDROID_STUDIO_HOME%\bin\studio64.exe" (
	start "" "%ANDROID_STUDIO_HOME%\bin\studio64.exe"
) ELSE (
	color 4F
	ECHO ANDROID STUDIO NAO INSTALADO - USE A OPCAO DE INSTALACAO
	ECHO ......................................
	PAUSE
)
GOTO :TOP

:ExecNOTEPAD
:: ECHO %~dp0
start notepad++
GOTO :TOP

:ExecNEO4J
IF EXIST "%NEO4J_HOME%\bin\neo4j.bat" (
	start "NEO4J" "%NEO4J_HOME%\bin\neo4j.bat" console
) ELSE (
	color 4F
	ECHO NEO4J NAO INSTALADO - USE A OPCAO DE INSTALACAO
	ECHO ......................................
	PAUSE
)
GOTO :TOP

:ExecMONGODB
IF EXIST "%MONGODB_HOME%\bin\mongod.exe" (
	::start "MongoDB" cmd /c %MONGODB_HOME%\bin\mongod.exe --dbpath %MONGODB_HOME%\data
	cmd /c start "MongoDB" "%MONGODB_HOME%\bin\mongod.exe" --dbpath "%MONGODB_HOME%\data"
) ELSE (
	color 4F
	ECHO MONGODB NAO INSTALADO - USE A OPCAO DE INSTALACAO
	ECHO ......................................
	PAUSE
)
GOTO :TOP

:ExecMongoSH
IF EXIST "%MONGOSH_HOME%\bin\mongosh.exe" (
	::start "MongoSH" cmd /c %MONGOSH_HOME%\bin\mongosh.exe
	cmd /c start "MongoSH" "%MONGOSH_HOME%\bin\mongosh.exe"
) ELSE (
	color 4F
	ECHO MONGOSH NAO INSTALADO - USE A OPCAO DE INSTALACAO
	ECHO ......................................
	PAUSE
)
GOTO :TOP


:ExecPUTTY
IF EXIST "%PUTTY_HOME%\putty.exe" (
	::start %PUTTY_HOME%\putty.exe
	cmd /c start "Putty" "%PUTTY_HOME%\putty.exe"
) ELSE (
	color 4F
	ECHO PUTTY NAO INSTALADO - USE A OPCAO DE INSTALACAO
	ECHO ......................................
	PAUSE
)
GOTO :TOP

:ExecMYSQL
IF EXIST "%MYSQL_HOME%\bin\mysqld.exe" (
	start "MYSQL" cmd /c "ECHO ATENCAO & ECHO --------------------------------------- & ECHO Nao feche essa janela enquanto estiver usando o MySQL & ECHO O MySQL estara rodando na porta 3360 com usuario root sem senha & ECHO --------------------------------------- & pause & "%MYSQL_HOME%\bin\mysqld" --initialize-insecure & "%MYSQL_HOME%\bin\mysqld" --standalone --console --datadir="%MYSQL_HOME%\data" --port=3360"
) ELSE (
	color 4F
	ECHO MYSQL NAO INSTALADO - USE A OPCAO DE INSTALACAO
	ECHO ......................................
	PAUSE
)
GOTO :TOP

:ExecMARIADB
IF EXIST "%MARIADB_HOME%\bin\mysql_install_db.exe" (
	start "Mariadb" cmd /c "ECHO ATENCAO & ECHO --------------------------------------- & ECHO Nao feche essa janela enquanto estiver usando o MariaDB & ECHO O MariaDB estara rodando na porta 3360 e a senha e SECRET & ECHO --------------------------------------- & pause & "%MARIADB_HOME%"\bin\mysql_install_db --password=SECRET & "%MARIADB_HOME%"\bin\mysqld --port=3360 --console"
) ELSE (
	color 4F
	ECHO MARIADB NAO INSTALADO - USE A OPCAO DE INSTALACAO
	ECHO ......................................
	PAUSE
)
GOTO :Top

::caso feche a janela e não consiga parar ou reiniciar
::o postgres posteriormente, deve interromper o seu processo
::busque o PID usando o seguinte comando
::     tasklist /FI "ImageName eq postgres.exe"
::após encontrar interrompa com o seguinte comando
::     taskkill /F /PID 18932
::118932 deve ser substituido pelo id correspondente
::
::ou usando
::     taskkill /F /IM "postgres.exe"
:ExecPOSTGRES
::Dica dada em https://gist.github.com/windsting/920872a03df9a6293179252752a56e6a
IF EXIST "%POSTGRES_HOME%\bin\initdb.exe" (
	ECHO Postgres existe
) ELSE (
	color 4F
	ECHO POSTGRES NAO INSTALADO - USE A OPCAO DE INSTALACAO
	ECHO ......................................
	PAUSE
	GOTO :TOP
)

IF EXIST "%POSTGRES_HOME%\data" (
	ECHO Postgres tem instancia.	
) ELSE (
	ECHO Primeira execucao do postgres.
	"%POSTGRES_HOME%\bin\initdb" -U postgres -A trust
)
::interrompe o postgres caso esteja rodando
taskkill /F /IM "postgres.exe"
start "postgres" cmd /c "ECHO ATENCAO & ECHO --------------------------------------- & ECHO Nao feche essa janela enquanto estiver usando o postgres & ECHO O postgres estara rodando na porta %PGPORT% & ECHO --------------------------------------- & pause & "%POSTGRES_HOME%"\bin\pg_ctl -D "%POSTGRES_HOME%"\data -l "%POSTGRES_HOME%"\logfile start && ECHO para fechar o banco continue abaixo... && PAUSE && "%POSTGRES_HOME%"\bin\pg_ctl -D "%POSTGRES_HOME%"\data stop"

GOTO :TOP

:::::::::::::::::::::::::::::::::::::::::::::::::::::
:::::::::::::::::::::::::::::::::::::::::::::::::::::
:: 
:: seção de instalações 
::
:::::::::::::::::::::::::::::::::::::::::::::::::::::
:::::::::::::::::::::::::::::::::::::::::::::::::::::


:ExecINSTEXTVSCODE
:: executa o vscode indicando o caminho das extensões
:: mais em https://code.visualstudio.com/docs/editor/extension-marketplace#_common-questions
:: mais em https://code.visualstudio.com/docs/editor/command-line
:: mais em https://code.visualstudio.com/docs/editor/command-line#_advanced-cli-options
:: ECHO %~dp0
ECHO ---------------------------------------
@ECHO Instalacao de extensoes do VSCODE
@ECHO OFF
ECHO Em %VSCODE_HOME%
ECHO ---------------------------------------
::pause
cd "%VSCODE_HOME%\bin\"
call code --extensions-dir "%VSCODE_HOME%\extensions" --user-data-dir "%VSCODE_HOME%\userdir" --install-extension christian-kohler.npm-intellisense ^
&& call code --extensions-dir "%VSCODE_HOME%\extensions" --user-data-dir "%VSCODE_HOME%\userdir" --install-extension christian-kohler.path-intellisense ^
&& call code --extensions-dir "%VSCODE_HOME%\extensions" --user-data-dir "%VSCODE_HOME%\userdir" --install-extension dbaeumer.vscode-eslint ^
&& call code --extensions-dir "%VSCODE_HOME%\extensions" --user-data-dir "%VSCODE_HOME%\userdir" --install-extension editorconfig.editorconfig ^
&& call code --extensions-dir "%VSCODE_HOME%\extensions" --user-data-dir "%VSCODE_HOME%\userdir" --install-extension esbenp.prettier-vscode ^
&& call code --extensions-dir "%VSCODE_HOME%\extensions" --user-data-dir "%VSCODE_HOME%\userdir" --install-extension formulahendry.auto-close-tag ^
&& call code --extensions-dir "%VSCODE_HOME%\extensions" --user-data-dir "%VSCODE_HOME%\userdir" --install-extension formulahendry.auto-rename-tag ^
&& call code --extensions-dir "%VSCODE_HOME%\extensions" --user-data-dir "%VSCODE_HOME%\userdir" --install-extension formulahendry.code-runner ^
&& call code --extensions-dir "%VSCODE_HOME%\extensions" --user-data-dir "%VSCODE_HOME%\userdir" --install-extension formulahendry.dotnet ^
&& call code --extensions-dir "%VSCODE_HOME%\extensions" --user-data-dir "%VSCODE_HOME%\userdir" --install-extension grogdunn.netbeans-keybindings ^
&& call code --extensions-dir "%VSCODE_HOME%\extensions" --user-data-dir "%VSCODE_HOME%\userdir" --install-extension hollowtree.vue-snippets ^
&& call code --extensions-dir "%VSCODE_HOME%\extensions" --user-data-dir "%VSCODE_HOME%\userdir" --install-extension jakewilson.vscode-cdnjs ^
&& call code --extensions-dir "%VSCODE_HOME%\extensions" --user-data-dir "%VSCODE_HOME%\userdir" --install-extension jmrog.vscode-nuget-package-manager ^
&& call code --extensions-dir "%VSCODE_HOME%\extensions" --user-data-dir "%VSCODE_HOME%\userdir" --install-extension juhahinkula.thymeleaf ^
&& call code --extensions-dir "%VSCODE_HOME%\extensions" --user-data-dir "%VSCODE_HOME%\userdir" --install-extension mrmlnc.vscode-scss ^
&& call code --extensions-dir "%VSCODE_HOME%\extensions" --user-data-dir "%VSCODE_HOME%\userdir" --install-extension ms-dotnettools.csharp ^
&& call code --extensions-dir "%VSCODE_HOME%\extensions" --user-data-dir "%VSCODE_HOME%\userdir" --install-extension ms-dotnettools.vscode-dotnet-runtime ^
&& call code --extensions-dir "%VSCODE_HOME%\extensions" --user-data-dir "%VSCODE_HOME%\userdir" --install-extension obrejla.netbeans-light-theme ^
&& call code --extensions-dir "%VSCODE_HOME%\extensions" --user-data-dir "%VSCODE_HOME%\userdir" --install-extension octref.vetur ^
&& call code --extensions-dir "%VSCODE_HOME%\extensions" --user-data-dir "%VSCODE_HOME%\userdir" --install-extension pkief.material-icon-theme ^
&& call code --extensions-dir "%VSCODE_HOME%\extensions" --user-data-dir "%VSCODE_HOME%\userdir" --install-extension redhat.fabric8-analytics ^
&& call code --extensions-dir "%VSCODE_HOME%\extensions" --user-data-dir "%VSCODE_HOME%\userdir" --install-extension redhat.java ^
&& call code --extensions-dir "%VSCODE_HOME%\extensions" --user-data-dir "%VSCODE_HOME%\userdir" --install-extension redhat.vscode-community-server-connector ^
&& call code --extensions-dir "%VSCODE_HOME%\extensions" --user-data-dir "%VSCODE_HOME%\userdir" --install-extension redhat.vscode-rsp-ui ^
&& call code --extensions-dir "%VSCODE_HOME%\extensions" --user-data-dir "%VSCODE_HOME%\userdir" --install-extension redhat.vscode-server-connector ^
&& call code --extensions-dir "%VSCODE_HOME%\extensions" --user-data-dir "%VSCODE_HOME%\userdir" --install-extension redhat.vscode-xml ^
&& call code --extensions-dir "%VSCODE_HOME%\extensions" --user-data-dir "%VSCODE_HOME%\userdir" --install-extension ritwickdey.liveserver ^
&& call code --extensions-dir "%VSCODE_HOME%\extensions" --user-data-dir "%VSCODE_HOME%\userdir" --install-extension visualstudioexptteam.intellicode-api-usage-examples ^
&& call code --extensions-dir "%VSCODE_HOME%\extensions" --user-data-dir "%VSCODE_HOME%\userdir" --install-extension visualstudioexptteam.vscodeintellicode ^
&& call code --extensions-dir "%VSCODE_HOME%\extensions" --user-data-dir "%VSCODE_HOME%\userdir" --install-extension vmware.vscode-boot-dev-pack ^
&& call code --extensions-dir "%VSCODE_HOME%\extensions" --user-data-dir "%VSCODE_HOME%\userdir" --install-extension vmware.vscode-spring-boot ^
&& call code --extensions-dir "%VSCODE_HOME%\extensions" --user-data-dir "%VSCODE_HOME%\userdir" --install-extension vscjava.vscode-java-debug ^
&& call code --extensions-dir "%VSCODE_HOME%\extensions" --user-data-dir "%VSCODE_HOME%\userdir" --install-extension vscjava.vscode-java-dependency ^
&& call code --extensions-dir "%VSCODE_HOME%\extensions" --user-data-dir "%VSCODE_HOME%\userdir" --install-extension vscjava.vscode-java-pack ^
&& call code --extensions-dir "%VSCODE_HOME%\extensions" --user-data-dir "%VSCODE_HOME%\userdir" --install-extension vscjava.vscode-java-test ^
&& call code --extensions-dir "%VSCODE_HOME%\extensions" --user-data-dir "%VSCODE_HOME%\userdir" --install-extension vscjava.vscode-maven ^
&& call code --extensions-dir "%VSCODE_HOME%\extensions" --user-data-dir "%VSCODE_HOME%\userdir" --install-extension vscjava.vscode-spring-boot-dashboard ^
&& call code --extensions-dir "%VSCODE_HOME%\extensions" --user-data-dir "%VSCODE_HOME%\userdir" --install-extension vscjava.vscode-spring-initializr ^
&& call code --extensions-dir "%VSCODE_HOME%\extensions" --user-data-dir "%VSCODE_HOME%\userdir" --install-extension vscode-icons-team.vscode-icons ^
&& call code --extensions-dir "%VSCODE_HOME%\extensions" --user-data-dir "%VSCODE_HOME%\userdir" --install-extension vue.volar ^
&& call code --extensions-dir "%VSCODE_HOME%\extensions" --user-data-dir "%VSCODE_HOME%\userdir" --install-extension yzhang.markdown-all-in-one ^
&& call code --extensions-dir "%VSCODE_HOME%\extensions" --user-data-dir "%VSCODE_HOME%\userdir" --install-extension zignd.html-css-class-completion ^
&& call code --extensions-dir "%VSCODE_HOME%\extensions" --user-data-dir "%VSCODE_HOME%\userdir" --install-extension wscats.vue ^
&& call code --extensions-dir "%VSCODE_HOME%\extensions" --user-data-dir "%VSCODE_HOME%\userdir" --install-extension mechatroner.rainbow-csv ^
&& call code --extensions-dir "%VSCODE_HOME%\extensions" --user-data-dir "%VSCODE_HOME%\userdir" --install-extension samuel-weinhardt.vscode-jsp-lang ^
&& call code --extensions-dir "%VSCODE_HOME%\extensions" --user-data-dir "%VSCODE_HOME%\userdir" --install-extension alexisvt.flutter-snippets ^
&& call code --extensions-dir "%VSCODE_HOME%\extensions" --user-data-dir "%VSCODE_HOME%\userdir" --install-extension dart-code.dart-code ^
&& call code --extensions-dir "%VSCODE_HOME%\extensions" --user-data-dir "%VSCODE_HOME%\userdir" --install-extension dart-code.flutter ^
&& call code --extensions-dir "%VSCODE_HOME%\extensions" --user-data-dir "%VSCODE_HOME%\userdir" --install-extension rexthedev.flutter-preview ^

pause
GOTO :TOP

:ExecINSTVUE
:: ECHO %~dp0
start "Instala vue" cmd /c "npm i -g @vue/cli"
GOTO :TOP


:::::::::::::::::::::::::::::::::::::::::::::::::::::
:::::::::::::::::::::::::::::::::::::::::::::::::::::
:: 
:: seção de instalações de programas
::
:::::::::::::::::::::::::::::::::::::::::::::::::::::
:::::::::::::::::::::::::::::::::::::::::::::::::::::

:BaixaVSCODE
:: ECHO %~dp0
cd "%VSCODE_HOME%"
wget %downvscode%
7za x %arqvscode%
del /F %arqvscode%
mkdir userdir
cd userdir 
mkdir User
cd %~dp0
copy settings.json "%VSCODE_HOME%\userdir\User"
::pause
::GOTO :TOP
GOTO :ExecINSTEXTVSCODE

:::::: ok
:BaixaANDROID
:: ECHO %~dp0
cd "%ANDROID_STUDIO_HOME%"
cd..
wget %downandroidstudio%
7za x %arqandroidstudio%
del %arqandroidstudio%
pause
GOTO :TOP

:::::: ok
:BaixaFlutter
:: ECHO %~dp0
cd %~dp0
wget %downflutter%
if exist flutter (
	rmdir /S /Q flutter
)
7za x %arqflutter% 
del /F %arqflutter%
pause
GOTO :TOP

:::::: ok
:BaixaGradle
:: ECHO %~dp0
cd %~dp0
wget %downgradle%
if exist gradle (
	rmdir /S /Q gradle
)
7za x %arqgradle% 
del /F %arqgradle%
ren %nomegradle% gradle
cd %~dp0
pause
GOTO :TOP

:::::: ok
:BaixaSDKANDROID
:: ECHO %~dp0
cd "%ANDROID_HOME%"
wget %downcommandlinetools%
wget %downplatformtools%
7za x %arqcommandlinetools% -ocmdline-tools
cd cmdline-tools
ren cmdline-tools latest
cd..
del %arqcommandlinetools%*
7za x %arqplatformtools%
del %arqplatformtools%*
pause
GOTO :TOP

:BaixaNode
:: ECHO %~dp0
cd %~dp0
wget %downnode%
if exist node (
	rmdir /S /Q node
)
7za x %arqnode% 
del /F %arqnode%
ren %nomenode% node
start "VueCLI" cmd /c "npm install -g @vue/cli"
cd %~dp0
GOTO :BaixaGIT

:BaixaJDK
:: ECHO %~dp0
cd %~dp0
if exist jdk (
	rmdir /S /Q jdk
)
wget %downjdk%
7za x %arqjdk%
del /F %arqjdk% 
ren %nomejdk% jdk
cd %~dp0
GOTO :BaixaMaven

:BaixaMaven
:: ECHO %~dp0
cd %~dp0
wget %downmaven%
if exist maven (
	rmdir /S /Q maven
)
7za x %arqmaven% 
del /F %arqmaven%
ren %nomemaven% maven
cd %~dp0
GOTO :TOP

:BaixaNETBEANS
:: ECHO %~dp0
cd %~dp0
if exist "%NETBEANS_HOME%" (
	rmdir /q /s "%NETBEANS_HOME%"
)
:: mkdir %NETBEANS_HOME%
wget %downnetbeans%
7za x %arqnetbeans%
del /F %arqnetbeans%
pause
GOTO :TOP

:BaixaNOTEPAD
cd %~dp0
if exist "%NOTEPAD_HOME%" (
	rmdir /q /s "%NOTEPAD_HOME%"
)
wget --auth-no-challenge %downnotepad% 
::wget --no-check-certificate %downnotepad% -o %arqnotepad%
7za x %arqnotepad% -onotepad
del /F %arqnotepad%
pause
GOTO :Top

:BaixaGIT
:: ECHO %~dp0
cd %~dp0
if exist git (
	rmdir /S /Q git
)
mkdir git
cd "%GIT_HOME%"
wget %downgit%
7za x %arqgit%
del /F %arqgit%
pause
cd %~dp0
GOTO :TOP

:BaixaDBEAVER
:: ECHO %~dp0
cd %~dp0
wget %downdbeaver%
7za x %arqdbeaver%
del /F %arqdbeaver%
pause
GOTO :TOP

:BaixaMYSQL
:: ECHO %~dp0
cd %~dp0
wget %downmysql%
if exist mysql (
	rmdir /S /Q mysql
)
7za x %arqmysql% 
del /F %arqmysql%
ren %nomemysql% mysql
GOTO :TOP

:BaixaMARIADB
:: ECHO %~dp0
cd %~dp0
wget %downmariadb%
if exist mariadb (
	rmdir /S /Q mariadb
)
7za x %arqmariadb% 
del /F %arqmariadb%
ren %nomemariadb% mariadb
GOTO :Top

:BaixaPOSTGRES
:: ECHO %~dp0
cd %~dp0
wget %downpostgres%
if exist pgsql (
	rmdir /S /Q pgsql
)
7za x %arqpostgres% 
del /F %arqpostgres%
GOTO :BaixaDBEAVER
::GOTO :TOP

:BaixaPYTHON
:: ECHO %~dp0
cd %~dp0
if exist "%PYTHON_HOME%" (
	rmdir /S /Q "%PYTHON_HOME%"
)
mkdir "%PYTHON_HOME%"
::cd "%PYTHON_HOME%"
wget --no-check-certificate %downpython%
::7za x %arqpython%
%arqpython% InstallAllUsers=0 Include_launcher=0 Include_test=0 DefaultJustForMeTargetDir="%PYTHON_HOME%" SimpleInstall=1 SimpleInstallDescription="Instala em %PYTHON_HOME%"
del /F %arqpython%
::wget --no-check-certificate %downgetpip%
::call python get-pip.py
::echo Lib\site-packages >> python312._pth
pause
GOTO :TOP

:BaixaYED
:: ECHO %~dp0
cd %~dp0
wget %downyed%
rmdir /S /Q "%YED_HOME%"
7za x %arqyed% 
del /F %arqyed%
ren %nomeyed% yed
pause
GOTO :TOP

:ExecYED
:: ECHO %~dp0
cd "%YED_HOME%"
start "YED" cmd /c "java -jar yed.jar"
GOTO :TOP


:BaixaNEO4J
:: ECHO %~dp0
cd %~dp0
wget %downneo4j% -O %arqneo4j%
if exist "%NEO4J_HOME%" (
	rmdir /S /Q "%NEO4J_HOME%"
)
7za x %arqneo4j%
del /F %arqneo4j%
ren %nomeneo4j% neo4j
pause
GOTO :TOP

:BaixaMongoDB
:: ECHO %~dp0
cd %~dp0
wget %downmongodb% -O %arqmongodb%
if exist "%MONGODB_HOME%" (
	rmdir /S /Q "%MONGODB_HOME%"
)
7za x %arqmongodb%
del /F %arqmongodb%
ren %nomemongodb% mongodb
mkdir "%MONGODB_HOME%\data"
pause
GOTO :TOP

:BaixaMongoSH
:: ECHO %~dp0
cd %~dp0
wget --no-check-certificate %downmongosh% -O %arqmongosh%
if exist "%MONGOSH_HOME%" (
	rmdir /S /Q "%MONGOSH_HOME%"
)
7za x %arqmongosh%
del /F %arqmongosh%
pause
ren %nomemongosh% mongosh
pause
GOTO :TOP

:BaixaPUTTY
:: ECHO %~dp0
cd %~dp0
if exist "%PUTTY_HOME%" (
	rmdir /S /Q "%PUTTY_HOME%"	
)
mkdir "%PUTTY_HOME%"
cd "%PUTTY_HOME%"
wget %downputty%
pause
GOTO :TOP
