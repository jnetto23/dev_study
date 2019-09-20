# Seção 7, Aula: 13.13 - Adicionando filtros com WHERE

USE hcode_mysql;

SELECT * FROM tb_funcionarios WHERE sexo != 'M';

UPDATE tb_funcionarios SET salario = salario *1.1 WHERE id = 1;

SELECT * FROM tb_funcionarios WHERE sexo = 'M' AND salario > 1000;

SELECT * FROM tb_funcionarios WHERE sexo != 'M' OR salario > 1000;

