# Seção 6, Aula: 12.12 - Dominando o comando select

USE hcode_mysql;

SELECT * FROM tb_funcionarios;

SELECT COUNT(*) AS 'Total' FROM tb_funcionarios;

SELECT nome, salario AS 'Atual', 
CONVERT(salario * 1.1, DEC(10,2)) AS 'Salario +10%'
FROM tb_funcionarios;