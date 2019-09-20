# Seção 8, Aula: 18.18 - Dominando o comando DELETE

USE hcode_mysql;

SELECT * FROM tb_funcionarios;

DELETE FROM tb_funcionarios WHERE id = 1;

START TRANSACTION;
	DELETE FROM tb_pessoas;
	SELECT * FROM tb_pessoas;
ROLLBACK;

START TRANSACTION;
	DELETE FROM tb_pessoas;
	SELECT * FROM tb_pessoas;
COMMIT;

INSERT INTO tb_pessoas VALUES (NULL, 'José', 'M');
SELECT * FROM tb_pessoas;

TRUNCATE TABLE tb_pessoas;
SELECT * FROM tb_pessoas;
INSERT INTO tb_pessoas VALUES (NULL, 'José', 'M');
SELECT * FROM tb_pessoas;