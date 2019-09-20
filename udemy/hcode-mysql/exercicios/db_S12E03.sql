# Seção 12, Aula: 27.26 - Comandos avançados para STORED PROCEDURE

USE hcode_mysql;

DROP PROCEDURE IF EXISTS sp_funcionario_save;
DELIMITER $$
CREATE PROCEDURE IF NOT EXISTS sp_funcionario_save(
	pdesnome VARCHAR(256),
    pvlsalario DEC(10,2),
    pdtadmissao DATE
)
BEGIN
    DECLARE vidpessoa INT;
    START TRANSACTION;
    IF NOT EXISTS (SELECT idpessoa FROM tb_pessoas WHERE desnome = pdesnome) THEN
		INSERT INTO tb_pessoas VALUES (NULL, pdesnome, NULL);
        SET vidpessoa = LAST_INSERT_ID();		
    ELSE
		SELECT "Usuário já cadastrado" AS 'Resultado';
        ROLLBACK;
    END IF;
    
	IF NOT EXISTS (SELECT idpessoa FROM tb_funcionarios WHERE idpessoa = vidpessoa) THEN
		INSERT INTO tb_funcionarios VALUES(NULL, vidpessoa, pvlsalario, pdtadmissao);
    ELSE
		SELECT "Usuário já cadastrado" AS 'Resultado';
        ROLLBACK;
    END IF;
    
    COMMIT;
    SELECT "Usuário cadastrado com sucesso" AS 'Resultado';
    
END$$
DELIMITER ;

CALL sp_funcionario_save('Fernanda', 50000, CURRENT_DATE());
CALL sp_funcionario_save('João', 50000, CURRENT_DATE());
CALL sp_funcionario_save('João ZVM', 50000, CURRENT_DATE());

DROP VIEW IF EXISTS v_funcionarios;
CREATE VIEW IF NOT EXISTS v_funcionarios
AS
SELECT 
	b.desnome AS 'Nome', 
    a.vlsalario AS 'Salario'
FROM tb_funcionarios a
INNER JOIN tb_pessoas b
USING(idpessoa);

SELECT * FROM v_funcionarios;
