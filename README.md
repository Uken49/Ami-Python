# DockerEc2
### Colocando um container com uma aplicação python na Ec2
*Obs: Você deverá ter o docker instalado na sua máquina* <br>
*Obs2: Os comandos a seguir são direcionados ao sistemas ubuntu*

--- ---
## Para criar o docker
> 1° - Clone o repositório
~~~
git clone https://github.com/Uken49/Ami-Python.git
~~~

> 2° - Entre na Pasta "build" que contém os scripts para a criação do container
~~~
cd Ami-Python/build
~~~

> 3° - Execute o arquivo "build.sh" para criar a imagem
~~~
bash build.sh
~~~

> 4° - Execute o arquivo "run.sh" para criar o container
~~~
bash run.sh
~~~

---
> 5° - Após a criação do container, use o arquivo "script/start.sh" para inicializa-lo
~~~
bash start.sh
~~~

> 6° - Use o comando "stop" para parar a execução do container
~~~
sudo docker stop api_py
~~~