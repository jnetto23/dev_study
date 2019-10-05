DROP DATABASE IF EXISTS login;
CREATE DATABASE IF NOT EXISTS login
DEFAULT CHARSET = utf8
DEFAULT COLLATE = utf8_general_ci;

USE login;

DROP TABLE IF EXISTS tb_users;
CREATE TABLE IF NOT EXISTS tb_users (
	id INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    pwd VARCHAR(32) NOT NULL,
    CONSTRAINT PK_users PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP PROCEDURE IF EXISTS sp_user_save;
DELIMITER $$
CREATE PROCEDURE IF NOT EXISTS sp_user_save(
	pname VARCHAR(100),
    pemail VARCHAR(100),
    ppwd VARCHAR(32)
)
BEGIN
    DECLARE viduser INT;
    START TRANSACTION;
    IF EXISTS (SELECT id FROM tb_users WHERE email = pemail) THEN
		SELECT "Email já cadastrado" AS 'Error';
        ROLLBACK;
    ELSE
        INSERT INTO tb_users VALUES (NULL, pname, pemail, ppwd);
        SET viduser = LAST_INSERT_ID();
		COMMIT;
		SELECT * FROM tb_users WHERE id = viduser;	
    END IF;
END$$
DELIMITER ;

# Insert Default
CALL sp_user_save('Testador', 'teste@teste.com.br', MD5('123'));