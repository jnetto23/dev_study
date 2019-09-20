# Seção 9, Aula: 20.19 - Criando e Relacionando Tabelas (CONSTRAINTS)

DROP DATABASE IF EXISTS hcode_mysql;
CREATE DATABASE IF NOT EXISTS hcode_mysql
DEFAULT CHARSET utf8
DEFAULT COLLATE utf8_general_ci;

USE hcode_mysql;

DROP TABLE IF EXISTS tb_pessoas;
CREATE TABLE IF NOT EXISTS tb_pessoas (
	idpessoa INT NOT NULL AUTO_INCREMENT,
    desnome VARCHAR(256) NOT NULL,
    dtcadastro TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
    CONSTRAINT PK_pessoas PRIMARY KEY (idpessoa)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS tb_funcionarios;
CREATE TABLE IF NOT EXISTS tb_funcionarios (
	idfuncionario INT NOT NULL AUTO_INCREMENT,
    idpessoa INT NOT NULL,
    vlsalario DEC(10,2) NOT NULL,
    dtadmissao DATE NOT NULL,
    CONSTRAINT PK_funcionarios PRIMARY KEY (idfuncionario),
    CONSTRAINT FK_funcionarios_pessoas FOREIGN KEY (idpessoa)
		REFERENCES tb_pessoas (idpessoa)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO tb_pessoas VALUES (NULL, 'João', NULL);
INSERT INTO tb_funcionarios VALUES (NULL, 1, 5000, CURRENT_DATE());

SELECT * FROM tb_pessoas;
SELECT * FROM tb_funcionarios;