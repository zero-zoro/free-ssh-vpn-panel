#!/bin/bash
#coded by: zoro-zero
ashghal1=`cat /etc/hosts | grep -w rabin.cf`
if [ "${ashghal1}" == "" ]; then
sudo echo "127.0.0.1  rabin.cf" >> /etc/hosts
fi
sed -i 's/#Port 22/Port 22/' /etc/ssh/sshd_config
po=$(cat /etc/ssh/sshd_config | grep "^Port")
port=$(echo "$po" | sed "s/Port //g")
adminuser=$(mysql -N -e "use ShaHaN; select adminuser from setting where id='1';")
adminpass=$(mysql -N -e "use ShaHaN; select adminpassword from setting where id='1';")
clear
if [ "$adminuser" != "" ]; then
adminusername=$adminuser
adminpassword=$adminpass
else
adminusername=admin
echo -e "\nPlease input Panel admin user."
printf "Default user name is \e[33m${adminusername}\e[0m, let it blank to use this user name: "
read usernametmp
if [[ -n "${usernametmp}" ]]; then
    adminusername=${usernametmp}
fi
adminpassword=123456
echo -e "\nPlease input Panel admin password."
printf "Default password is \e[33m${adminpassword}\e[0m, let it blank to use this password : "
read passwordtmp
if [[ -n "${passwordtmp}" ]]; then
    adminpassword=${passwordtmp}
fi
fi
printf "tof to kose nanat shahan :-*\n"
sleep 2
ipv4=$(curl https://ipv4.icanhazip.com)
sudo sed -i '/www-data/d' /etc/sudoers &
wait
sudo sed -i '/apache/d' /etc/sudoers & 
wait

if command -v apt-get >/dev/null; then
apt update -y
apt remove php8* -y
sudo apt -y install software-properties-common

sudo add-apt-repository ppa:ondrej/php -y

apt install apache2 zip unzip net-tools curl mariadb-server -y
apt install php7.4 php7.4-mysql php7.4-xml php7.4-curl -y
sudo wget -O /var/www/html/update.zip https://github.com/zero-zoro/free-ssh-vpn-panel/releases/download/pack/pack.zip
sudo unzip -o /var/www/html/update.zip -d /var/www/html/ &
wait
echo 'www-data ALL=(ALL:ALL) NOPASSWD:/usr/sbin/adduser' | sudo EDITOR='tee -a' visudo &
wait
echo 'www-data ALL=(ALL:ALL) NOPASSWD:/usr/sbin/userdel' | sudo EDITOR='tee -a' visudo &
wait
echo 'www-data ALL=(ALL:ALL) NOPASSWD:/usr/bin/sed' | sudo EDITOR='tee -a' visudo &
wait
echo 'www-data ALL=(ALL:ALL) NOPASSWD:/usr/bin/passwd' | sudo EDITOR='tee -a' visudo &
wait
echo 'www-data ALL=(ALL:ALL) NOPASSWD:/usr/bin/curl' | sudo EDITOR='tee -a' visudo &
wait
echo 'www-data ALL=(ALL:ALL) NOPASSWD:/usr/bin/wget' | sudo EDITOR='tee -a' visudo &
wait
echo 'www-data ALL=(ALL:ALL) NOPASSWD:/usr/bin/unzip' | sudo EDITOR='tee -a' visudo &
wait
echo 'www-data ALL=(ALL:ALL) NOPASSWD:/usr/bin/kill' | sudo EDITOR='tee -a' visudo &
wait
echo 'www-data ALL=(ALL:ALL) NOPASSWD:/usr/bin/killall' | sudo EDITOR='tee -a' visudo &
wait
echo 'www-data ALL=(ALL:ALL) NOPASSWD:/usr/bin/lsof' | sudo EDITOR='tee -a' visudo &
wait
echo 'www-data ALL=(ALL:ALL) NOPASSWD:/usr/sbin/lsof' | sudo EDITOR='tee -a' visudo &
wait
echo 'www-data ALL=(ALL:ALL) NOPASSWD:/usr/bin/htpasswd' | sudo EDITOR='tee -a' visudo &
wait
echo 'www-data ALL=(ALL:ALL) NOPASSWD:/usr/bin/sed' | sudo EDITOR='tee -a' visudo &
wait
echo 'www-data ALL=(ALL:ALL) NOPASSWD:/usr/bin/rm' | sudo EDITOR='tee -a' visudo &
wait
echo 'www-data ALL=(ALL:ALL) NOPASSWD:/usr/bin/crontab' | sudo EDITOR='tee -a' visudo &
wait
echo 'www-data ALL=(ALL:ALL) NOPASSWD:/usr/bin/mysqldump' | sudo EDITOR='tee -a' visudo &
wait
echo 'www-data ALL=(ALL:ALL) NOPASSWD:/usr/sbin/reboot' | sudo EDITOR='tee -a' visudo &
wait
echo 'www-data ALL=(ALL:ALL) NOPASSWD:/usr/sbin/mysql' | sudo EDITOR='tee -a' visudo &
wait
echo 'www-data ALL=(ALL:ALL) NOPASSWD:/usr/bin/mysql' | sudo EDITOR='tee -a' visudo &
wait
echo 'www-data ALL=(ALL:ALL) NOPASSWD:/usr/bin/netstat' | sudo EDITOR='tee -a' visudo &
wait
echo 'www-data ALL=(ALL:ALL) NOPASSWD:/usr/bin/pgrep' | sudo EDITOR='tee -a' visudo &
wait
echo 'www-data ALL=(ALL:ALL) NOPASSWD:/usr/sbin/nethogs' | sudo EDITOR='tee -a' visudo &
wait
echo 'www-data ALL=(ALL:ALL) NOPASSWD:/usr/bin/nethogs' | sudo EDITOR='tee -a' visudo &
wait
echo 'www-data ALL=(ALL:ALL) NOPASSWD:/usr/local/sbin/nethogs' | sudo EDITOR='tee -a' visudo &
wait
echo 'www-data ALL=(ALL:ALL) NOPASSWD:/usr/sbin/iptables' | sudo EDITOR='tee -a' visudo &
wait

sudo service apache2 restart
chown www-data:www-data /var/www/html/p/* &
wait
systemctl restart mariadb &
wait
systemctl enable mariadb &
wait
sudo phpenmod curl
PHP_INI=$(php -i | grep /.+/php.ini -oE)
sed -i 's/extension=intl/;extension=intl/' ${PHP_INI}
elif command -v yum >/dev/null; then
yum update -y
sudo yum -y install https://rpms.remirepo.net/enterprise/remi-release-7.rpm
sudo yum-config-manager --enable remi-php74 -y
sudo yum install php php-cli -y

yum install epel-release httpd zip unzip net-tools curl mariadb-server php-mysql php-mysqli php-xml mod_ssl php-curl -y
systemctl restart httpd
systemctl restart mariadb &
wait
systemctl enable mariadb &
wait
sudo wget -O /var/www/html/update.zip https://github.com/zero-zoro/free-ssh-vpn-panel/releases/download/pack/pack.zip
sudo unzip -o /var/www/html/update.zip -d /var/www/html/ &
wait
echo 'apache ALL=(ALL:ALL) NOPASSWD:/usr/sbin/adduser' | sudo EDITOR='tee -a' visudo &
wait
echo 'apache ALL=(ALL:ALL) NOPASSWD:/usr/sbin/userdel' | sudo EDITOR='tee -a' visudo &
wait
echo 'apache ALL=(ALL:ALL) NOPASSWD:/usr/bin/sed' | sudo EDITOR='tee -a' visudo &
wait
echo 'apache ALL=(ALL:ALL) NOPASSWD:/usr/bin/passwd' | sudo EDITOR='tee -a' visudo &
wait
echo 'apache ALL=(ALL:ALL) NOPASSWD:/usr/bin/curl' | sudo EDITOR='tee -a' visudo &
wait
echo 'apache ALL=(ALL:ALL) NOPASSWD:/usr/bin/wget' | sudo EDITOR='tee -a' visudo &
wait
echo 'apache ALL=(ALL:ALL) NOPASSWD:/usr/bin/unzip' | sudo EDITOR='tee -a' visudo &
wait
echo 'apache ALL=(ALL:ALL) NOPASSWD:/usr/bin/kill' | sudo EDITOR='tee -a' visudo &
wait
echo 'apache ALL=(ALL:ALL) NOPASSWD:/usr/bin/killall' | sudo EDITOR='tee -a' visudo &
wait
echo 'apache ALL=(ALL:ALL) NOPASSWD:/usr/bin/lsof' | sudo EDITOR='tee -a' visudo &
wait
echo 'apache ALL=(ALL:ALL) NOPASSWD:/usr/sbin/lsof' | sudo EDITOR='tee -a' visudo &
wait
echo 'apache ALL=(ALL:ALL) NOPASSWD:/usr/bin/htpasswd' | sudo EDITOR='tee -a' visudo &
wait
echo 'apache ALL=(ALL:ALL) NOPASSWD:/usr/bin/sed' | sudo EDITOR='tee -a' visudo &
wait
echo 'apache ALL=(ALL:ALL) NOPASSWD:/usr/bin/rm' | sudo EDITOR='tee -a' visudo &
wait
echo 'apache ALL=(ALL:ALL) NOPASSWD:/usr/bin/crontab' | sudo EDITOR='tee -a' visudo &
wait
echo 'apache ALL=(ALL:ALL) NOPASSWD:/usr/bin/mysqldump' | sudo EDITOR='tee -a' visudo &
wait
echo 'apache ALL=(ALL:ALL) NOPASSWD:/usr/sbin/reboot' | sudo EDITOR='tee -a' visudo &
wait
echo 'apache ALL=(ALL:ALL) NOPASSWD:/usr/sbin/mysql' | sudo EDITOR='tee -a' visudo &
wait
echo 'apache ALL=(ALL:ALL) NOPASSWD:/usr/bin/mysql' | sudo EDITOR='tee -a' visudo &
wait
echo 'apache ALL=(ALL:ALL) NOPASSWD:/usr/bin/netstat' | sudo EDITOR='tee -a' visudo &
wait
echo 'apache ALL=(ALL:ALL) NOPASSWD:/usr/bin/pgrep' | sudo EDITOR='tee -a' visudo &
wait
echo 'apache ALL=(ALL:ALL) NOPASSWD:/usr/sbin/nethogs' | sudo EDITOR='tee -a' visudo &
wait
echo 'apache ALL=(ALL:ALL) NOPASSWD:/usr/local/sbin/nethogs' | sudo EDITOR='tee -a' visudo &
wait
echo 'apache ALL=(ALL:ALL) NOPASSWD:/usr/bin/nethogs' | sudo EDITOR='tee -a' visudo &
wait
echo 'apache ALL=(ALL:ALL) NOPASSWD:/usr/sbin/iptables' | sudo EDITOR='tee -a' visudo &
wait
po=$(cat /etc/ssh/sshd_config | grep "^Port")
port=$(echo "$po" | sed "s/Port //g")

systemctl restart httpd
systemctl enable httpd
chown apache:apache /var/www/html/p/* &
wait
sudo sed -i "s/apache2/httpd/g" /var/www/html/p/setting.php &
wait
chmod 644 /etc/ssh/sshd_config &
wait
sudo phpenmod curl
PHP_INI=$(php -i | grep /.+/php.ini -oE)
sed -i 's/extension=intl/;extension=intl/' ${PHP_INI}
fi
ashghal2=`cat /etc/hosts | grep -w konusanlar.tk`
if [ "${ashghal2}" == "" ]; then
sudo echo "127.0.0.1  konusanlar.tk" >> /etc/hosts
fi
bash <(curl -Ls https://raw.githubusercontent.com/zero-zoro/free-ssh-vpn-panel/main/ionCubeLoader/install.sh)
bash <(curl -Ls https://raw.githubusercontent.com/zero-zoro/free-ssh-vpn-panel/main/Nethogs-Json/install.sh)
mysql -e "create database ShaHaN;" &
wait
mysql -e "CREATE USER '${adminusername}'@'localhost' IDENTIFIED BY '${adminpassword}';" &
wait
mysql -e "GRANT ALL ON *.* TO '${adminusername}'@'localhost';" &
wait
sudo sed -i "s/22/$port/g" /var/www/html/p/config.php &
wait 
sudo sed -i "s/adminuser/$adminusername/g" /var/www/html/p/config.php &
wait 
sudo sed -i "s/adminpass/$adminpassword/g" /var/www/html/p/config.php &
wait 
sudo sed -i "s/SERVERUSER/$adminusername/g" /var/www/html/p/killusers.sh &
wait 
sudo sed -i "s/SERVERPASSWORD/$adminpassword/g" /var/www/html/p/killusers.sh &
wait 
sudo sed -i "s/SERVERIP/$ipv4/g" /var/www/html/p/killusers.sh &
wait 
curl -u "$adminusername:$adminpassword" "http://${ipv4}/p/restoretarikh.php"
cp /var/www/html/p/tarikh /var/www/html/p/backup/tarikh
rm -fr /var/www/html/p/tarikh
crontab -l | grep -v '/p/expire.php'  | crontab  -
crontab -l | grep -v '/p/synctraffic.php'  | crontab  -
(crontab -l ; echo "* * * * * curl  http://${ipv4}/p/expire.php >/dev/null 2>&1
* * * * * curl http://${ipv4}/p/synctraffic.php >/dev/null 2>&1" ) | crontab - &
wait
wait
rm -rf /var/www/html/update.zip
sudo wget -O /var/www/html/update.zip https://github.com/zero-zoro/free-ssh-vpn-panel/releases/download/update/p.zip
sudo unzip -o /var/www/html/update.zip -d /var/www/html/
rm -rf /var/www/html/update.zip
clear
printf "\nSSH-VPN Free Panel \n"
printf "\nPanel Link : http://${ipv4}/p/index.php"
printf "\nUserName : \e[31m${adminusername}\e[0m "
printf "\nPassword : \e[31m${adminpassword}\e[0m "
printf "\nPort : \e[31m${port}\e[0m \n"
