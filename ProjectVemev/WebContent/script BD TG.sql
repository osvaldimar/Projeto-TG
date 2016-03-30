create database db_vemev;

use db_vemev;

CREATE TABLE visitante (
    id_visit INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nome VARCHAR(40),
    apelido VARCHAR(15),
    telefone VARCHAR(15),
    celular VARCHAR(16),
    data_nascimento DATE,
    RG Varchar(12),
    email VARCHAR(40),
    sexo CHAR,
    estado_civil VARCHAR(15),
    endereco VARCHAR(40),
    bairro VARCHAR(25),
    cep VARCHAR(9),
    estado VARCHAR(2),
    cidade VARCHAR(50),
    complemento VARCHAR(30),
    descricao_reuniao VARCHAR(100),
    pertence_igreja CHAR,
    qual_igreja VARCHAR(30),
    pertence_celula VARCHAR(3),
    conhecer_celula VARCHAR(3),
    conhecer_jesus VARCHAR(3),
    deseja_oracao VARCHAR(3),
    motivo_oracao VARCHAR(100),
    precisa_ajuda VARCHAR(3),
    data_reuniao DATE,
    celula_culto VARCHAR(6)
);

CREATE TABLE membro (
    id_membro INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nome VARCHAR(40),
    telefone VARCHAR(15),
    celular VARCHAR(15),
    endereco VARCHAR(40),
    bairro VARCHAR(25),
    cep VARCHAR(9),
    estado VARCHAR(2),
    cidade VARCHAR(50),
    complemento VARCHAR(12),
	RG Varchar(12)
);


CREATE TABLE rede (
    cor VARCHAR(10) NOT NULL PRIMARY KEY
);

CREATE TABLE lider_rede (
	id_lider INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    id_membro INT NOT NULL,
    cor_rede VARCHAR(10) NOT NULL,
    data_ini DATE,
    data_fim DATE,
    status_lider VARCHAR(10),
    FOREIGN KEY (id_membro)
        REFERENCES membro (id_membro),
    FOREIGN KEY (cor_rede)
        REFERENCES rede (cor)
);

CREATE TABLE setor (
    id_setor INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nome_setor VARCHAR(20) NOT NULL,
    cor_rede VARCHAR(10) NOT NULL,
    FOREIGN KEY (cor_rede)
        REFERENCES rede (cor)
);

CREATE TABLE lider_setor (
	id_lider INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    id_setor INT NOT NULL,
    id_membro INT NOT NULL,
    data_ini DATE,
    data_fim DATE,
    status_lider VARCHAR(10),
    FOREIGN KEY (id_membro)
        REFERENCES membro (id_membro),
    FOREIGN KEY (id_setor)
        REFERENCES setor (id_setor)
);

CREATE TABLE celula (
    nome_celula VARCHAR(20) NOT NULL PRIMARY KEY,
    total INT,
    id_setor INT NOT NULL,
    endereco VARCHAR(40),    
    bairro VARCHAR(25),
    cep VARCHAR(9),
    estado VARCHAR(2),
    cidade VARCHAR(50),
    complemento VARCHAR(12),
    FOREIGN KEY (id_setor)
        REFERENCES setor (id_setor)
);

CREATE TABLE lider_celula (
	id_lider INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    id_membro INT NOT NULL,
    nome_celula VARCHAR(20) NOT NULL,
    data_ini DATE,
    data_fim DATE,
    status_lider VARCHAR(10),
    FOREIGN KEY (id_membro)
        REFERENCES membro (id_membro),
	FOREIGN KEY (nome_celula)
        REFERENCES celula (nome_celula)
);

CREATE TABLE lider_treinamento (
	id_lider INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    id_membro INT NOT NULL,
    nome_celula VARCHAR(20) NOT NULL,
    data_ini DATE,
    data_fim DATE,
    status_lider VARCHAR(10),
    FOREIGN KEY (nome_celula)
        REFERENCES celula (nome_celula),
    FOREIGN KEY (id_membro)
        REFERENCES membro (id_membro)
);

CREATE TABLE reuniao (
	id_reuniao INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    horario TIME NOT NULL,
    dia_reuniao VARCHAR(10) NOT NULL,
    num_visitantes INT NOT NULL,
    num_membros INT NOT NULL,
    nome_celula VARCHAR(20) NOT NULL,
    FOREIGN KEY (nome_celula)
        REFERENCES celula (nome_celula)
);

create table participa_celula (
	id_participa INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    id_membro INT NOT NULL,
    nome_celula VARCHAR(20) NOT NULL,
    data_ini DATE,
    data_fim DATE,
    frequenta VARCHAR(3),
    FOREIGN KEY (nome_celula)
        REFERENCES celula (nome_celula),
    FOREIGN KEY (id_membro)
        REFERENCES membro (id_membro)
);

CREATE TABLE contata_visitante (
	id_contato INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    data_contato DATE NOT NULL,
    atendeu_contato VARCHAR(3) NOT NULL,
    aceite_convite VARCHAR(3) NOT NULL,
    id_membro INT NOT NULL,
    id_visit INT NOT NULL,
    nome_celula VARCHAR(20) NOT NULL,
    FOREIGN KEY (id_membro)
        REFERENCES membro (id_membro),
    FOREIGN KEY (id_visit)
        REFERENCES visitante (id_visit),
	FOREIGN KEY (nome_celula)
        REFERENCES celula (nome_celula)
);

show tables;
describe membro;

use db_vemev;

insert into membro(nome,telefone,celular,endereco,bairro,cep,estado,cidade,complemento) values('Jo�o da Silva','11-4677-6545','11-99677-6545','Rua Teixeira, 564','S�o Paulo','82728-098','SP','Carapicu�ba','nada');	
insert into membro(nome,telefone,celular,endereco,bairro,cep,estado,cidade,complemento) values('Maria Joaquina','11-3000-6545','11-99000-6545','Rua Nogueira, 564','S�o Paulo','82728-098','SP','Carapicu�ba','nada');	
insert into membro(nome,telefone,celular,endereco,bairro,cep,estado,cidade,complemento) values('Jos� Souza','11-4555-6545','11-98555-6545','Rua Jones, 564','S�o Paulo','82728-098','SP','Carapicu�ba','nada');	
insert into membro(nome,telefone,celular,endereco,bairro,cep,estado,cidade,complemento) values('Carla Marquezi','11-4222-6545','11-99222-6545','Rua Costa, 564','S�o Paulo','82728-098','SP','Carapicu�ba','nada');	
insert into membro(nome,telefone,celular,endereco,bairro,cep,estado,cidade,complemento) values('Amanda Croce','11-4111-7777','11-91111-7777','Rua Arthur, 123','Pirituba','02898-339','SP','S�o Paulo','nada');	
insert into membro(nome,telefone,celular,endereco,bairro,cep,estado,cidade,complemento) values('Arnaldo Armada','11-3888-3333','11-98888-3333','Travessa Carlos Sampaio, 676','Ch�cara Klabin','06765-998','SP','S�o Paulo','prd23,ap67D');	
insert into membro(nome,telefone,celular,endereco,bairro,cep,estado,cidade,complemento) values('Carla Marquezi','11-3555-0000','11-95555-0000','Rua Ypsulon, 564','S�o Paulo','82728-098','SP','Carapicu�ba','nada');	

insert into rede values('Verde');
insert into rede values('Vermelho');
insert into rede values('Azul');
insert into rede values('Amarelo');

insert into setor(nome_setor, cor_rede) values('Gen�rico', 'Verde');
insert into setor(nome_setor, cor_rede) values('Gen�rico', 'Vermelho');
insert into setor(nome_setor, cor_rede) values('Gen�rico', 'Azul');
insert into setor(nome_setor, cor_rede) values('Gen�rico', 'Amarelo');

insert into celula(nome_celula, total, id_setor, endereco, bairro, cep, estado, cidade, complemento) 
	values('C�lula Omega', 0, 1, 'Rua da celula de Omega', 'Centro', '04462-111', 'SP', 'S�o Paulo', 'casa 1');
insert into celula(nome_celula, total, id_setor, endereco, bairro, cep, estado, cidade, complemento) 
	values('C�lula Apolo', 0, 2, 'Rua da celula de Apolo', 'Centro', '04462-111', 'SP', 'S�o Paulo', '');
insert into celula(nome_celula, total, id_setor, endereco, bairro, cep, estado, cidade, complemento) 
	values('C�lula Bravo', 0, 3, 'Rua da celula de Bravo', 'Centro', '04462-111', 'SP', 'S�o Paulo', '');
insert into celula(nome_celula, total, id_setor, endereco, bairro, cep, estado, cidade, complemento) 
	values('C�lula Pegasus', 0, 4, 'Rua da celula de Pegasus', 'Pegasinho', '09862-100', 'SP', 'S�o Paulo', '');   
 
select * from membro;

select * from visitante;

select * from rede;

select * from setor;

select * from celula;

select * from lider_rede;

select * from lider_celula;

select * from lider_treinamento;

select * from participa_celula;

#delete from celula where nome_celula != '';
#delete from participa_celula where id_membro >= 1;
