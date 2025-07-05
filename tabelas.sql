CREATE TABLE Produtos (
    id INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    categoria VARCHAR(50),
    preco DECIMAL(10,2) NOT NULL,
    estoque INT NOT NULL,
    estoque_minimo INT DEFAULT 5
);

CREATE TABLE Vendas (
    id INT PRIMARY KEY,
    data_venda DATE NOT NULL,
    hora_venda TIME NOT NULL,
    valor_total DECIMAL(10,2) NOT NULL
);

CREATE TABLE Itens_Venda (
    id INT PRIMARY KEY,
    venda_id INT NOT NULL,
    produto_id INT NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (venda_id) REFERENCES Vendas(id),
    FOREIGN KEY (produto_id) REFERENCES Produtos(id)
  );
