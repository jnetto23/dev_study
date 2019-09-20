# Seção 12, Aula: 28.27 - Criando FUNÇÕES

USE hcode_mysql;

DROP FUNCTION IF EXISTS fn_imposto_renda;
DELIMITER $$
CREATE FUNCTION fn_imposto_renda(
	pvlsalario DEC(10,2)
)
RETURNS DEC(10,2)
BEGIN
	DECLARE vimposto DEC(10,2);
    /*
		ate 1903,98 não paga imposto
        1903,99 ate 2826,65 paga 7,5% deduzir do imposto 142,80
        2826,66 ate 3751,05 paga 15% deduzir do imposto 354,80
        3751,06 ate 4664,68 paga 22,5% deduzir do imposto 636,13
        acima de 4664,68 paga 27,5% deduzir do imposto 869,36
    */
    SET vimposto = CASE
		WHEN pvlsalario <= 1903.98 THEN 0
        WHEN pvlsalario >= 1903.99 AND pvlsalario <= 2826.65 THEN (pvlsalario * .075) - 142.8
        WHEN pvlsalario >= 2826.66 AND pvlsalario <= 3751.05 THEN (pvlsalario * .15) - 354.8
        WHEN pvlsalario >= 3751.05 AND pvlsalario <= 4664.68 THEN (pvlsalario * .225) - 636.13
        WHEN pvlsalario > 4664.68 THEN (pvlsalario * .275) - 869.36
    END;
    
    RETURN CONVERT(vimposto, DEC(10,2));
    
END$$
DELIMITER ;

UPDATE tb_funcionarios SET vlsalario = 3500 WHERE idfuncionario = 1;

SELECT *, 
fn_imposto_renda(Salario) AS 'IR',
Salario - fn_imposto_renda(Salario) AS 'Salario Liquido'  
FROM v_funcionarios;