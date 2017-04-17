#!/bin/bash
sudo apt-get --assume-yes update
sudo apt-get --assume-yes install build-essential
sudo apt-get --assume-yes install virtualbox
#database password for root user
sudo debconf-set-selections <<< 'mysql-server-5.7 mysql-server/root_password password '$1''
sudo debconf-set-selections <<< 'mysql-server-5.7 mysql-server/root_password_again password '$1''
sudo apt-get --assume-yes install mysql-server
sudo apt-get --assume-yes install libmysqlclient-dev

#create ctf user
mysql -uroot -p$1 -e "CREATE USER 'ctf'@localhost IDENTIFIED BY '$2';"
mysql -uroot -p$1 -e "GRANT ALL PRIVILEGES ON * . * TO 'ctf'@localhost;"
echo "Success"


sudo apt-get --assume-yes install python-pip
sudo apt-get --assume-yes install python-dev
/usr/bin/yes | sudo pip install virtualenv
git clone https://github.com/ucrcyber/ictf-framework
cd ictf-framework
virtualenv ictf_env
source ictf_env/bin/activate
/usr/bin/yes | sudo pip install flask
/usr/bin/yes | sudo pip install tornado
/usr/bin/yes | sudo pip install mysql-python
#commandline arg for password
sed -i '3s/.*/MYSQL_DATABASE_PASSWORD = \"'$2'\"/g' database/settings.py
