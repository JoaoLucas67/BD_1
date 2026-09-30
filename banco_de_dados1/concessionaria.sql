CREATE DATABASE db_concessionaria;
USE db_concessionaria

CREATE TABLE tbl_carros (
    id INT,
    placa VARCHAR(10) UNIQUE NOT NULL,
    marca VARCHAR(50),
    modelo VARCHAR(50),
    ano INT,
    combustivel CHAR(1)
    PRIMARY KEY (id)
);

INSERT INTO tbl_carros (id, placa, marca, modelo, ano, combustivel) VALUES
(1, 'ABC1234', 'Ford', 'Corcel II', 1982, 'G'),
(2, 'JKG5678', 'Ford', 'Focus', 2001, 'A'),
(3, 'LKO8954', 'Renault', 'Clio', 2007, 'F'),
(4, 'MMS1609', 'VolksWagen', 'Fusca', 1973, 'G'),
(5, 'ASD123', 'Honda', 'Civic', 2010, 'F'),
(6, 'gtr4596', 'GM', 'Corsa', 2004, 'A');

CREATE TABLE tbl_vendedores (
    codigo INT ,
    nome VARCHAR(100),
    carro VARCHAR(10),
    cidade VARCHAR(50),
    estado CHAR(2),
    comissao DECIMAL(4,2),
    FOREIGN KEY (carro) REFERENCES tbl_carros (placa),
    PRIMARY KEY (codigo)
);

INSERT INTO tbl_vendedores (codigo, nome, carro, cidade, estado, comissao) VALUES
(1, 'Juca da Silva', 'ABC1234', 'Pelotas', 'RS', 3.50),
(3, 'Antonio Vieira', 'JKG5678', 'Dois Vizinhos', 'PR', 5.00),
(44, 'Julieta da Silva', NULL, 'Verê', 'PR', 2.50),
(6, 'Maria Francisca', 'LKO8954', 'Dois Vizinhos', 'PR', 2.00),
(45, 'Marieta da Silva', NULL, 'Verê', 'PR', 2.80),
(9, 'Juca silva', NULL, 'PELOTAS', 'RS', 3.50),
(18, 'Maria Guedes', 'MMS1609', 'Brasília', 'DF', 5.40),
(20, 'Jian de Barros', 'ASD123', 'Curitiba', 'PR', 3.40),
(28, 'Fagundes de azevedo', NULL, 'Verê', 'PR', 2.80),
(40, 'Ari Ribas', 'GTR4596', 'Erechim', 'RS', 3.50);

INSERT INTO tbl_carros (id, placa, marca, modelo, ano, combustivel) VALUES
(7, 'GUI9013', 'Fiat', 'Uno', 2015, 'F'),
(8, 'KSX3247', 'Chevrolet', 'Onix', 2020, 'F'),
(9, 'HGT1122', 'Toyota', 'Corolla', 2018, 'G'),
(10, 'RTY8899', 'Volkswagen', 'Gol', 2019, 'F');

UPDATE tbl_vendedores SET carro = 'GUI9013' WHERE codigo = 44;
UPDATE tbl_vendedores SET carro = 'KSX3247' WHERE codigo = 45;
UPDATE tbl_vendedores SET carro = 'HGT1122' WHERE codigo = 9;
UPDATE tbl_vendedores SET carro = 'RTY8899' WHERE codigo = 28;

SELECT * FROM tbl_carros;
SELECT * FROM tbl_vendedores;
