tmux

-- Lancement mysql
cd pweb/mysql..../bin 
./mysqld

-- Mot de passe root
alter user 'root'@'localhost' identified by 'totororo';
flush privileges;

-- Injection export
mysql -u root -ppweb pweb_international < ../../Dump20191120.sql 


-- Run
export LD_LIBRARY_PATH=/home/sfrenot/pweb/mysql-8.0.18-linux-x86_64-minimal/lib
python manage.py runserver tc-net3.insa-lyon.fr:8000




