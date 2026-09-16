CREATE DATABASE db_clinica;

USE db_clinica;

CREATE TABLE tbl_paciente (
			rg VARCHAR (20),
			nome VARCHAR (100),
			PRIMARY KEY (rg)
);	


INSERT INTO tbl_paciente (rg, nome) VALUES
			('23.481.905-2', 'Yuri'),
			('41.723.058-6', 'Luan'),
			('12.943.811-3', 'Daniella'),
			('28.674.319-X', 'Denis'),
			('50.218.457-2', 'Victor') ;

CREATE TABLE tbl_medico (
			crm VARCHAR (20),
			nome VARCHAR (100),
			rg VARCHAR (20),
			PRIMARY KEY (crm)
);

INSERT INTO tbl_medico(crm, nome, rg) VALUES
			('156.890', 'Dr. Grassioto', '37.512.984-61'),
			('778.909', 'Dr. Marques', '21.843.609-1'),
			('678.421', 'Dr. Margarido', '32.951.467-3'),
			('903.345', 'Dr. Luango', '49.065.172-8'),
			('878.067', 'Dr. Bordim', '37.512.984-6');

CREATE TABLE tbl_convenio (
			id_convenio INT,
			nome VARCHAR (100),
			rg_paciente VARCHAR (20),
			PRIMARY KEY (id_convenio),
			FOREIGN KEY (rg_paciente) REFERENCES tbl_paciente (rg)
);

INSERT INTO tbl_convenio (id_convenio, nome, rg_paciente) VALUES
			(601, 'Unimed', '23.481.905-2'),
			(602, 'Bradesco Saúde', '41.723.058-6'),
			(603, 'SulAmérica', '12.943.811-3'),
			(604, 'Amil', '28.674.319-X'),
			(605, 'Unimed', '50.218.457-2');

CREATE TABLE tbl_endereco (
			id_endereco INT,
			rua VARCHAR (100),
			bairro VARCHAR (100),
			cidade VARCHAR (100),
			cep VARCHAR (100),
			logradouro VARCHAR (100),
			rg_paciente VARCHAR (20),
			PRIMARY KEY (id_endereco),
			FOREIGN KEY (rg_paciente) REFERENCES tbl_paciente (rg)
);

INSERT INTO tbl_endereco (id_endereco, rua, bairro, cidade, cep, logradouro, rg_paciente) VALUES
			(501, 'Rua dos Têxteis, 100', 'Cidade Tiradentes', 'São Paulo', '08470-000', 'Rua', '23.481.905-2'),
			(502, 'Avenida Metalúrgicos, 550', 'Cidade Tiradentes', 'São Paulo', '08471-000', 'Avenida', '41.723.058-6'),
			(503, 'Rua Sara Kubitschek, 45', 'Cidade Tiradentes', 'São Paulo', '08474-000', 'Rua', '12.943.811-3'),
			(504, 'Rua dos Fabricantes, 210', 'Cidade Tiradentes', 'São Paulo', '08472-000', 'Rua', '28.674.319-X'),
			(505, 'Avenida Vitória Régia, 320', 'Cidade Tiradentes', 'São Paulo', '08473-000', 'Avenida', '50.218.457-2');

CREATE TABLE tbl_consulta (
			id_consulta INT,
			data_consulta DATE,
			hora_consulta TIME,
			crm_medico VARCHAR(20),
			rg_paciente VARCHAR(20),
			PRIMARY KEY (id_consulta),
			FOREIGN KEY (crm_medico) REFERENCES tbl_medico (crm),
			FOREIGN KEY (rg_paciente) REFERENCES tbl_paciente (rg)
);

INSERT INTO tbl_consulta (id_consulta, data_consulta, hora_consulta, crm_medico, rg_paciente) VALUES
			(701, '2026/09/10', '09:00', '156.890', '23.481.905-2'),
			(702, '2026/09/11', '10:30', '778.909', '41.723.058-6'),
			(703, '2026/09/12', '14:00', '678.421', '12.943.811-3'),
			(704, '2026/09/12', '15:45', '903.345', '28.674.319-X'),
			(705, '2026/09/14', '08:15', '878.067', '50.218.457-2');

SELECT * FROM tbl_paciente
SELECT * FROM tbl_medico
SELECT * FROM tbl_convenio
SELECT * FROM tbl_endereco
SELECT * FROM tbl_consulta