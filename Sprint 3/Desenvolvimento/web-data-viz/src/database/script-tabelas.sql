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
    idEmpresa INT PRIMARY KEY,
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
    FOREIGN KEY (fk_token) REFERENCES empresa_cliente(token)
);

CREATE TABLE motorista (
    idMotorista INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    cpf CHAR(11) UNIQUE,
    telefone VARCHAR(15),
     fk_empresa INT,
    FOREIGN KEY (fk_empresa) REFERENCES empresa_cliente(idEmpresa)
);




CREATE TABLE veiculo (
    idVeiculo INT PRIMARY KEY AUTO_INCREMENT,
    placa VARCHAR(8)  UNIQUE,
    ano INT,
    modelo VARCHAR(45),
    fk_empresa INT,
     fk_motorista INT,
	FOREIGN KEY (fk_empresa) REFERENCES empresa_cliente(idEmpresa),
    FOREIGN KEY (fk_motorista) REFERENCES motorista(idMotorista)
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
    FOREIGN KEY (fk_sensor) REFERENCES sensor(idSensor)
);


CREATE TABLE alertas (
    idAlerta INT PRIMARY KEY AUTO_INCREMENT,
    data_alerta TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    descricao_alerta VARCHAR(50),
    fk_dado INT,
    FOREIGN KEY (fk_dado) REFERENCES dado_arduino(idDado_Arduino)
);

USE sentinela;

INSERT INTO empresa_cliente (idEmpresa , token, nome_empresa, CNPJ, CEO) VALUES
('1', '100', 'Transportes Boa Estrada', '12345678000101', 'Carlos Albuquerque'),  -- NÃO ESQUECER DE COLOCAR O IDEMPRESA E O TOKEN MANUALMENTE
('Carga Pesada Express', '23456789000102', 'Fernanda Oliveira'),
('Logística Nacional', '34567890000103', 'Roberto Nascimento'),
('Frete Rápido', '45678901000104', 'Patrícia Santos'),
('TransOlho Vivo', '56789012000105', 'Ricardo Ferreira'),
('Transportes Verde', '67890123000106', 'Juliana Costa'),
('Caminhões Rei', '78901234000107', 'Marcos Silveira'),
('Rodovias Seguras', '89012345000108', 'Ana Paula Lima'),
('Frota Pesada', '90123456000109', 'Lucas Mendes'),
('Transportadora Estrela', '01234567000110', 'Eduardo Pereira');

INSERT INTO motorista (nome, cpf, telefone, fk_empresa) VALUES
-- Empresa 1 (4 motoristas)
('João Silva', '12345678901', '(11) 9999-8888', 1),
('Marcos Oliveira', '23456789012', '(11) 9888-7777', 1),
('Carlos Pereira', '34567890123', '(11) 9777-6666', 1),
('Antônio Santos', '45678901234', '(11) 9666-5555', 1),

-- Empresa 2 (4 motoristas)
('Paulo Costa', '56789012345', '(11) 9555-4444', 2),
('Luiz Fernandes', '67890123456', '(11) 9444-3333', 2),
('Ricardo Almeida', '78901234567', '(11) 9333-2222', 2),
('Eduardo Martins', '89012345678', '(11) 9222-1111', 2),

-- Empresa 3 (4 motoristas)
('Roberto Nunes', '90123456789', '(11) 9111-0000', 3),
('Márcio Souza', '01234567890', '(11) 9000-9999', 3),
('Felipe Castro', '11223344546', '(11) 8999-8888', 3),
('Daniel Lima', '22934455667', '(11) 8888-7777', 3),

-- Empresa 4 (4 motoristas)
('Gustavo Henrique', '33145566778', '(11) 8777-6666', 4),
('Rafael Pereira', '44556677889', '(11) 8666-5555', 4),
('Bruno Oliveira', '55667888992', '(11) 8555-4444', 4),
('Leonardo Santos', '66778899001', '(11) 8444-3333', 4),

-- Empresa 5 (4 motoristas)
('Marcelo Costa', '77889900112', '(11) 8333-2222', 5),
('Alexandre Silva', '88990011223', '(11) 8222-1111', 5),
('Vitor Hugo', '99001122334', '(11) 8111-0000', 5),
('Fernando Dias', '00212233445', '(11) 8000-9999', 5),

-- Empresa 6 (4 motoristas)
('Tiago Melo', '14223394556', '(11) 7999-8888', 6),
('Rodrigo Alves', '22194455667', '(11) 7888-7777', 6),
('André Luiz', '33445566778', '(11) 7777-6666', 6),
('José Carlos', '44956677889', '(11) 7666-5555', 6),

-- Empresa 7 (4 motoristas)
('Maurício Gomes', '55667772990', '(11) 7555-4444', 7),
('Sérgio Ramos', '36778899001', '(11) 7444-3333', 7),
('Renato Porto', '77889900152', '(11) 7333-2222', 7),
('Fábio Júnior', '88992011223', '(11) 7222-1111', 7),

-- Empresa 8 (4 motoristas)
('Wagner Moura', '99001124334', '(11) 7111-0000', 8),
('Diego Costa', '00112233445', '(11) 7000-9999', 8),
('Caio Ribeiro', '11223344556', '(11) 6999-8888', 8),
('Marcos Paulo', '22334455667', '(11) 6888-7777', 8),

-- Empresa 9 (4 motoristas)
('Gabriel Silva', '31445566778', '(11) 6777-6666', 9),
('Lucas Oliveira', '14556677889', '(11) 6666-5555', 9),
('Matheus Santos', '55667788990', '(11) 6555-4444', 9),
('Pedro Henrique', '66734899001', '(11) 6444-3333', 9),

-- Empresa 10 (60 motoristas)
('José da Silva', '77299900112', '(11) 6333-2222', 10),
('Francisco Oliveira', '88923011223', '(11) 6222-1111', 10),
('Antônio Carlos', '99001143334', '(11) 6111-0000', 10),
('Manoel Gomes', '00112243545', '(11) 6000-9999', 10),
('Luiz Fernando', '11223346456', '(11) 5999-8888', 10),
('Carlos Alberto', '22334455767', '(11) 5888-7777', 10),
('João Paulo', '33445566878', '(11) 5777-6666', 10),
('Paulo Ricardo', '44556677835', '(11) 5666-5555', 10),
('Marcos Vinicius', '55697788990', '(11) 5555-4444', 10),
('Fernando Costa', '66778599001', '(11) 5444-3333', 10),
('Ronaldo Nazário', '77889987112', '(11) 5333-2222', 10),
('Roberto Carlos', '88990121223', '(11) 5222-1111', 10),
('Rivaldo Vítor', '99001132334', '(11) 5111-0000', 10),
('Ronaldinho Gaúcho', '00122233445', '(11) 5000-9999', 10),
('Kaká Ricardo', '12923344556', '(11) 4999-8888', 10),
('Neymar Junior', '22334925667', '(11) 4888-7777', 10),
('Gabriel Jesus', '33423566778', '(11) 4777-6666', 10),
('Vinicius Junior', '44556327889', '(11) 4666-5555', 10),
('Casemiro Silva', '55697788999', '(11) 4555-4444', 10),
('Thiago Silva', '66778892301', '(11) 4444-3333', 10),
('Marquinhos Correa', '77823900112', '(11) 4333-2222', 10),
('Ederson Moraes', '88992311223', '(11) 4222-1111', 10),
('Alisson Becker', '99004322334', '(11) 4111-0000', 10),
('Danilo Luiz', '00112233123', '(11) 4000-9999', 10),
('Alex Sandro', '11223312556', '(11) 3999-8888', 10),
('Fred Rodrigues', '2233155667', '(11) 3888-7777', 10),
('Fabinho Tavares', '33445542778', '(11) 3777-6666', 10),
('Bruno Guimarães', '44551277889', '(11) 3666-5555', 10),
('Lucas Paquetá', '55669788990', '(11) 3555-4444', 10),
('Philippe Coutinho', '66712899001', '(11) 3444-3333', 10),
('Richarlison Andrade', '77889901212', '(11) 3333-2222', 10),
('Rodrygo Silva', '88912011223', '(11) 3222-1111', 10),
('Gabriel Martinelli', '99012334', '(11) 3111-0000', 10),
('Antony Santos', '00111233445', '(11) 3000-9999', 10),
('Raphinha Dias', '11223124556', '(11) 2999-8888', 10),
('Everton Ribeiro', '22334412567', '(11) 2888-7777', 10),
('Gerson Santos', '33445561778', '(11) 2777-6666', 10),
('Paulinho Bóia', '44556677881', '(11) 2666-5555', 10),
('Hulk Givanildo', '55617788987', '(11) 2555-4444', 10),
('Diego Souza', '66778899111', '(11) 2444-3333', 10),
('Dudu Oliveira', '77889900192', '(11) 2333-2222', 10),
('Gustavo Scarpa', '88990011923', '(11) 2222-1111', 10),
('Rafael Veiga', '99001122394', '(11) 2111-0000', 10),
('Gabriel Barbosa', '00112233945', '(11) 2000-9999', 10),
('Bruno Henrique', '11223344596', '(11) 1999-8888', 10),
('Arrascaeta Uruguai', '22334955667', '(11) 1888-7777', 10),
('Pedro Guilherme', '33445569778', '(11) 1777-6666', 10),
('Everton Cebolinha', '44556977889', '(11) 1666-5555', 10),
('Giorgian De Arrascaeta', '59667188992', '(11) 1555-4444', 10),
('Gustavo Gómez', '66778899091', '(11) 1444-3333', 10),
('Filipe Luís', '77889902112', '(11) 1333-2222', 10),
('David Luiz', '88990019223', '(11) 1222-1111', 10),
('Thiago Almada', '99001122934', '(11) 1111-0000', 10),
('Julio César', '00192233445', '(11) 1000-9999', 10),
('Marcelo Grohe', '11223944556', '(11) 0999-8888', 10),
('Rogerio Ceni', '22337455667', '(11) 0888-7777', 10),
('Dida Leite', '33445566978', '(11) 0777-6666', 10),
('Zé Roberto', '44551677889', '(11) 0666-5555', 10),
('Kleber Gladiador', '55167788990', '(11) 0555-4444', 10),
('Lúcio Pereira', '66778819001', '(11) 0444-3333', 10),
('Juan Silveira', '77889910112', '(11) 0333-2222', 10),
('Roque Junior', '88990031223', '(11) 0222-1111', 10),
('Cafu Santos', '99001142334', '(11) 0111-0000', 10),
('Roberto Firmino', '00172233445', '(11) 0000-9999', 10);



INSERT INTO veiculo (placa, ano, modelo, fk_empresa, fk_motorista) VALUES
-- Empresa 1 (10 caminhões)
('ABC1D23', 2020, 'Volvo FH 540', 1, 1),
('DEF2G34', 2019, 'Scania R500', 1, 2),
('GHI3J45', 2021, 'Mercedes-Benz Actros', 1, 3),
('JKL4M56', 2018, 'Volkswagen Constellation', 1, 4),
('MNO5P67', 2022, 'Ford Cargo 2429', 1, NULL),
('PQR6S78', 2020, 'DAF XF 480', 1, NULL),
('STU7T89', 2019, 'Iveco Hi-Way', 1, NULL),
('VWX8U90', 2021, 'MAN TGX', 1, NULL),
('YZA9V01', 2018, 'Volvo VM 270', 1, NULL),
('BCD0X12', 2022, 'Scania G440', 1, NULL);


INSERT INTO veiculo (placa, ano, modelo, fk_empresa, fk_motorista) VALUES
-- Empresa 2 (10 caminhões)
('EFG1Y23', 2020, 'Volvo FH 460', 2, 5),
('HIJ2Z34', 2019, 'Mercedes-Benz Axor', 2, 6),
('KLM3W45', 2021, 'DAF CF 85', 2, 7),
('NOP4X56', 2018, 'Volkswagen Worker', 2, 8),
('QRS5Y67', 2022, 'Scania R450', 2, NULL),
('TUV6Z78', 2020, 'MAN TGS', 2, NULL),
('VWX7W89', 2019, 'Iveco Stralis', 2, NULL),
('YZA8X90', 2021, 'Ford Cargo 2432', 2, NULL),
('BCD9Y01', 2018, 'Volvo FH 500', 2, NULL),
('EFG0Z12', 2022, 'Mercedes-Benz Atron', 2, NULL),

-- Empresa 10 (70 caminhões)
-- Primeiros 20 com 1 motorista cada
('KLM9B11', 2021, 'Volvo FH 460', 10, 41),
('NOP0C22', 2020, 'Scania R450', 10, 42),
('QRS1D33', 2019, 'Mercedes-Benz Axor 3344', 10, 43),
('TUV2E44', 2022, 'DAF XF 105', 10, 44),
('VWX3F55', 2018, 'MAN TGX 28.440', 10, 45),
('YZA4G66', 2021, 'Volkswagen Constellation 24.250', 10, 46),
('BCD5H77', 2020, 'Iveco Hi-Way 460', 10, 47),
('EFG6I88', 2019, 'Ford Cargo 2428', 10, 48),
('HIJ7J99', 2022, 'Scania G410', 10, 49),
('KLM8K00', 2018, 'Volvo VM 270', 10, 50),
('OPQ9L11', 2021, 'Mercedes-Benz Atron 2035', 10, 51),
('RST0M22', 2020, 'DAF CF 85.430', 10, 52),
('UVW1N33', 2019, 'MAN TGS 28.440', 10, 53),
('XYZ2O44', 2022, 'Volvo FH 540', 10, 54),
('ABC3P55', 2018, 'Scania R500', 10, 55),
('DEF4Q66', 2021, 'Volkswagen Worker 31.280', 10, 56),
('GHI5R77', 2020, 'Iveco Stralis Hi-Way 440', 10, 57),
('JKL6S88', 2019, 'Ford Cargo 2442', 10, 58),
('MNO7T99', 2022, 'Mercedes-Benz Actros 2545', 10, 59),
('PQR8U00', 2018, 'Volvo FH 420', 10, 60),

-- Próximos 50 veículos (com fk_motorista NULL - serão vinculados via sensor)
('STU9V11', 2021, 'Scania R450', 10, NULL),
('VWX0W22', 2020, 'Volvo FH 500', 10, NULL),
('YZA1X33', 2019, 'Mercedes-Benz Axor 3341', 10, NULL),
('BCD2Y44', 2022, 'DAF XF 480', 10, NULL),
('EFG3Z55', 2018, 'MAN TGX 18.440', 10, NULL),
('HIJ4A66', 2021, 'Volkswagen Constellation 17.250', 10, NULL),
('KLM5B77', 2020, 'Iveco Hi-Way 400', 10, NULL),
('NOP6C88', 2019, 'Ford Cargo 2429', 10, NULL),
('QRS7D99', 2022, 'Scania P360', 10, NULL),
('TUV8E00', 2018, 'Volvo FM 370', 10, NULL),
('VWX9F11', 2021, 'Mercedes-Benz Atron 2020', 10, NULL),
('YZA0G22', 2020, 'DAF CF 75.340', 10, NULL),
('BCD1H33', 2019, 'MAN TGS 18.440', 10, NULL),
('EFG2I44', 2022, 'Volvo FH 460', 10, NULL),
('HIJ3J55', 2018, 'Scania G360', 10, NULL),
('KLM4K66', 2021, 'Volkswagen Worker 24.280', 10, NULL),
('NOP5L77', 2020, 'Iveco Stralis 440', 10, NULL),
('QRS6M88', 2019, 'Ford Cargo 2432', 10, NULL),
('TUV7N99', 2022, 'Mercedes-Benz Actros 2540', 10, NULL),
('VWX8O00', 2018, 'Volvo FH 400', 10, NULL),
('YZA9P11', 2021, 'Scania R410', 10, NULL),
('BCD0Q22', 2020, 'Volvo FH 480', 10, NULL),
('EFG1R33', 2019, 'Mercedes-Benz Axor 3240', 10, NULL),
('HIJ2S44', 2022, 'DAF XF 450', 10, NULL),
('KLM3T55', 2018, 'MAN TGX 28.480', 10, NULL),
('NOP4U66', 2021, 'Volkswagen Constellation 19.250', 10, NULL),
('QRS5V77', 2020, 'Iveco Hi-Way 420', 10, NULL),
('TUV6W88', 2019, 'Ford Cargo 2426', 10, NULL),
('VWX7X99', 2022, 'Scania P410', 10, NULL),
('YZA8Y00', 2018, 'Volvo FM 420', 10, NULL),
('BCD9Z11', 2021, 'Mercedes-Benz Atron 1824', 10, NULL),
('EFG0A22', 2020, 'DAF CF 65.300', 10, NULL),
('HIJ1B33', 2019, 'MAN TGS 19.440', 10, NULL),
('KLM2C44', 2022, 'Volvo FH 380', 10, NULL),
('NOP3D55', 2018, 'Scania G330', 10, NULL),
('QRS4E66', 2021, 'Volkswagen Worker 17.280', 10, NULL),
('TUV5F77', 2020, 'Iveco Stralis 400', 10, NULL),
('VWX6G88', 2019, 'Ford Cargo 2435', 10, NULL),
('YZA7H99', 2022, 'Mercedes-Benz Actros 2540', 10, NULL),
('BCD8I00', 2018, 'Volvo FH 360', 10, NULL),
('CDE9J11', 2021, 'Scania R380', 10, NULL),
('DEF0K22', 2020, 'Volvo FH 340', 10, NULL),
('EFG1L33', 2019, 'Mercedes-Benz Axor 2540', 10, NULL),
('FGH2M44', 2022, 'DAF XF 400', 10, NULL),
('GHI3N55', 2018, 'MAN TGS 18.400', 10, NULL),
('HIJ4O66', 2021, 'Volkswagen Worker 15.280', 10, NULL),
('IJK5P77', 2020, 'Iveco Stralis 380', 10, NULL),
('JKL6Q88', 2019, 'Ford Cargo 2422', 10, NULL),
('KLM7R99', 2022, 'Mercedes-Benz Actros 2445', 10, NULL),
('LMN8S00', 2018, 'Volvo FH 320', 10, NULL);

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

-- Inserindo 10 leituras de temperatura para um sensor no sensor ID 1
INSERT INTO dado_arduino (temperatura, fk_sensor, data_hora) VALUES
(1.2, 1,default ),
(3.5, 1, default),
(0.8, 1, default),
(4.2, 1,default),
(2.1, 1, default),
(5.0, 1,default),
(1.9, 1,default),
(0.5, 1, default),
(3.8, 1,default),
(4.9, 1,default);

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





