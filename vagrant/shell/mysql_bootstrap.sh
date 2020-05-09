sudo yum install -y wget
wget https://dev.mysql.com/get/mysql57-community-release-el7-8.noarch.rpm
sudo yum install -y mysql57-community-release-el7-8.noarch.rpm
sudo yum -y update
sudo yum -y install mysql-server

sudo systemctl start mysqld
sudo systemctl enable mysqld

MYSQL_TEMP_PWD=`sudo cat /var/log/mysqld.log | grep 'A temporary password is generated' | awk -F'root@localhost: ' '{print $2}'`
mysqladmin -u root -p`echo $MYSQL_TEMP_PWD` password 'Passw0rd!'

cat << EOF > .my.cnf
[client]
user=root
password='Passw0rd!'
EOF

sudo systemctl restart mysqld

mysql -u root -pPassw0rd! -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'Passw0rd!'; FLUSH privileges;"
mysql -u root -pPassw0rd! -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'gateway' IDENTIFIED BY 'Passw0rd!'; FLUSH privileges;"
mysql -u root -pPassw0rd! -e "CREATE DATABASE IF NOT EXISTS playground"
mysql -u root -pPassw0rd! -e "CREATE USER 'playground'@'%' IDENTIFIED BY 'playground'; GRANT ALL PRIVILEGES ON *.* TO 'playground'@'%' WITH GRANT OPTION;
FLUSH privileges;"



