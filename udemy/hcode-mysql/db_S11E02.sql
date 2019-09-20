# Seção 11, Aula: 24.23 - Filtrando grupos com HAVING

# HAVING usado somente com GROUP BY
# de certo modo, pode-se dizer que o HAVING é o WHERE do GROUP BY

USE hcode_mysql;

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
HAVING TOTAL > 1500
ORDER BY TOTAL DESC;