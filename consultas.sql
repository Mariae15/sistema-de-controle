SELECT nome, estoque, estoque_minimo 
FROM Produtos 
WHERE estoque < estoque_minimo;

SELECT data_venda, SUM(valor_total) as total_dia
FROM Vendas
GROUP BY data_venda
ORDER BY data_venda;

SELECT p.nome, SUM(iv.quantidade) as total_vendido
FROM Itens_Venda iv
JOIN Produtos p ON iv.produto_id = p.id
GROUP BY p.nome
ORDER BY total_vendido DESC;

SELECT AVG(valor_total) as media_valor_venda
FROM Vendas;

SELECT v.id, v.data_venda, v.hora_venda, p.nome as produto, 
       iv.quantidade, iv.preco_unitario, (iv.quantidade * iv.preco_unitario) as subtotal
FROM Vendas v
JOIN Itens_Venda iv ON v.id = iv.venda_id
JOIN Produtos p ON iv.produto_id = p.id
ORDER BY v.data_venda, v.hora_venda;
