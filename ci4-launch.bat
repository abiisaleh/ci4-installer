@echo off

:::        _     _ _           _      _     
:::   __ _| |__ (_|_)___  __ _| | ___| |__  
:::  / _` | '_ \| | / __|/ _` | |/ _ \ '_ \ 
::: | (_| | |_) | | \__ \ (_| | |  __/ | | |
:::  \__,_|_.__/|_|_|___/\__,_|_|\___|_| |_|
::: 
:::    wa: 082238204776 | t.me/abiisaleh
:::  install composer, xampp, git bash dulu
:::         lakukan install hanya 1x
:::
for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo(%%A      

set /p repo="Masukkan Kode Repository: "

:install
set /p choice="Mau apa cok? (install / run / update): "

if "%choice%"=="install" (
    cd c://xampp/htdocs
    git clone http://github.com/abiisaleh/%repo%.git
    cd %repo%
    copy env .env
    copy php.ini c://xampp/php/php.ini
    composer update & call start c://xampp/mysql_start.bat & install-db.bat & start php spark serve & start msedge http://localhost:8080
) else if "%choice%"=="run" (
    cd c://xampp/htdocs
    cd %repo%
    start c://xampp/mysql_start.bat & start php spark serve
    start msedge http://localhost:8080
) else if "%choice%"=="update" (
    cd c://xampp/htdocs
    cd %repo%
    git pull
) else (
    echo Pilihan salah cok... masukkan "install" atau "run" atau "update".
    echo.
    goto install
)
