# Seção 11, Aula: 23.22 - A cláusula GROUP BY

USE hcode_mysql;

DROP TABLE IF EXISTS tb_pedidos;
CREATE TABLE IF NOT EXISTS tb_pedidos (
	idpedido INT NOT NULL AUTO_INCREMENT,
    idpessoa INT NOT NULL,
    dtpedido DATETIME NOT NULL, 
    vlpedido DEC(10,2) NOT NULL,
	CONSTRAINT PK_pedidos PRIMARY KEY (idpedido),
    CONSTRAINT FK_pedidos_pessoas FOREIGN KEY (idpessoa)
		REFERENCES tb_pessoas (idpessoa)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SELECT * FROM tb_pessoas;
INSERT INTO tb_pedidos VALUES 
(NULL, 1, CURRENT_DATE(), 123.45),
(NULL, 1, CURRENT_DATE(), 350.99),
(NULL, 1, CURRENT_DATE(), 1000),
(NULL, 3, CURRENT_DATE(), 2475.15),
(NULL, 3, CURRENT_DATE(), 100);

SELECT * FROM tb_pedidos;

SELECT 
	b.desnome as 'Nome', 
    SUM(a.vlpedido) as 'TOTAL',
    CONVERT(AVG(a.vlpedido), DEC(10,2)) as 'MEDIA',
    MIN(a.vlpedido) as 'MENOR COMPRA',
    MAX(a.vlpedido) as 'MAIOR COMPRA',    
    COUNT(*) as 'TOTAL DE PEDIDOS'    
FROM tb_pedidos a
INNER JOIN tb_pessoas b
USING(idpessoa)
GROUP BY a.idpessoa
ORDER BY TOTAL DESC;