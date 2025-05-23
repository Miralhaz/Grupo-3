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

CREATE TABLE dado_arduino (
    idDado_Arduino INT PRIMARY KEY AUTO_INCREMENT,
    temperatura DECIMAL(4,2),
    fk_sensor INT,
    data_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fk_protocolo INT,
    FOREIGN KEY (fk_sensor) REFERENCES sensor(idSensor),
    FOREIGN KEY (fk_protocolo) REFERENCES protocolo(id_protocolo)
);

CREATE TABLE protocolo (
  id_protocolo INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  inicio_atuacao DATE NULL,
  temperatura_minima DECIMAL(4,2) NULL,
  temperatura_maxima DECIMAL(4,2) NULL
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

INSERT INTO veiculo (placa, ano, modelo, fk_empresa) VALUES
-- Empresa 1 (10 caminhões)
('ABC1D23', 2020, 'Volvo FH 540', 1),
('DEF2G34', 2019, 'Scania R500', 1),
('GHI3J45', 2021, 'Mercedes-Benz Actros', 1),
('JKL4M56', 2018, 'Volkswagen Constellation', 1),
('MNO5P67', 2022, 'Ford Cargo 2429', 1),
('PQR6S78', 2020, 'DAF XF 480', 1),
('STU7T89', 2019, 'Iveco Hi-Way', 1),
('VWX8U90', 2021, 'MAN TGX', 1),
('YZA9V01', 2018, 'Volvo VM 270', 1),
('BCD0X12', 2022, 'Scania G440', 1);

INSERT INTO veiculo (placa, ano, modelo, fk_empresa) VALUES
-- Empresa 2 (10 caminhões)
('EFG1Y23', 2020, 'Volvo FH 460', 2),
('HIJ2Z34', 2019, 'Mercedes-Benz Axor', 2),
('KLM3W45', 2021, 'DAF CF 85', 2),
('NOP4X56', 2018, 'Volkswagen Worker', 2),
('QRS5Y67', 2022, 'Scania R450', 2),
('TUV6Z78', 2020, 'MAN TGS', 2),
('VWX7W89', 2019, 'Iveco Stralis', 2),
('YZA8X90', 2021, 'Ford Cargo 2432', 2),
('BCD9Y01', 2018, 'Volvo FH 500', 2),
('EFG0Z12', 2022, 'Mercedes-Benz Atron', 2),

-- Empresa 10 (70 caminhões)
-- Primeiros 20 com 1 motorista cada
('KLM9B11', 2021, 'Volvo FH 460', 10),
('NOP0C22', 2020, 'Scania R450', 10),
('QRS1D33', 2019, 'Mercedes-Benz Axor 3344', 10),
('TUV2E44', 2022, 'DAF XF 105', 10),
('VWX3F55', 2018, 'MAN TGX 28.440', 10),
('YZA4G66', 2021, 'Volkswagen Constellation 24.250', 10),
('BCD5H77', 2020, 'Iveco Hi-Way 460', 10),
('EFG6I88', 2019, 'Ford Cargo 2428', 10),
('HIJ7J99', 2022, 'Scania G410', 10),
('KLM8K00', 2018, 'Volvo VM 270', 10),
('OPQ9L11', 2021, 'Mercedes-Benz Atron 2035', 10),
('RST0M22', 2020, 'DAF CF 85.430', 10),
('UVW1N33', 2019, 'MAN TGS 28.440', 10),
('XYZ2O44', 2022, 'Volvo FH 540', 10),
('ABC3P55', 2018, 'Scania R500', 10),
('DEF4Q66', 2021, 'Volkswagen Worker 31.280', 10),
('GHI5R77', 2020, 'Iveco Stralis Hi-Way 440', 10),
('JKL6S88', 2019, 'Ford Cargo 2442', 10),
('MNO7T99', 2022, 'Mercedes-Benz Actros 2545', 10),
('PQR8U00', 2018, 'Volvo FH 420', 10),
('STU9V11', 2021, 'Scania R450', 10),
('VWX0W22', 2020, 'Volvo FH 500', 10),
('YZA1X33', 2019, 'Mercedes-Benz Axor 3341', 10),
('BCD2Y44', 2022, 'DAF XF 480', 10),
('EFG3Z55', 2018, 'MAN TGX 18.440', 10),
('HIJ4A66', 2021, 'Volkswagen Constellation 17.250', 10),
('KLM5B77', 2020, 'Iveco Hi-Way 400', 10),
('NOP6C88', 2019, 'Ford Cargo 2429', 10),
('QRS7D99', 2022, 'Scania P360', 10),
('TUV8E00', 2018, 'Volvo FM 370', 10),
('VWX9F11', 2021, 'Mercedes-Benz Atron 2020', 10),
('YZA0G22', 2020, 'DAF CF 75.340', 10),
('BCD1H33', 2019, 'MAN TGS 18.440', 10),
('EFG2I44', 2022, 'Volvo FH 460', 10),
('HIJ3J55', 2018, 'Scania G360', 10),
('KLM4K66', 2021, 'Volkswagen Worker 24.280', 10),
('NOP5L77', 2020, 'Iveco Stralis 440', 10),
('QRS6M88', 2019, 'Ford Cargo 2432', 10),
('TUV7N99', 2022, 'Mercedes-Benz Actros 2540', 10),
('VWX8O00', 2018, 'Volvo FH 400', 10),
('YZA9P11', 2021, 'Scania R410', 10),
('BCD0Q22', 2020, 'Volvo FH 480', 10),
('EFG1R33', 2019, 'Mercedes-Benz Axor 3240', 10),
('HIJ2S44', 2022, 'DAF XF 450', 10),
('KLM3T55', 2018, 'MAN TGX 28.480', 10),
('NOP4U66', 2021, 'Volkswagen Constellation 19.250', 10),
('QRS5V77', 2020, 'Iveco Hi-Way 420', 10),
('TUV6W88', 2019, 'Ford Cargo 2426', 10),
('VWX7X99', 2022, 'Scania P410', 10),
('YZA8Y00', 2018, 'Volvo FM 420', 10),
('BCD9Z11', 2021, 'Mercedes-Benz Atron 1824', 10),
('EFG0A22', 2020, 'DAF CF 65.300', 10),
('HIJ1B33', 2019, 'MAN TGS 19.440', 10),
('KLM2C44', 2022, 'Volvo FH 380', 10),
('NOP3D55', 2018, 'Scania G330', 10),
('QRS4E66', 2021, 'Volkswagen Worker 17.280', 10),
('TUV5F77', 2020, 'Iveco Stralis 400', 10),
('VWX6G88', 2019, 'Ford Cargo 2435', 10),
('YZA7H99', 2022, 'Mercedes-Benz Actros 2540', 10),
('BCD8I00', 2018, 'Volvo FH 360', 10),
('CDE9J11', 2021, 'Scania R380', 10),
('DEF0K22', 2020, 'Volvo FH 340', 10),
('EFG1L33', 2019, 'Mercedes-Benz Axor 2540', 10),
('FGH2M44', 2022, 'DAF XF 400', 10),
('GHI3N55', 2018, 'MAN TGS 18.400', 10),
('HIJ4O66', 2021, 'Volkswagen Worker 15.280', 10),
('IJK5P77', 2020, 'Iveco Stralis 380', 10),
('JKL6Q88', 2019, 'Ford Cargo 2422', 10),
('KLM7R99', 2022, 'Mercedes-Benz Actros 2445', 10),
('LMN8S00', 2018, 'Volvo FH 320', 10);

INSERT INTO sensor (status, ultima_manutencao, fk_veiculo) VALUES
-- Sensores para empresa 1
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

-- Sensores para empresa 2
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

-- Sensores para empresa 10 (70 veículos)
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
('inativo', '2023-03-22', 36),
('ativo', '2023-03-27', 37),
('ativo', '2023-04-01', 38),
('manutencao', '2023-04-06', 39),
('ativo', '2023-04-11', 40),
('ativo', '2023-04-16', 41),
('ativo', '2023-04-21', 42),
('manutencao', '2023-04-26', 43),
('ativo', '2023-05-01', 44),
('ativo', '2023-05-06', 45),
('inativo', '2023-05-11', 46),
('ativo', '2023-05-16', 47),
('ativo', '2023-05-21', 48),
('manutencao', '2023-05-26', 49),
('ativo', '2023-05-31', 50),
('ativo', '2023-06-05', 51),
('ativo', '2023-06-10', 52),
('manutencao', '2023-06-15', 53),
('ativo', '2023-06-20', 54),
('ativo', '2023-06-25', 55),
('inativo', '2023-06-30', 56),
('ativo', '2023-07-05', 57),
('ativo', '2023-07-10', 58),
('manutencao', '2023-07-15', 59),
('ativo', '2023-07-20', 60),
('ativo', '2023-07-25', 61),
('ativo', '2023-07-30', 62),
('manutencao', '2023-08-04', 63),
('ativo', '2023-08-09', 64),
('ativo', '2023-08-14', 65),
('inativo', '2023-08-19', 66),
('ativo', '2023-08-24', 67),
('ativo', '2023-08-29', 68),
('manutencao', '2023-09-03', 69),
('ativo', '2023-09-08', 70);

INSERT INTO protocolo (inicio_atuacao, temperatura_minima, temperatura_maxima) VALUES
('2025-05-23', 0, 5);

/*
-- Inserindo alertas automaticamente para temperaturas críticas
INSERT INTO alertas (descricao_alerta, fk_dado)
SELECT 
    CASE 
        WHEN temperatura BETWEEN 0 AND 2 THEN 'ATENÇÃO'
        WHEN temperatura > 2 AND temperatura <= 4 THEN 'RISCO'
        WHEN temperatura > 4 THEN 'CRÍTICO'
    END,
    idDado_Arduino
FROM 
    dado_arduino
WHERE 
    fk_sensor = 1
    AND (temperatura BETWEEN 0 AND 4) ;

SELECT * FROM ALERTAS;

-- ----------------------------------- VIEWS -----------------
select * from motoristas;
select * from veiculo;
select * from sensor;
select * from alertas;
select * from empresa_cliente;
select * from gestores;
select * from dado_arduino;


-- motoristas com caminhões atribuídos
CREATE VIEW vw_motoristas_empresa as
SELECT 
    v.placa, 
    v.modelo, 
    m.nome AS motorista, 
    e.nome_empresa
FROM 
    veiculo v
INNER JOIN motorista m ON v.fk_motorista = m.idMotorista
INNER JOIN empresa_cliente e ON v.fk_empresa = e.idEmpresa;

select * from vw_motoristas_empresa;

-- Verificar caminhões que estão sem motorista 
SELECT 
    v.placa, 
    v.modelo, 
    IFNULL(m.nome, 'SEM MOTORISTA') AS motorista, 
    e.nome_empresa,
    IFNULL(v.fk_motorista, 'NÃO ATRIBUÍDO') AS id_motorista
FROM 
    veiculo v
INNER JOIN empresa_cliente e ON v.fk_empresa = e.idEmpresa
LEFT JOIN motorista m ON v.fk_motorista = m.idMotorista;

-- veiculos sem motorista

SELECT 
    v.placa, 
    v.modelo, 
    e.nome_empresa
FROM 
    veiculo v
INNER JOIN empresa_cliente e ON v.fk_empresa = e.idEmpresa
WHERE v.fk_motorista IS NULL;
*/




