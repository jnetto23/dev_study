# Seção 7, Aula: 16.16 - Clausula Order By e LIMIT

USE hcode_mysql;

SELECT * FROM tb_funcionarios ORDER BY nome;
SELECT * FROM tb_funcionarios ORDER BY nome ASC;
SELECT * FROM tb_funcionarios ORDER BY nome DESC;

SELECT * FROM tb_funcionarios ORDER BY salario;
SELECT * FROM tb_funcionarios ORDER BY salario DESC, nome;

SELECT * FROM tb_funcionarios ORDER BY salario LIMIT 0,3;
SELECT * FROM tb_funcionarios 
WHERE YEAR(admissao) = '2013' AND sexo = 'M'
ORDER BY salario LIMIT 0,3;