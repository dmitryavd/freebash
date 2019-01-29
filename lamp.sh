#!/bin/sh

#######################################
# Bash script to install an AMP stack and PHPMyAdmin plus tweaks. For Debian based systems.
# Written by @AamnahAkram from http://aamnah.com

# In case of any errors (e.g. MySQL) just re-run the script. Nothing will be re-installed except for the packages with errors.
#######################################

#COLORS
# Reset
Color_Off='\033[0m'       # Text Reset

# Regular Colors
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan

# Update packages and Upgrade system
echo -e "$Cyan \n Updating System.. $Color_Off"
sudo yum update -y && sudo yum upgrade -y

## Install AMP
echo -e "$Cyan \n Installing PHP & Requirements $Color_Off"
sudo yum install libapache2-mod-php7 php7 php7-bcmath php7-imagick php7-pdo php7-amqp  php7-common -y

echo -e "$Cyan \n Installing MySQL $Color_Off"
sudo yum install mysql-server mysql-client libmysqlclient15.dev -y

echo -e "$Cyan \n Installing phpMyAdmin $Color_Off"
sudo yum install phpmyadmin -y

echo -e "$Cyan \n Installing nginx $Color_Off"
sudo yum install epel-release nginx -y

echo -e "$Cyan \n Installing redis $Color_Off"
sudo yum install redis -y

echo -e "$Cyan \n Verifying installs$Color_Off"
sudo yum install libapache2-mod-php7 php7 mysql-server mysql-client -y

## TWEAKS and Settings
# Permissions
echo -e "$Cyan \n Permissions for /var/www $Color_Off"
sudo chown -R www-data:www-data /var/www
echo -e "$Green \n Permissions have been set $Color_Off"

# Enabling Mod Rewrite, required for WordPress permalinks and .htaccess files
echo -e "$Cyan \n Enabling Modules $Color_Off"
sudo a2enmod rewrite
sudo php7enmod mcrypt

# Restart services
echo -e "$Cyan \n Restarting phpMyAdmin $Color_Off"
sudo systemctl restart httpd.service
sudo systemctl start redis
