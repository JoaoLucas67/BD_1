CREATE DATABASE db_firma;

USE db_firma;

CREATE TABLE tbl_produto (
		id INT,
		nome VARCHAR(100),
		categoria VARCHAR(100),
		preco VARCHAR(100),
		PRIMARY KEY (id)
);

INSERT INTO tbl_produto (id,nome,categoria,preco) VALUES 
		(1, 'SABAO EM PEDRA', 'SOLIDO', '6.00') ,
		(2, 'DETERGENTE', 'LIQUIDO', '2.49') ,
		(3, 'CANDIDA', 'LIQUIDO', '15.30');

		SELECT * FROM tbl_produto;
  
CREATE TABLE tbl_cliente (
		cod_cliente INT,
		status_cliente VARCHAR(30),
		nome_cliente VARCHAR(100),
		limite_credito VARCHAR(30),
		PRIMARY KEY (cod_cliente)
);

INSERT INTO tbl_cliente (cod_cliente, status_cliente, nome_cliente, limite_credito) VALUES
		(5, 'BOM', 'HORACIO', '560'),
		(6, 'MEDIO', 'ANDREY', '89'),
 		(7, 'RUIM', 'DOUGLAS', '140');

		SELECT * FROM tbl_cliente;

CREATE TABLE tbl_pedido (
		numero INT,
		data_elaboracao DATE,
		quantidade INT,
		id_produto INT,
		cod_cliente INT,
		PRIMARY KEY (numero),
		FOREIGN KEY (id_produto) REFERENCES tbl_produto (id),
		FOREIGN KEY (cod_cliente) REFERENCES tbl_cliente (cod_cliente)
);

INSERT INTO tbl_pedido (numero, id_produto, cod_cliente, quantidade, data_elaboracao) VALUES
		(15, 1, 5, 10, '30/05/2026'),
		(21, 3, 6, 50, '04/05/2026'),
		(18, 2, 7, 23, '01/052026');

		SELECT * FROM tbl_pedido;

CREATE TABLE tbl_endereco (
		id_endereco INT,
		rua VARCHAR (100),
		bairro VARCHAR (100),
		cidade VARCHAR (100),
		cep VARCHAR (100),
		logradouro VARCHAR (100),
		cod_cliente INT,
		PRIMARY KEY (id_endereco),
		FOREIGN KEY (cod_cliente) REFERENCES tbl_cliente (cod_cliente)
);

INSERT INTO tbl_endereco (id_endereco, cod_cliente, rua, bairro, cidade, cep, logradouro) VALUES
		(300, 5, 'Rua Conto de Areia, 202', 'Cidade Tiradentes', 'São Paulo', '08474-220', 'Rua'),
		(301, 6, 'Avenida Metalúrgicos, 1797', 'Cidade Tiradentes', 'São Paulo', '08471-000', 'Avenida'),
		(302, 7, 'Travessa Cláudio Bonifácio, 414', 'Cidade Tiradentes', 'São Paulo', '08474-000', 'Travessa');

		SELECT * FROM tbl_endereco;

CREATE TABLE tbl_telefone (
		id_telefone INT ,
		cod_cliente INT,
		numero VARCHAR(20),
		tipo VARCHAR(20),
		PRIMARY KEY (id_telefone),
		FOREIGN KEY (cod_cliente) REFERENCES tbl_cliente (cod_cliente)
);

INSERT INTO tbl_telefone (id_telefone, cod_cliente, numero, tipo) VALUES
		(40, 5, '(11) 94321-0123', 'Celular'),
		(50, 6, '(11) 3456-7890', 'Residencial'),
		(60, 7, '(11) 91234-0679', 'Celular');

