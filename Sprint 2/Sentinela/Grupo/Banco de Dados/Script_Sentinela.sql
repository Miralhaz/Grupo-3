
-- Criação do database do para registros de empresas clientes

create database sentinela;

use sentinela;


-- Criação das tabelas que armazenarão os dados das Empresas, Gestores, Sensores, Registro dados e Histórico de alertas.

CREATE TABLE IF NOT EXISTS Empresa_Cliente (
  idEmpresa INT NOT NULL AUTO_INCREMENT,
  nome_empresa VARCHAR(50),
  CNPJ VARCHAR(20),
  CEO VARCHAR(50),
  PRIMARY KEY (idEmpresa)
);

CREATE TABLE IF NOT EXISTS Gestores (
  Token_Gestor INT NOT NULL,
  Empresa INT NOT NULL,
  nome VARCHAR(45) NOT NULL,
  sobrenome VARCHAR(45) NOT NULL,
  email VARCHAR(50) NOT NULL,
  senha VARCHAR(20) NOT NULL,
  PRIMARY KEY (Token_Gestor, Empresa),
  CONSTRAINT fk_gestor_empresa FOREIGN KEY (Empresa) REFERENCES Empresa_Cliente(idEmpresa)
);

CREATE TABLE IF NOT EXISTS Sensor (
  idSensor INT NOT NULL AUTO_INCREMENT,
  n_veiculo INT,
  n_frota INT,
  Empresa INT NOT NULL,
  PRIMARY KEY (idSensor),
  CONSTRAINT fk_sensor_empresa FOREIGN KEY (Empresa) REFERENCES Empresa_Cliente(idEmpresa)
);

CREATE TABLE IF NOT EXISTS Dado_Arduino (
  idDado_Arduino INT NOT NULL,
  temperatura DECIMAL(4,2),
  PRIMARY KEY (idDado_Arduino)
);

CREATE TABLE IF NOT EXISTS Registro_de_Dados (
  idRegistro_de_Dados INT NOT NULL AUTO_INCREMENT,
  Sensor INT NOT NULL,
  data DATE,
  dado_arduino INT NOT NULL,
  PRIMARY KEY (idRegistro_de_Dados, Sensor),
  CONSTRAINT fk_registro_sensor FOREIGN KEY (Sensor) REFERENCES Sensor(idSensor),
  CONSTRAINT fk_registro_dado FOREIGN KEY (dado_arduino) REFERENCES Dado_Arduino(idDado_Arduino)
);

CREATE TABLE IF NOT EXISTS Histórico_Alertas (
  idAlerta INT NOT NULL AUTO_INCREMENT,
  data_alerta DATE,
  descrição_alerta VARCHAR(50),
  n_registro INT,
  Sensor INT NOT NULL,
  PRIMARY KEY (idAlerta),
  CONSTRAINT fk_alerta_sensor FOREIGN KEY (Sensor) REFERENCES Sensor(idSensor),
  CONSTRAINT fk_alerta_registro FOREIGN KEY (N_registro) REFERENCES Registro_de_Dados(idRegistro_de_Dados)
);


INSERT INTO Empresa_Cliente (nome_empresa, CNPJ, CEO) VALUES
('FrigoLog Transportes', '45.123.456/0001-01', 'Eduardo Franco'),
('CarneRápida Distribuições', '78.987.654/0001-09', 'Fernanda Souza');

INSERT INTO Gestores (Token_Gestor, Empresa, nome, sobrenome, email, senha) VALUES
(1001, 1, 'Marcos', 'Almeida', 'marcos@frigolog.com', 'senha123'),
(1002, 2, 'Juliana', 'Lopes', 'juliana@carnerapida.com', 'senha456');

INSERT INTO Sensor (n_veiculo, n_frota, Empresa) VALUES
(501, 2023, 1),
(502, 2023, 1),
(601, 2024, 2);

INSERT INTO Dado_Arduino (idDado_Arduino, temperatura) VALUES
(1, 08.00),
(2, 05.00),
(3, -1.80),
(4, 03.00); 

INSERT INTO Registro_de_Dados (Sensor, data, dado_arduino) VALUES
(1, '2025-04-08', 1),
(1, '2025-04-09', 2),
(2, '2025-04-10', 4), 
(3, '2025-04-09', 3);

INSERT INTO Histórico_Alertas (data_alerta, descrição_alerta, n_registro, Sensor) VALUES
('2025-04-10', 'Temperatura arriscada', 3, 2),
('2025-04-09', 'Temperatura perigosa', 2, 1),
('2025-04-08', 'Temperatura crítica', 1, 1); 

  


  
  
  
  
  
  
  
  