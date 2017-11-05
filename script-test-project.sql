CREATE USER 'sus'@'localhost' IDENTIFIED BY 'sus';

GRANT ALL PRIVILEGES ON * . * TO 'sus'@'localhost';

-- ------------------------------------------------------

CREATE DATABASE  IF NOT EXISTS `sus_agendamento` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `sus_agendamento`;

DROP TABLE IF EXISTS `Especialidade`;
DROP TABLE IF EXISTS `Paciente`;
DROP TABLE IF EXISTS `Medico`;

CREATE TABLE Especialidade(
	cd_Especialidade INT NOT NULL auto_increment,
	nm_Especialidade VARCHAR(30),
	PRIMARY KEY (cd_Especialidade));
	
INSERT INTO Especialidade VALUES (1, 'Clínico Geral'), 	(2, 'Cardiologista'), (3, 'Urologista'), (4, 'Ginecologista');
	
CREATE TABLE Paciente(
	cd_Paciente INT NOT NULL auto_increment, 
    nm_Paciente VARCHAR(50),
    cd_RG INT(11),
	cd_CPF INT(11),
    ds_Endereco VARCHAR(50),
    nm_Cidade VARCHAR(20),
    nm_Bairro VARCHAR(20),
    sg_Estado CHAR(2),
	ds_Email VARCHAR(50),
    cd_Telefone VARCHAR(20),
    dt_Nascimento VARCHAR(10),
    PRIMARY KEY (cd_Paciente)
  
);

INSERT INTO Paciente VALUES (1, 'Geraldo Magela', 43465, 9875456, 'Rua XYZ 75', 'Santos', 'Bairro 2', 'SP', 'geraldo@sus.com', '354616494', '10/10/1950');

CREATE TABLE Medico(
	cd_Medico INT NOT NULL auto_increment,
	nm_Medico VARCHAR(50),
	crm_Medico INT,   
    cd_Especialidade INT,
	cd_RG INT(11),
    cd_CPF INT(11),     
	ds_Endereco VARCHAR (50),
    nm_Cidade VARCHAR(20),
    nm_Bairro VARCHAR(20),
	sg_Estado CHAR(2),
	cd_Telefone VARCHAR(20),
    ds_Email VARCHAR(50),
    dt_Nascimento VARCHAR(10),
	PRIMARY KEY (cd_Medico)
	);
	
INSERT INTO Medico VALUES (1, 'Dr House', 12345, 1, 55544, 67766, 'Rua dos medicos, 54', 'Medicity', 'Bairro Tal', 'SP', '34235545', 'medico@medico.com', '01/01/1901');

CREATE TABLE Usuario(
	cd_Usuario INT,
	nm_Usuario VARCHAR(20),
    nm_Login VARCHAR(10),
    ds_Senha VARCHAR(10),
    ds_Usuario VARCHAR(10),
    PRIMARY KEY (cd_Usuario)
);

INSERT INTO Usuario VALUES (1, 'Administrador', 'admin', 'admin', 'admini');


CREATE TABLE Estado(
	sg_Estado CHAR(2), 
	nm_Estado VARCHAR(25),
    PRIMARY KEY (sg_Estado)
);

CREATE TABLE Cidade(
    cd_Cidade INT,
	sg_Estado CHAR(2),
	nm_Cidade VARCHAR(40),
    PRIMARY KEY (cd_Cidade),
    FOREIGN KEY (sg_Estado) REFERENCES Estado(sg_Estado)
);


INSERT INTO Estado VALUES ('AC', 'Acre') , 
('AL', 'Alagoas') , 
('AP', 'Amapá') , 
('AM', 'Amazonas') , 
('BA', 'Bahia') , 
('CE', 'Ceará') , 
('DF', 'Distrito Federal') , 
('ES', 'Espírito Santo') , 
('GO', 'Goiás') , 
('MA', 'Maranhão') , 
('MT', 'Mato Grosso') , 
('MS', 'Mato Grosso do Sul') , 
('MG', 'Minas Gerais') , 
('PA', 'Pará') , 
('PB', 'Paraíba') , 
('PR', 'Paraná') , 
('PE', 'Pernambuco') , 
('PI', 'Piauí') , 
('RJ', 'Rio de Janeiro') , 
('RN', 'Rio Grande do Norte') , 
('RS', 'Rio Grande do Sul') , 
('RO', 'Rondônia') , 
('RR', 'Roraima') , 
('SC', 'Santa Catarina') , 
('SP', 'São Paulo') , 
('SE', 'Sergipe') , 
('TO', 'Tocantins')
;

INSERT INTO Cidade VALUES(1 , 'SP', 'Bertioga '),
(2 , 'SP', 'Cubatão '),
(3 , 'SP', 'Guarujá '),
(4 , 'SP', 'Itanhaém '),
(5 , 'SP', 'Mongaguá '),
(6 , 'SP', 'Peruíbe '),
(7 , 'SP', 'Praia Grande '),
(8 , 'SP', 'Santos '),
(9 , 'SP', 'São Vicente ')
;
