#!/bin/bash

# Script para configurar máquina virtual GUI com o container e Java

# Atualizando os pacotes
sudo apt update -y && sudo apt upgrade -y

# Trocando senha do usuário ubuntu
sudo passwd ubuntu

echo "Nome do usuário à ser criado: "
read nome

# Adicionando um usuário e colocando como sudouser 
sudo adduser $nome
sudo usermod -aG ubuntu $nome

# Instalando a GUI
sudo apt-get install xrdp lxde-core lxde tigervnc-standalone-server -y

# Instalando o docker
sudo apt install docker.io -y

# Iniciando o docker como serviço
sudo systemctl start docker
sudo systemctl enable docker

# Instalando o java
sudo apt-get install openjdk-11-jdk -y

# Clonando o repositório com a aplicação java
git clone https://github.com/Guardian-Angel-SPTech/Aplicacao-Java.git

# Clonando o repositório com a aplicação python
git clone https://github.com/Uken49/Ami-Python.git
cd Ami-Python/build

# Pegando a imagem do mysql:5.7
sudo docker pull mysql:5.7

# Criando o container do mysql com o banco de dados
sudo docker run --restart=always -d -p 3306:3306 --name BDGuardianAngel -e "MYSQL_DATABASE=GuardianAngel" -e "MYSQL_ROOT_PASSWORD=urubu100" mysql:5.7

# Inserindo o script dentro do container
sudo docker cp ../database/banco.sql BDGuardianAngel:/

# Executando o script dentro do container
sudo docker exec -i BDGuardianAngel /bin/sh -c 'mysql -u root -purubu100 </banco.sql'

# Criando a imagem e o container da aplicação python
bash build.sh
bash run.sh

# Retornando ao diretório inicial
cd ../..