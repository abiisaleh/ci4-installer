@echo off

echo        _     _ _           _      _     
echo   __ _| |__ (_|_)___  __ _| | ___| |__  
echo  / _` | '_ \| | / __|/ _` | |/ _ \ '_ \ 
echo | (_| | |_) | | \__ \ (_| | |  __/ | | |
echo  \__,_|_.__/|_|_|___/\__,_|_|\___|_| |_|
echo  
echo    wa: 082238204776 | t.me/abiisaleh
echo      lakukan install hanya 1x
echo          

set /p repo="Masukkan Kode Repository: "

:install
set /p choice="Mau apa cok? (install / run / update): "

if "%choice%"=="install" (
    cd c://xampp/htdocs
    git clone http://github.com/abiisaleh/%repo%.git
    cd %repo%
    copy env .env
    copy php.ini c://xampp/php/php.ini
    composer update & call start c://xampp/mysql_start.bat & call install-db.bat & call php spark serve
) else if "%choice%"=="run" (
    cd c://xampp/htdocs
    cd %repo%
    php spark serve
) else if "%choice%"=="update" (
    cd c://xampp/htdocs
    cd %repo%
    git pull
) else (
    echo Pilihan salah cok... masukkan "yes" atau "no".
    goto install
)
