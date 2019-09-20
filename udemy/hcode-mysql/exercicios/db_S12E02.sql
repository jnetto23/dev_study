# Seção 12, Aula: 26.25 - Trabalhando com STORED PROCEDURE

USE hcode_mysql;

DELIMITER $$
DROP PROCEDURE IF EXISTS sp_pessoa_save;
CREATE PROCEDURE IF NOT EXISTS sp_pessoa_save (
	pdesnome VARCHAR(256)
)
BEGIN
	INSERT INTO tb_pessoas VALUES (NULL, pdesnome, NULL);
    SELECT * FROM tb_pessoas WHERE idpessoa = last_insert_id();
END$$
DELIMITER ;

# Usando a procedure
CALL sp_pessoa_save('Massaharu');