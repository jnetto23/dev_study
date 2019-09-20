# Seção 5, Aula: 10.10 - Alterando e Excluindo dados

USE hcode_mysql;
SELECT * FROM tb_funcionarios;

# Para alterar um ou mais registros utilizar o comando UPDATE 'nome_da_tabela' SET 'compro que sera alterado' = 'novo valor';
# Update realizado sem WHERE apenas para estudo, NUNCA faça isso.
UPDATE tb_funcionarios 
SET salario = salario * 1.1;

SELECT * FROM tb_funcionarios;

# Para deletar um ou mais registros utilizar o comando DELETE FROM 'nome_da_tabela' WHERE 'condição'
# Delete realizado sem WHERE apenas para estudo, NUNCA faça isso.
DELETE FROM tb_funcionarios;

SELECT * FROM tb_funcionarios;