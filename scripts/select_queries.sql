-- recupere todos os clientes que foram atendidos nas vendas por vendedores da Loja Unidade Minas Gerais
SELECT c.nome AS "Nome do Cliente"
FROM tb_cliente c
INNER JOIN tb_venda v
ON c.pk_cliente = v.fk_cliente
INNER JOIN tb_loja l
ON v.fk_loja = l.pk_loja
WHERE l.nome = 'Loja Unidade Minas Gerais'

-- para cada produto existente diga quais vendas foram realizadas e quantos itens foram pedidos
SELECT
    p.nome AS "Nome do Produto",
    COUNT(DISTINCT v.pk_venda) AS "Qtd de Venda",
    COUNT(i.fk_produto) AS "Qtd de Unidades Pedidas"
FROM tb_produto p
INNER JOIN tb_itens i
ON p.pk_produto = i.fk_produto
INNER JOIN tb_venda v
ON v.pk_venda = i.fk_venda
GROUP BY p.nome

-- para cada produto mostre as notas fiscais de venda para os itens que corresponderem aos seus produtos
SELECT 
    p.nome AS "Nome do Produto",
    i.fk_produto AS "ID do Produto",
    v.pk_venda AS "ID de Venda",
    nf.pk_notafiscal AS "ID de Nota Fiscal"
FROM tb_produto p
INNER JOIN tb_itens i
ON p.pk_produto = i.fk_produto
INNER JOIN tb_venda v
ON v.pk_venda = i.fk_venda
INNER JOIN tb_notafiscal nf
ON nf.fk_venda = v.pk_venda

-- agrupe todos os vendedores e suas vendas
SELECT
    v.nome AS "Nome do Vendedor",
    ve.pk_venda AS "ID da Venda",
    ve.data_venda AS "Data da Venda"
FROM tb_vendedor v
LEFT JOIN tb_venda ve
ON v.pk_vendedor = ve.fk_vendedor

-- para cada vendedor mostre quantas vendas foram realizadas
SELECT 
    v.nome AS "Nome do Vendedor",
    COUNT(ve.pk_venda) AS "Quantidade de Vendas"
FROM tb_vendedor v
LEFT JOIN tb_venda ve
ON v.pk_vendedor = ve.fk_vendedor
GROUP BY v.nome
ORDER BY COUNT(ve.pk_venda) DESC