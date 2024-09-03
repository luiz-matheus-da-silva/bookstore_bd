CREATE DATABASE livrariaBooksCo;
USE livrariaBooksCo;

CREATE TABLE fornecedores (
    id_fornecedor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cnpj VARCHAR(20) NOT NULL,
    contato VARCHAR(50)
);

CREATE TABLE livros (
    id_livro INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    autor VARCHAR(100) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    quantidade_estoque INT NOT NULL,
    id_fornecedor INT,
    FOREIGN KEY (id_fornecedor) REFERENCES fornecedores(id_fornecedor)
);

CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    telefone VARCHAR(20)
);

CREATE TABLE vendas (
    id_venda INT AUTO_INCREMENT PRIMARY KEY,
    data DATE NOT NULL,
    id_cliente INT,
    total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

CREATE TABLE vendas_Livros (
    id_venda INT,
    id_livro INT,
    quantidade INT NOT NULL,
    PRIMARY KEY (id_venda, id_livro),
    FOREIGN KEY (id_venda) REFERENCES vendas(id_venda),
    FOREIGN KEY (id_livro) REFERENCES livros(id_livro)
);

INSERT INTO fornecedores (nome, cnpj, contato) VALUES 
('Editora Globo', '12.345.678/0001-99', 'contato@editoraglobo.com'),
('Saraiva Distribuidora', '98.765.432/0001-88', 'contato@saraiva.com'),
('Record Books', '33.444.555/0001-77', 'contato@recordbooks.com'),
('Companhia das Letras', '44.555.666/0001-66', 'contato@companhiadasletras.com');

INSERT INTO livros (titulo, autor, preco, quantidade_estoque, id_fornecedor) VALUES 
('O Alquimista', 'Paulo Coelho', 45.90, 20, 1),
('A Garota no Trem', 'Paula Hawkins', 39.90, 10, 2),
('1984', 'George Orwell', 34.90, 15, 3),
('O Hobbit', 'J.R.R. Tolkien', 49.90, 8, 4);

INSERT INTO clientes (nome, email, telefone) VALUES 
('Ana Silva', 'ana.silva@gmail.com', '11888877777'),
('Carlos Oliveira', 'carlos.oliveira@gmail.com', '11877788888'),
('Maria Souza', 'maria.souza@gmail.com', '11999988888'),
('João Pereira', 'joao.pereira@gmail.com', '11988877777');

INSERT INTO vendas (data, id_cliente, total) VALUES 
('2024-10-01', 2, 89.80),
('2024-10-02', 1, 45.90),
('2024-10-03', 3, 34.90),
('2024-10-04', 4, 49.90);

INSERT INTO vendas_Livros (id_venda, id_livro, quantidade) VALUES 
(1, 1, 2),
(1, 2, 3),
(2, 1, 1),
(3, 3, 1),
(4, 4, 1);
