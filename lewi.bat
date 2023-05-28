@echo off
set /p repo="Masukkan Kode Repository: "
echo Nama Anda adalah %repo%
cd c://xampp/htdocs
git clone http://github.com/abiisaleh/%repo%.git
cd %repo%
copy env .env
copy php.ini c://xampp/php/php.ini
start c://xampp/mysql_start.bat
composer update
php spark db:create %repo%
php spark migrate
php spark db:seed Demo
php spark auth:create_user admin admin@demo.com
php spark auth:set_password admin 1234demo
php spark auth:create_user guru guru@demo.com
php spark auth:set_password guru 1234demo
php spark auth:create_user siswa siswa@demo.com
php spark auth:set_password siswa 1234demo
php spark auth:create_group admin 'kelola data master'
php spark auth:create_group guru 'kelola data siswa per kelas'
php spark auth:create_group siswa 'kelola data pribadi'
php spark serve
