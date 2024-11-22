CREATE DATABASE vendas;
CREATE TABLE Produto (
    Codigo_Produto INT PRIMARY KEY,
    Descricao_Produto VARCHAR(100),
    Preco DECIMAL(10, 2)
);
CREATE TABLE Nota_Fiscal (
    Numero_NF INT PRIMARY KEY,
    Data_NF DATE,
    Valor_NF DECIMAL(10, 2)
);
CREATE TABLE Itens (
    Codigo_Produto INT,
    Numero_NF INT,
    Quantidade INT,
    Preco_Unitario DECIMAL(10, 2),
    PRIMARY KEY (Codigo_Produto, Numero_NF),
    FOREIGN KEY (Codigo_Produto) REFERENCES Produto(Codigo_Produto),
    FOREIGN KEY (Numero_NF) REFERENCES Nota_Fiscal(Numero_NF)
);
ALTER TABLE Produto MODIFY COLUMN Descricao_Produto VARCHAR(50);
ALTER TABLE Nota_Fiscal ADD COLUMN ICMS FLOAT AFTER Numero_NF;
ALTER TABLE Produto ADD COLUMN Peso FLOAT;
ALTER TABLE Itens ADD COLUMN Num_item INT PRIMARY KEY AUTO_INCREMENT;
ALTER TABLE Itens DROP PRIMARY KEY;
ALTER TABLE Itens ADD PRIMARY KEY (Num_item);
DESCRIBE Produto;
DESCRIBE Nota_Fiscal;
ALTER TABLE Nota_Fiscal CHANGE COLUMN Valor_NF ValorTotal_NF DECIMAL(10, 2);
ALTER TABLE Nota_Fiscal DROP COLUMN Data_NF;
DROP TABLE Itens;
ALTER TABLE Nota_Fiscal
RENAME TO Venda;
