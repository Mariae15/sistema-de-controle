INSERT INTO Produtos (nome, categoria, preco, estoque, estoque_minimo) VALUES
('Notebook Dell', 'Eletrônicos', 3500.00, 10, 3),
('Mouse Sem Fio', 'Acessórios', 120.00, 25, 10),
('Teclado Mecânico', 'Acessórios', 250.00, 15, 5),
('Monitor 24"', 'Eletrônicos', 900.00, 8, 2),
('Cadeira Gamer', 'Móveis', 1200.00, 5, 2);

INSERT INTO Vendas (data_venda, hora_venda, valor_total) VALUES
('2023-05-10', '10:30:00', 3700.00),
('2023-05-10', '15:45:00', 250.00),
('2023-05-11', '09:15:00', 4650.00),
('2023-05-11', '11:20:00', 120.00),
('2023-05-12', '14:00:00', 1200.00);

INSERT INTO Itens_Venda (venda_id, produto_id, quantidade, preco_unitario) VALUES
(1, 1, 1, 3500.00),
(1, 2, 1, 120.00),
(1, 3, 1, 250.00),
(2, 3, 1, 250.00),
(3, 1, 1, 3500.00),
(3, 4, 1, 900.00),
(3, 5, 1, 1200.00),
(4, 2, 1, 120.00),
(5, 5, 1, 1200.00);
