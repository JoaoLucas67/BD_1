CREATE DATABASE db_automotiva;

USE db_automotiva;

CREATE TABLE tbl_tipo_cliente (
            status_cliente VARCHAR(20),
            porcentagem_desconto FLOAT,
            PRIMARY KEY (status_cliente)
);

INSERT INTO tbl_tipo_cliente (status_cliente, porcentagem_desconto) VALUES            
            ('Comum', 0.0),            
            ('Especial', 10.0);

CREATE TABLE tbl_fornecedor (
            id_fornecedor INT,
            razao_social VARCHAR(100),
            cnpj VARCHAR(20),
            email VARCHAR(100),
            PRIMARY KEY (id_fornecedor)
);

INSERT INTO tbl_fornecedor (id_fornecedor, razao_social, cnpj, email) VALUES            
            (444, 'Filtros Evolution Ltda', '67.676.767/0001-67', 'compras@filtrosevolution.com.br'),            
            (456, 'Carburador & Cia', '32.382.302/0001-72', 'vendas@carburador.br'),      
            (443, 'Lubri´s', '33.333.333/0001-33', 'pedidos@lubribr.com.br'),
            (439, 'Baterias Márcio', '44.444.444/0001-44', 'vendas@marcio.com,br'),
            (440, 'Sophi Pneus', '55.559.505/8001-55', 'contato@sophipneus.com.br');


CREATE TABLE tbl_peca (
            id_peca INT,
            descricao VARCHAR(100),
            categoria VARCHAR(100),
            marca VARCHAR(100),
            preco_venda FLOAT,
            estoque INT,
            PRIMARY KEY (id_peca)
);


CREATE TABLE tbl_cliente (
            id_cliente INT,
            nome VARCHAR(100),
            status_cliente VARCHAR(20),
            PRIMARY KEY (id_cliente),
            FOREIGN KEY (status_cliente) REFERENCES tbl_tipo_cliente (status_cliente)
);

INSERT INTO tbl_cliente (id_cliente, nome, status_cliente) VALUES            
            (101, 'José', 'Comum'),            
            (102, 'Marcia', 'Especial'),            
            (103, 'Robson', 'Especial'),
            (104, 'Justin', 'Comum'),
            (105, 'Roberval', 'Comum');

CREATE TABLE tbl_fornecimento_peca (
            id_fornecedor INT,
            id_peca INT,
            preco_compra FLOAT,
            prazo_entrega_dias INT,
            PRIMARY KEY (id_fornecedor, id_peca),
            FOREIGN KEY (id_fornecedor) REFERENCES tbl_fornecedor (id_fornecedor),
            FOREIGN KEY (id_peca) REFERENCES tbl_peca (id_peca)
);

INSERT INTO tbl_fornecimento_peca (id_fornecedor, id_peca, preco_compra, prazo_entrega_dias) VALUES            
            (444, 1, 70.00, 3),            
            (456, 2, 20.00, 1),            
            (443, 3, 160.00, 5),            
            (439, 4, 35.00, 2),
            (440, 5, 250.00, 4);

CREATE TABLE tbl_telefone (
            id_telefone INT,
            numero VARCHAR(20),
            id_cliente INT,
            PRIMARY KEY (id_telefone),
            FOREIGN KEY (id_cliente) REFERENCES tbl_cliente (id_cliente)
);

INSERT INTO tbl_telefone (id_telefone, numero, id_cliente) VALUES            
            (10, '(11) 91341-7655', 101),            
            (20, '(11) 98293-9750', 102),            
            (30, '(11) 96666-3333', 103),            
            (40, '(11) 95235-4042', 105),
            (50, '(11) 93425-5590', 104);

CREATE TABLE tbl_endereco (
            id_endereco INT,
            rua VARCHAR(100),
            bairro VARCHAR(100),
            cep VARCHAR(20),
            cidade VARCHAR(100),
            id_cliente INT,
            PRIMARY KEY (id_endereco),
            FOREIGN KEY (id_cliente) REFERENCES tbl_cliente (id_cliente)
);

INSERT INTO tbl_endereco (id_endereco, rua, bairro, cep, cidade, id_cliente) VALUES            
            (301, 'Rua Igarapé Água Azul, 70 ', 'Cidade Tiradentes', '08471-000', 'São Paulo', 101),            
            (302, 'Rua Milagre dos Peixes, 700 ', 'Cidade Tiradentes', '08490-000', 'São Paulo', 102),            
            (303, 'Rua Márcio Beck Machado, 109', 'Cidade Tiradentes', '08470-130', 'São Paulo', 103),
            (304, 'Rua  Coração de Maçã, 270', 'Cidade Tiradentes', '08474-000', 'São Paulo', 104),
            (305, 'Estrada Iguatemi, 2500', 'Cidade Tiradentes', '08485-310', 'São Paulo', 105);

CREATE TABLE tbl_pedido (
            id_pedido INT,
            data DATE,
            valor_total FLOAT,
            status_pedido VARCHAR(50),
            id_cliente INT,
            PRIMARY KEY (id_pedido),
            FOREIGN KEY (id_cliente) REFERENCES tbl_cliente (id_cliente)
);

INSERT INTO tbl_pedido (id_pedido, data, valor_total, status_pedido, id_cliente) VALUES            
            (444, '14/10/2026', 167.50, 'Concluído', 101),            
            (456, '20/10/2026', 242.00, 'Em Andamento', 102),            
            (443, '20/10/2026', 338.00, 'Aguardando Pagamento', 103),
            (439, '06/10/2026', 453.00, 'Concluído', 104),
            (440, '26/10/2026', 127.50, 'Em Andamento', 105);

CREATE TABLE tbl_item_pedido (
            id_pedido INT,
            id_peca INT,
            qtd INT,
            preco_unitario FLOAT,
            sub_total FLOAT,
            PRIMARY KEY (id_pedido, id_peca),
            FOREIGN KEY (id_pedido) REFERENCES tbl_pedido (id_pedido),
            FOREIGN KEY (id_peca) REFERENCES tbl_peca (id_peca)
);

INSERT INTO tbl_item_pedido (id_pedido, id_peca, qtd, preco_unitario, sub_total) VALUES                        
            (444, 1, 1, 120.50, 120.50),                        
            (444, 2, 1, 36.00, 45.00),                        
            (456, 3, 1, 233.00, 280.00),                        
            (443, 4, 8, 64.00, 520.00),            
            (439, 5, 1, 410.00, 450.00),
            (440, 1, 1, 159.50, 120.50);
