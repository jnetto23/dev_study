# Seção 10, Aula: 22.21 - Criando subconsultas com subqueries

USE hcode_mysql;

INSERT INTO tb_pessoas VALUES (NULL,'José',NULL);
SELECT idpessoa FROM tb_pessoas WHERE desnome NOT LIKE 'J%';

# usando subqueries
DELETE FROM tb_pessoas WHERE idpessoa IN(SELECT idpessoa FROM tb_pessoas WHERE desnome NOT LIKE 'J%');
SELECT * FROM tb_pessoas;
# OBS. sempre que possivel prefira utilizar JOINS pois subqueries são menos perfomáticas;
