@echo off
set /p repo="Masukkan Kode Repository: "
echo Nama Anda adalah %repo%
cd c://xampp/htdocs
git clone http://github.com/abiisaleh/%repo%.git
cd %repo%
copy env .env
copy php.ini c://xampp/php/php.ini
composer update
:: start c://xampp/mysql_start.bat
start install-db.bat
