@echo off

:::        _     _ _           _      _     
:::   __ _| |__ (_|_)___  __ _| | ___| |__  
:::  / _` | '_ \| | / __|/ _` | |/ _ \ '_ \ 
::: | (_| | |_) | | \__ \ (_| | |  __/ | | |
:::  \__,_|_.__/|_|_|___/\__,_|_|\___|_| |_|
::: 
:::    wa: 082238204776 | t.me/abiisaleh
:::  install composer, xampp, git bash dulu
:::
for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo(%%A      

set /p repo="Masukkan Kode Repository: "

IF NOT EXIST "c://xampp/htdocs/%repo%" (
    cd c://xampp/htdocs
    git clone http://github.com/abiisaleh/%repo%.git
    cd %repo%
    copy env .env
    copy php.ini c://xampp/php/php.ini
    composer update & call start c://xampp/mysql_start.bat & install-db.bat & start php spark serve & start msedge http://localhost:8080 & EXIT
)

:install
set /p choice="Mau apa cok? ( run / update): "

IF "%choice%"=="run" (
    cd c://xampp/htdocs
    cd %repo%
    start c://xampp/mysql_start.bat & start php spark serve
    start msedge http://localhost:8080
    EXIT
) ELSE IF "%choice%"=="update" (
    cd c://xampp/htdocs
    cd %repo%
    git pull
    EXIT
) ELSE (
    echo Pilihan salah cok... masukkan "run" atau "update".
    echo.
    goto install
)
