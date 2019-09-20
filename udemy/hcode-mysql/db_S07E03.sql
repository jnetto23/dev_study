# Seção 7, Aula: 15.15 - Adicionando Filtros com Datas

USE hcode_mysql;

SELECT * FROM tb_funcionarios WHERE admissao < '2013-02-01';
SELECT * FROM tb_funcionarios WHERE admissao < '2013/03/01';
SELECT * FROM tb_funcionarios WHERE admissao > '2016.01.01';
SELECT * FROM tb_funcionarios WHERE admissao > '20160101';

UPDATE tb_funcionarios SET admissao = '2013-01-01' WHERE id = 1;
UPDATE tb_funcionarios SET admissao = '2013-02-01' WHERE id = 2;
UPDATE tb_funcionarios SET admissao = '2013-03-01' WHERE id = 3;
UPDATE tb_funcionarios SET admissao = DATE_ADD(CURRENT_DATE(), INTERVAL 60 DAY) WHERE id = 4;

SELECT DATEDIFF(admissao, CURRENT_DATE()) AS 'diferença de dias' FROM tb_funcionarios WHERE id = 1;
SELECT DATEDIFF(admissao, CURRENT_DATE()) AS 'diferença de dias' FROM tb_funcionarios WHERE id = 4;

SELECT * FROM tb_funcionarios WHERE MONTH(admissao) = 2;
SELECT * FROM tb_funcionarios WHERE YEAR(admissao) = 2013;
SELECT * FROM tb_funcionarios WHERE DAY(admissao) = 19;