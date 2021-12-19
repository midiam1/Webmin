#!/bin/bash
# -*- ENCODING: UTF-8 -*-

# Actualizo
    sudo apt-get update -y
    sudo apt-get upgrade -y

# Instalo herramientas de red
sudo apt install net-tools -y

# Agrego unas dependencias
sudo apt-get install software-properties-common apt-transport-https wget -y
# importa la Webmin GPG key
sudo wget -q http://www.webmin.com/jcameron-key.asc -O- | sudo apt-key add -
# Agrego el repositorio
sudo add-apt-repository "deb [arch=amd64] http://download.webmin.com/download/repository sarge contrib"
# Instalo Webmin
sudo apt-get install webmin -y
# Instalo Apache2
sudo apt install apache2 -y

# Añado Apache a las reglas del firewall
    sudo ufw allow Apache

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
    