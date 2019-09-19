# Seção 3, Aula: 7.07 - Entendendo os tipos de dados (Data Types)

# Dropando os bancos anteriores;
DROP DATABASE IF EXISTS banco1;
DROP DATABASE IF EXISTS hcode_mysql;

# Criando novo banco de dados
CREATE DATABASE IF NOT EXISTS hcode_mysql
DEFAULT CHARSET utf8
DEFAULT COLLATE utf8_general_ci;

# Entrando no Bando de Dados
USE hcode_mysql;

# Criando tabala
DROP TABLE IF EXISTS tb_funcionarios;
CREATE TABLE IF NOT EXISTS tb_funcionarios (
	id INT, 
    nome VARCHAR(100),
	salario DEC(10,2),
    admissao DATE,
    sexo ENUM('m','f'),
    cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Inserindo funcionários
INSERT INTO tb_funcionarios VALUES (1, 'Pedro Henrique', 4999.99, '2016-01-01', 'm', NULL);

# Selecionando os dados inseridos
SELECT * FROM tb_funcionarios;
