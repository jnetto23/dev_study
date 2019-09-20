# Seção 10, Aula: 21.20 - Criando consultas avançadas com JOINS

USE hcode_mysql;

SELECT * FROM tb_pessoas;
SELECT * FROM tb_funcionarios;

# INNER JOIN - TEM QUE TER NAS DUAS TABELAS
SELECT *
FROM tb_pessoas a
INNER JOIN tb_funcionarios b ON a.idpessoa = b.idpessoa;

# USING funciona somente quando a relação entre as tabelas tiverem o mesmo nome;
SELECT *
FROM tb_pessoas a
INNER JOIN tb_funcionarios b USING(idpessoa);

INSERT INTO tb_pessoas VALUES (NULL,'Glaucio',NULL);
SELECT * FROM tb_pessoas;

# LEFT JOIN - TRAGA TUDO DA TABELA DA ESQUERDA E SOMENTE A QUE TIVER RELAÇÃO NA TABELA DA DIREITA
SELECT *
FROM tb_pessoas a
LEFT JOIN tb_funcionarios b ON a.idpessoa = b.idpessoa;

# RIGHT JOIN - TRAGA TUDO DA TABELA DA DIREITA E SOMENTE A QUE TIVER RELAÇÃO NA TABELA DA ESQUERDA
SELECT *
FROM tb_funcionarios a
RIGHT JOIN tb_pessoas b ON a.idpessoa = b.idpessoa;