#!/bin/bash
# -*- ENCODING: UTF-8 -*-

# Actualizo
    sudo apt-get update -y
    sudo apt-get upgrade -y

# Instalo herramientas de red
sudo apt install net-tools -y

# Instalación webmin ------------------------------------------------------------------

# Agrego unas dependencias
sudo apt-get install software-properties-common apt-transport-https wget -y
# importa la Webmin GPG key
sudo wget -q http://www.webmin.com/jcameron-key.asc -O- | sudo apt-key add -
# Agrego el repositorio
sudo add-apt-repository "deb [arch=amd64] http://download.webmin.com/download/repository sarge contrib"
# Instalo Webmin
sudo apt-get install webmin -y

# --------------------------------------------------------------------------------------

# Instalo Apache2
sudo apt install apache2 -y

# Creo un sitio web por defecto
    sudo mkdir /var/www/laberin.to
    sudo chown -R $USER:$USER /var/www/laberin.to
    sudo chmod -R 755 /var/www/laberin.to
    echo > /var/www/laberin.to/index.php
    echo '<h1>It work !</h1>' >> /var/www/laberin.to/index.php
    echo '<?php'  >> /var/www/laberin.to/index.php
    echo 'echo php_uname();' >> /var/www/laberin.to/index.php
    echo 'echo PHP_OS;'  >> /var/www/laberin.to/index.php

# Creo y modifico el correspondiente .conf
    touch laberin.to.conf

# Añado lo necesario para la configuración en apache
    echo '<VirtualHost *:80> >> laberin.to.conf
    echo '   ServerAdmin webmaster@localhost' >> laberin.to.conf
    echo '   ServerName laberin.to' >> laberin.to.conf
    echo '   ServerAlias www.laberin.to' >> laberin.to.conf
    echo '   DocumentRoot /var/www/laberin.to' >> laberin.to.conf
    echo '   ErrorLog ${APACHE_LOG_DIR}/error.log' >> laberin.to.conf
    echo '   CustomLog ${APACHE_LOG_DIR}/access.log combined' >> laberin.to.conf
    echo '</VirtualHost>' >> laberin.to.conf

    sudo mv laberin.to.conf /etc/apache2/sites-available
    sudo a2ensite laberin.to.conf
    sudo systemctl reload apache2
    sudo a2dissite 000-default.conf


# Instalo OpenSSH
    sudo apt install openssh-server -y

# Añado Webmin a la reglas del firewall
    sudo ufw allow webmin && clear

# Añado OpenSSH a la reglas del firewall
    sudo ufw allow OpenSSH && clear

# Añado Apache Full a la reglas del firewall
    sudo ufw allow 'Apache Full' && clear

# Activo el firewall
    sudo ufw enable && sudo ufw status
    