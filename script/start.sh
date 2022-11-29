#!/bin/bash

# Iniciando container
sudo docker start api_py

# Executando o conteúdo na tela
sudo docker exec -it api_py python3 home/main.py