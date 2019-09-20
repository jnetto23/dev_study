# Seção 7, Aula: 14.14 - Where Like, Between e Soundex

USE hcode_mysql;

SELECT * FROM tb_funcionarios WHERE nome LIKE '%A%';
SELECT * FROM tb_funcionarios WHERE nome LIKE 'J%';
SELECT * FROM tb_funcionarios WHERE nome LIKE '%A';
SELECT * FROM tb_funcionarios WHERE nome LIKE '__A%';
SELECT * FROM tb_funcionarios WHERE nome LIKE '____';

SELECT * FROM tb_funcionarios WHERE nome NOT LIKE '%A%';
SELECT * FROM tb_funcionarios WHERE nome NOT LIKE 'J%';
SELECT * FROM tb_funcionarios WHERE nome NOT LIKE '%A';
SELECT * FROM tb_funcionarios WHERE nome NOT LIKE '__A%';
SELECT * FROM tb_funcionarios WHERE nome NOT LIKE '____';

SELECT * FROM tb_funcionarios WHERE salario BETWEEN 1000 AND 2000;
SELECT * FROM tb_funcionarios WHERE salario NOT BETWEEN 1000 AND 2000;

SELECT * FROM tb_funcionarios WHERE SOUNDEX(nome) = SOUNDEX('Luis');

