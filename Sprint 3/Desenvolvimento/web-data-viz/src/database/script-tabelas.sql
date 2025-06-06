-- Arquivo de apoio, caso você queira criar tabelas como as aqui criadas para a API funcionar.
-- Você precisa executar os comandos no banco de dados para criar as tabelas,
-- ter este arquivo aqui não significa que a tabela em seu BD estará como abaixo!

/*
comandos para mysql server
*/
CREATE DATABASE sentinela;
USE sentinela;

-- Tabela de empresas clientes
CREATE TABLE empresa_cliente (
    idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
    token INT UNIQUE,
    nome_empresa VARCHAR(50) NOT NULL,
    CNPJ VARCHAR(20)   UNIQUE,
    CEO VARCHAR(50)
);

CREATE TABLE gestores (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    email VARCHAR(100),
    senha VARCHAR(20),
    cpf char(11),
    fkToken int,
    FOREIGN KEY (fkToken) REFERENCES empresa_cliente(token)
);

CREATE TABLE veiculo (
    idVeiculo INT PRIMARY KEY AUTO_INCREMENT,
    placa VARCHAR(8)  UNIQUE,
    ano INT,
    modelo VARCHAR(45),
    telefone varchar(30),
    fk_empresa INT,
	FOREIGN KEY (fk_empresa) REFERENCES empresa_cliente(idEmpresa)
);

CREATE TABLE sensor (
    idSensor INT PRIMARY KEY AUTO_INCREMENT,
    status VARCHAR(45),
    ultima_manutencao DATE,
    fk_veiculo INT,
    FOREIGN KEY (fk_veiculo) REFERENCES veiculo(idVeiculo)
);

CREATE TABLE protocolo (
  id_protocolo INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  inicio_atuacao DATE NULL,
  temperatura_minima DECIMAL(4,2) NULL,
  temperatura_maxima DECIMAL(4,2) NULL
);

CREATE TABLE dado_arduino (
    idDado_Arduino INT PRIMARY KEY AUTO_INCREMENT,
    temperatura DECIMAL(4,2),
    fk_sensor INT,
    data_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fk_protocolo INT,
    FOREIGN KEY (fk_sensor) REFERENCES sensor(idSensor),
    FOREIGN KEY (fk_protocolo) REFERENCES protocolo(id_protocolo)
);

INSERT INTO empresa_cliente (token, nome_empresa, CNPJ, CEO) VALUES
(100 ,'Picanha para todos LTDA',  '12345678000101', 'Carlos Albuquerque'),  -- NÃO ESQUECER DE COLOCAR O IDEMPRESA E O TOKEN MANUALMENTE
(200 ,'Carga Pesada Express', '23456789000102', 'Fernanda Oliveira'),
(300 ,'Logística Nacional', '34567890000103', 'Roberto Nascimento'),
(400 ,'Frete Rápido', '45678901000104', 'Patrícia Santos'),
(500 ,'TransOlho Vivo', '56789012000105', 'Ricardo Ferreira'),
(600 ,'Transportes Verde', '67890123000106', 'Juliana Costa'),
(700 ,'Caminhões Rei', '78901234000107', 'Marcos Silveira'),
(800 ,'Rodovias Seguras', '89012345000108', 'Ana Paula Lima'),
(900 ,'Frota Pesada', '90123456000109', 'Lucas Mendes'),
(1000, 'Transportadora Estrela', '01234567000110', 'Eduardo Pereira');

INSERT INTO veiculo (placa, ano, modelo, fk_empresa, telefone) VALUES
('ABC1D23', 2020, 'Volvo FH 540', 1, '(11) 91234-5678'),
('DEF2G34', 2019, 'Scania R500', 1, '(21) 93456-7890'),
('GHI3J45', 2021, 'Mercedes-Benz Actros', 1, '(31) 95678-9012'),
('JKL4M56', 2018, 'Volkswagen Constellation', 1, '(41) 97890-1234'),
('MNO5P67', 2022, 'Ford Cargo 2429', 1, '(51) 92345-6789'),
('PQR6S78', 2020, 'DAF XF 480', 1, '(61) 98765-4321'),
('STU7T89', 2019, 'Iveco Hi-Way', 1, '(71) 94321-5678'),
('VWX8U90', 2021, 'MAN TGX', 1, '(81) 95432-1987'),
('YZA9V01', 2018, 'Volvo VM 270', 1, '(91) 96543-2109'),
('BCD0X12', 2022, 'Scania G440', 1, '(85) 97654-3210'),
('EFG1Y23', 2020, 'Volvo FH 460', 1, '(98) 98765-4320'),
('HIJ2Z34', 2019, 'Mercedes-Benz Axor', 1, '(83) 91234-8765'),
('KLM3W45', 2021, 'DAF CF 85', 1, '(67) 93456-7891'),
('NOP4X56', 2018, 'Volkswagen Worker', 1, '(84) 95678-9021'),
('QRS5Y67', 2022, 'Scania R450', 1, '(82) 97890-1342'),
('TUV6Z78', 2020, 'MAN TGS', 1, '(86) 92345-6890'),
('VWX7W89', 2019, 'Iveco Stralis', 1, '(92) 98765-4300'),
('YZA8X90', 2021, 'Ford Cargo 2432', 1, '(47) 94321-5768'),
('BCD9Y01', 2018, 'Volvo FH 500', 1, '(53) 95432-1887'),
('EFG0Z12', 2022, 'Mercedes-Benz Atron', 1, '(73) 96543-2110'),
('KLM9B11', 2021, 'Volvo FH 460', 1, '(88) 97654-3221'),
('NOP0C22', 2020, 'Scania R450', 1, '(89) 98765-4332'),
('QRS1D33', 2019, 'Mercedes-Benz Axor 3344', 1, '(96) 91234-8789'),
('TUV2E44', 2022, 'DAF XF 105', 1, '(95) 93456-7870'),
('VWX3F55', 2018, 'MAN TGX 28.440', 1, '(94) 95678-9011'),
('YZA4G66', 2021, 'Volkswagen Constellation 24.250', 1, '(93) 97890-1323'),
('BCD5H77', 2020, 'Iveco Hi-Way 460', 1, '(91) 92345-6778'),
('EFG6I88', 2019, 'Ford Cargo 2428', 1, '(87) 98765-4399'),
('HIJ7J99', 2022, 'Scania G410', 1, '(86) 94321-5698'),
('KLM8K00', 2018, 'Volvo VM 270', 1, '(85) 95432-1900'),
('OPQ9L11', 2021, 'Mercedes-Benz Atron 2035', 1, '(84) 96543-2134'),
('RST0M22', 2020, 'DAF CF 85.430', 1, '(83) 97654-3245'),
('UVW1N33', 2019, 'MAN TGS 28.440', 1, '(82) 98765-4356'),
('XYZ2O44', 2022, 'Volvo FH 540', 1, '(81) 91234-8998'),
('ABC3P55', 2018, 'Scania R500', 1, '(11) 93456-7901'),
('DEF4Q66', 2021, 'Volkswagen Worker 31.280', 1, '(21) 95678-9032');



INSERT INTO sensor (status, ultima_manutencao, fk_veiculo) VALUES
('ativo', '2023-01-15', 1),
('ativo', '2023-02-20', 2),
('manutencao', '2023-03-10', 3),
('ativo', '2023-04-05', 4),
('ativo', '2023-05-12', 5),
('inativo', '2023-06-18', 6),
('ativo', '2023-07-22', 7),
('ativo', '2023-08-30', 8),
('manutencao', '2023-09-14', 9),
('ativo', '2023-10-08', 10),
('ativo', '2023-01-10', 11),
('ativo', '2023-02-15', 12),
('manutencao', '2023-03-20', 13),
('ativo', '2023-04-25', 14),
('ativo', '2023-05-30', 15),
('inativo', '2023-06-05', 16),
('ativo', '2023-07-10', 17),
('ativo', '2023-08-15', 18),
('manutencao', '2023-09-20', 19),
('ativo', '2023-10-25', 20),
('ativo', '2023-01-05', 21),
('ativo', '2023-01-10', 22),
('manutencao', '2023-01-15', 23),
('ativo', '2023-01-20', 24),
('ativo', '2023-01-25', 25),
('inativo', '2023-01-30', 26),
('ativo', '2023-02-05', 27),
('ativo', '2023-02-10', 28),
('manutencao', '2023-02-15', 29),
('ativo', '2023-02-20', 30),
('ativo', '2023-02-25', 31),
('ativo', '2023-03-02', 32),
('manutencao', '2023-03-07', 33),
('ativo', '2023-03-12', 34),
('ativo', '2023-03-17', 35),
('inativo', '2023-03-22', 36);

INSERT INTO protocolo (inicio_atuacao, temperatura_minima, temperatura_maxima) VALUES
('2025-05-23', 0, 5);

create table alertas (
idAlerta int primary key auto_increment,
fk_sensor int,
fk_dado int,
status_alerta varchar(20),
foreign key fk_sensor(fk_sensor) references sensor(idSensor),
foreign key fk_dado(fk_dado) references dado_arduino(idDado_Arduino),
constraint chk_status check (status_alerta in ('verificar','verificado'))
);

insert into alertas (fk_sensor, fk_dado, status_alerta) values
(1,1,'verificar'),
(2,1,'verificar'),
(3,1,'verificar'); 

select count(idAlerta) as total_alertas from alertas where fk_sensor = 1;
update alertas set status_alerta = 'verificado' where fk_sensor = 1;

-- Sensor 1
INSERT INTO dado_arduino (temperatura, fk_sensor, fk_protocolo) VALUES
(1.23, 1, 1),
(2.45, 1, 1),
(3.67, 1, 1),
(4.89, 1, 1),
(0.56, 1, 1),
(1.98, 1, 1),
(3.14, 1, 1),
(2.76, 1, 1),
(0.34, 1, 1),
(4.01, 1, 1);

-- Sensor 5
INSERT INTO dado_arduino (temperatura, fk_sensor, fk_protocolo) VALUES
(0.45, 5, 1),
(1.78, 5, 1),
(2.90, 5, 1),
(4.56, 5, 1),
(3.12, 5, 1),
(2.34, 5, 1),
(0.89, 5, 1),
(1.11, 5, 1),
(3.98, 5, 1),
(4.32, 5, 1);

-- Sensor 23
INSERT INTO dado_arduino (temperatura, fk_sensor, fk_protocolo) VALUES
(2.65, 23, 1),
(3.33, 23, 1),
(4.87, 23, 1),
(1.45, 23, 1),
(0.76, 23, 1),
(3.99, 23, 1),
(2.12, 23, 1),
(1.67, 23, 1),
(0.23, 23, 1),
(4.50, 23, 1);