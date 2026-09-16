CREATE DATABASE db_confeitaria;

USE db_confeitaria;

CREATE TABLE tbl_cliente (
			id_cliente INT,
			nome VARCHAR (100),
			PRIMARY KEY (id_cliente)
);

INSERT INTO tbl_cliente (id_cliente, nome) VALUES
			(1, 'Sophia'),
			(2, 'Miguel'),
			(3, 'Helena'),
			(4, 'Marcos'),
			(5, 'Flávio');

CREATE TABLE tbl_produto (
			id_produto INT,
			valor_kg FLOAT,
			descricao VARCHAR (200)
			PRIMARY KEY (id_produto)
);

INSERT INTO tbl_produto (id_produto, descricao, valor_kg) VALUES
			(10, 'Bolo de Chocolate Branco', 54.90),
			(11, 'Torta de Maçã', 32.00),
			(12, 'Bolo de Coco', 40.00),
			(13, 'Torta de Maracujá', 38.45),
			(14, 'Bolo de leite Ninho com brigadeiro', 62.00);

CREATE TABLE tbl_pedido (
			id_pedido INT,
			data DATE,
			valor_total FLOAT,
			id_cliente INT,
			PRIMARY KEY (id_pedido),
			FOREIGN KEY (id_cliente) REFERENCES tbl_cliente (id_cliente)
);

INSERT INTO tbl_pedido (id_pedido, data, valor_total, id_cliente) VALUES
			(30, '05/10/2026', 54.90, 1),
			(40, '01/10/2026', 32.00, 2),
			(50, '09/10/2026', 40.00, 3),
			(60, '16/10/2026', 80.00, 4),
			(70, '12/10/2026', 124.00, 5);

CREATE TABLE tbl_telefone_cliente (
			id_cliente INT,
			telefone VARCHAR (20),
			PRIMARY KEY (id_cliente, telefone),
			FOREIGN KEY (id_cliente) REFERENCES tbl_cliente (id_cliente)
		);

INSERT INTO tbl_telefone_cliente (id_cliente, telefone) VALUES
			(1, '(11) 90735-4331'),
			(2, '(11) 94456-5892'),
			(3, '(11) 91434-5878'),
			(4, '(11) 92345-6329'),
			(5, '(11) 94675-9729');

CREATE TABLE tbl_item_pedido (
			id_pedido INT,
			id_produto INT,
			quantidade INT,
			PRIMARY KEY (id_pedido, id_produto),
			FOREIGN KEY (id_pedido) REFERENCES tbl_pedido (id_pedido),
			FOREIGN KEY (id_produto) REFERENCES tbl_produto (id_produto)
);

INSERT INTO tbl_item_pedido (id_pedido, id_produto, quantidade) VALUES
			(30, 10, 1),
			(40, 11, 1),
			(50, 12, 1),
			(60, 12, 2),
			(70, 14, 2);

		 
