# Seção 12, Aula: 25.24 - Criando VIEWS
# 'VIEW é o atalho de um SELECT'

USE hcode_mysql;

CREATE VIEW v_pedidos_totais
AS
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

SELECT * FROM v_pedidos_totais;
