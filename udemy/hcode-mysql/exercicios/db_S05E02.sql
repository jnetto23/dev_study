# Seção 5, Aula: 11.11 - Dominando o comando insert

USE hcode_mysql;

DROP TABLE IF EXISTS tb_pessoas;
CREATE TABLE IF NOT EXISTS tb_pessoas (
	id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    sexo ENUM('M','F') NOT NULL,
    PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Trabalhando com os tipos de INSERT
# Método 1: INSERT POSICIONAL
# Os valores devem ser passados na mesma ordem da tabela

INSERT INTO tb_pessoas VALUES (1, 'João', 'M');

# Método 2: INSERT DECLARATIVO
# Os valores devem ser passados na mesma ordem que foram anteriormente declarados
INSERT INTO tb_pessoas (sexo, nome) VALUES ('F', 'Maria');

# Inserindo mais de um registro no mesmo comando
INSERT INTO tb_pessoas (nome, sexo) VALUES
('Divanei','M'), 
('Luiz','M'), 
('Djalma','M'), 
('Natali','F'), 
('Tatiane','F'), 
('Cristiane','F'), 
('Jaqueline','F'); 

SELECT * FROM tb_pessoas;
SELECT * FROM tb_funcionarios;

# Fazendo INSERT com SELECT
INSERT INTO tb_funcionarios
SELECT id, nome, 950, CURRENT_DATE(), sexo, NULL FROM tb_pessoas;
