#!/bin/bash

# Script para configurar máquina virtual GUI com o container

# Atualizando os pacotes
sudo apt update -y && sudo apt upgrade -y

# Adicionando um usuário e colocando como sudouser 
sudo adduser urubu100
sudo usermod -aG ubuntu urubu100

# Instalando a GUI
sudo apt-get install xrdp lxde-core lxde tigervnc-standalone-server -y

# Instalando o docker
sudo apt install docker.io -y

# Iniciando o docker como serviço
sudo systemctl start docker
sudo systemctl enable docker

# Clonando o repositório com a aplicação python
git clone https://github.com/Uken49/Ami-Python.git
cd Ami-Python/build

# Pegando a imagem do mysql:5.7
sudo docker pull mysql:5.7

# Criando o container do mysql com o banco de dados criado
sudo docker run --restart=always -d -p 3306:3306 --name BDGuardianAngel -e "MYSQL_DATABASE=GuardianAngel" -e "MYSQL_ROOT_PASSWORD=urubu100" mysql:5.7

sudo docker cp ../database/banco.sql BDGuardianAngel:/

sudo docker exec -i BDGuardianAngel /bin/sh -c 'mysql -u root -purubu100 </banco.sql'

# Criando a imagem e o container da aplicação python
bash ../build/build.sh
bash ../build/run.sh
