use GuardianAngel;

create table empresa (
idEmpresa int primary key auto_increment,
cnpj char(14) unique,
email varchar(45) unique,
nomeEmpresa varchar(45)
);

create table maquina (
idMaquina int primary key auto_increment,
sistOp varchar(45),
fkEmpresa int,
macAdress varchar(20),
foreign key (fkEmpresa) references empresa (idEmpresa)
);

create table funcionario (
idFuncionario int primary key auto_increment,
nome varchar(45),
cpf char(11),
email varchar(45),
senha varchar(45),
nivelAcesso char(1),
fkEmpresa int,
foreign key (fkEmpresa) references empresa (idEmpresa),
fkMaquina int,
foreign key (fkMaquina) references maquina (idMaquina)
);

create table processo(
idProcesso int auto_increment,
fkMaquina int,
nomeProcesso varchar(20),
usoCpu decimal,
horaRegistro time,
dataRegistro date,
primary key(idProcesso, fkMaquina)
);

create table registro (
idRegistro int auto_increment,
fkMaquina int,
foreign key (fkMaquina) references maquina (idMaquina),
componente varchar(20),
registroComponente decimal(5,2),
horaRegistro time,
dataRegistro date,
primary key(idRegistro, fkMaquina)
);

insert into empresa(cnpj, email, nomeEmpresa) values
('43669182000109', 'guardian@angel.com', 'Guardian Angel');

insert into maquina(sistOp, fkEmpresa, macAdress) values
('Ubuntu 20.04', (select idEmpresa from empresa where cnpj = '43669182000109'), '05-30-F6-5C-EC-14' limit 1);

insert into funcionario(nome, cpf, email, senha, nivelAcesso, fkEmpresa, fkMaquina) values 
('Helder'
 , '82114052028'
 , 'helder@guardian.com'
 , '123'
 , 1
 , (select idEmpresa from empresa where cnpj = '43669182000109' limit 1)
 , (select idMaquina from maquina where macAdress = '05-30-F6-5C-EC-14' limit 1)
);
