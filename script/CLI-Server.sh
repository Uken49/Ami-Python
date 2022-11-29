#!/bin/bash

# Atualizando os pacotes
sudo apt update -y && sudo apt upgrade -y

# Adicionando um usuário e colocando como sudouser 
sudo adduser urubu100
sudo usermod -aG ubuntu urubu100

# Instalando o docker
sudo apt install docker.io -y

# Iniciando o docker como serviço
sudo systemctl start docker
sudo systemctl enable docker

# Clonando o repositório com a aplicação python
git clone https://github.com/Uken49/Ami-Python.git
cd Ami-Python

# Pegando a imagem do mysql:5.7
sudo docker pull mysql:5.7

# Criando o container do mysql com o banco de dados
sudo docker run --restart=always -d -p 3306:3306 --name BDGuardianAngel -e "MYSQL_DATABASE=GuardianAngel" -e "MYSQL_ROOT_PASSWORD=urubu100" mysql:5.7

# Inserindo o script dentro do container
sudo docker cp database/banco.sql BDGuardianAngel:/

# Executando o script dentro do container
sudo docker exec -i BDGuardianAngel /bin/sh -c 'mysql -u root -purubu100 </banco.sql'

# Criando a imagem e o container da aplicação python
bash build/build.sh
bash build/run.sh
