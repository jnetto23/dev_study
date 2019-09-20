# Seção 2, Aula: 6.06 - Bancos, Tabelas, Linhas, Colunas e a Primeira Tabela

# Criando um banco de dados para o exercício
DROP DATABASE IF EXISTS hcode_mysql;
CREATE DATABASE IF NOT EXISTS hcode_mysql
DEFAULT CHARSET utf8
DEFAULT COLLATE utf8_general_ci;

USE hcode_mysql;

# Para criar tabela, utilizar o comando CREATE TABLE 'nome_da_tabela'
DROP TABLE IF EXISTS clientes;
CREATE TABLE IF NOT EXISTS clientes(
	id INT,
    nome VARCHAR(100)
);

# Inserindo dados na tabela:
# 1 - Utilizar comando INSERT INTO 'nome_da_tabela' VALUES () 
#     -> devera informar os valores conforme a ordem da tabela;
# 2 - Utilizar comando INSERT INTO 'nome_da_tabela' (campo1, campo2) VALUES () 
#     -> devera informar na sequencia que foi passado apos o nome da tabela;

# Ex. 1 
# Metodo 1;
INSERT INTO clientes VALUES (1, 'José da Silva');

# Ex. 2 
# Metodo 2;
INSERT INTO clientes (nome, id) VALUES ('Maria da Silva', 2);

#########################################################################################################
# Orientações adicionais obtidas em outros cursos e consultas a documentação.

# Evitar conflito/erros com nome do banco, 
# 1. Definir a engine da tabela com ENGINE
# 2. Definir o charset da tabela com DEFAULT CHARSET
DROP TABLE IF EXISTS clientes;
CREATE TABLE IF NOT EXISTS clientes(
	id INT,
    nome VARCHAR(100)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Inserindo mais de um registro no mesmo comando:
# Metodo 1;
INSERT INTO clientes VALUES (1, 'Beltrano da Silva'), (2, 'Fulano da Silva'), (3, 'Ciclano da Silva');
# Metodo 2;
INSERT INTO clientes (nome, id) VALUES ('Beltrana da Silva', 4), ('Fulana da Silva', 5), ('Ciclana da Silva', 6);

SELECT * FROM clientes;