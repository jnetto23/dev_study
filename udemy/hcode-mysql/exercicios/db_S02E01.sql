# Seção 2, Aula: 5.05 - MySql Workbench e Create Database

# Instruções básicas:
# Para criar comentários, basta adicionar um # no inicio da linha
# Delimitador padrão das instruções é o ';' mas caso necessário pode-se alterar o delimitador com o comando DELIMITER

# Para criar um novo banco de dados, utilizar o comando CREATE DATABASE 'nome_do_bando'
# Não utilizar acentos e caracteres especias para nomes de bancos e tabelas
# Apos criado o banco de dados, utilizar o comando USE 'nome_do_banco' para usar o banco

# ex. 1
CREATE DATABASE banco1;
USE banco1;

# ex. 2
CREATE DATABASE banco2;
USE banco2;

# Para deletar um bando de Dados, utilizar o comando DROP DATABASE 'nome_do_banco'
DROP DATABASE banco2;

#########################################################################################################

# Orientações adicionais obtidas em outros cursos e consultas a documentação.

# Evitar conflito/erros com nome do banco, 
# 1. Utilizar o expressão IF [NOT] EXISTS junto aos comandos CREATE e DROP 
# 2. Definir o charset do banco com DEFAULT CHARSET
# 3. Definir a collate do banco com DEFAULT COLLATE

DROP DATABASE IF EXISTS banco1; 		# Delete se EXISTIR o banco de dados 'banco1'
CREATE DATABASE IF NOT EXISTS banco1 	# Crie se NÃO EXISTIR o banco de dados 'banco1'
DEFAULT CHARSET utf8 					# Definindo o Charset do banco
DEFAULT COLLATE utf8_general_ci; 		# Definindo a Collate do bando
