-- MODELAGEM | SENTINELA | Guilherme Silva de Oliveira
create database Sentinela;
use Sentinela;

-- CRIAÇÃO DE TABELAS
create table EmpresaCliente  (
idEmpresa int primary key auto_increment,
nome varchar(50),
ceo varchar(50),
unique index un_ceo(ceo) 
);
desc EmpresaCliente;

create table Gestores (
tokenGestor char(10) primary key,
nome varchar(50),
email varchar(50),
senha varchar(20),
fk_Empresa int,
foreign key fk_Empresa(fk_Empresa) references EmpresaCliente(idEmpresa),
unique index un_email (email)
);
desc Gestores;

create table Sensor (
idSensor int primary key auto_increment,
numeroVeiculo int,
numeroFrota int,
fk_Empresa int,
foreign key fk_Empresa(fk_Empresa) references EmpresaCliente(idEmpresa),
unique index un_numVeiculo (numeroVeiculo)
);
desc Sensor;

create table HistoricoAlerta (
idHistorico_Alerta int primary key auto_increment,
dataAlerta datetime,
statusAlerta varchar(50),
fk_Sensor int,
foreign key fk_Sensor(fk_Sensor) references Sensor(idSensor)
);
desc HistoricoAlerta;

create table RegistroDados (
idRegistro int,
fk_Dados int,
primary key (idRegistro,fk_Dados),
dataDado datetime,
fk_Sensor int,
foreign key fk_Sensor(fk_Sensor) references Sensor(idSensor)
);
desc RegistroDados;

create table DadosSensor (
idDadosSensor int primary key auto_increment,
temperatura decimal(5,2)
);
desc DadosSensor;

-- INSERINDO DADOS NA TABELA
insert into EmpresaCliente (nome, ceo) values 
('TechNova Ltda', 'Carlos Silva'),
('EcoDrive Soluções', 'Ana Pereira');

insert into Gestores (tokenGestor, nome, email, senha, fk_Empresa) values 
('G123456789', 'Lucas Martins', 'lucas@technova.com', 'senha123', 1),
('G987654321', 'Mariana Lopes', 'mariana@ecodrive.com', 'senha456', 2);

insert into Sensor (numeroVeiculo, numeroFrota, fk_Empresa) values 
(1001, 501, 1),
(1002, 502, 2);

insert into HistoricoAlerta (dataAlerta, statusAlerta, fk_Sensor) values 
('2025-04-01 14:30:00', 'Alerta de temperatura alta', 1),
('2025-04-02 10:15:00', 'Funcionamento normal', 2);

insert into DadosSensor (temperatura) values 
(-2.00),
(-3.50);

insert into RegistroDados (idRegistro, fk_Dados, dataDado, fk_Sensor) values 
(1, 1, '2025-04-01 14:31:00', 1),
(2, 2, '2025-04-02 10:16:00', 2);

-- SELEÇÃO DE DADOS DAS TABELAS

-- SELECIONANDO EMPRESA E SEUS GESTORES
select * from EmpresaCliente as emp
inner join Gestores as ges on ges.fk_Empresa = emp.idEmpresa;

-- SELECIONANDO TUDO SOBRE OS SENSORES
select idSensor,numeroVeiculo,numeroFrota,dataDado,temperatura from  Sensor as sen
inner join RegistroDados as reg on reg.fk_Sensor = sen.idSensor
inner join DadosSensor as dad on dad.idDadosSensor = reg.fk_Dados;








