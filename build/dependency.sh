#!/bin/bash

# Dependências da aplicação python
apt update -y
apt install python3 -y
apt install pip -y
pip install psutil
pip install pymssql
pip install pymysql
