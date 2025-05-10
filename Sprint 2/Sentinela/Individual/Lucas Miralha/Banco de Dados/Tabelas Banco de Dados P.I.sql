create database sentinela;
use sentinela;

-- CRIAÇÃO DAS TABELAS

create table empresa(
id 		int primary key auto_increment,
descricao  	varchar(20) not null
);

create table usuario(
id      int primary key  auto_increment,
nome 	varchar(20) not null,
email   varchar(30) not null,
nivel_acesso  varchar(30) not null,
empresa 	int not null,
senha   varchar(30) not null,
foreign key (empresa) references empresa(id)
);



create table sensor(
id		 int primary key auto_increment,
descricao 	varchar(100) ,
fkempresa  	int not null,
foreign key (fkempresa) references empresa(id));


create table historico_alerta(
id 		int primary key auto_increment,
mensagem	varchar (15) not null,
data_alerta   date not null,
usuario 	  int not null,
foreign key (usuario) references usuario(id)
); 
-- Foreign key deve estar  no mesmo tipo de dado que a referência, se não da erro.alter


create table historicos_sensor (
id 		int primary key,
temperatura   int,
dataSensor		varchar(20),
fksensor		int not null,
foreign key (fksensor) references sensor(id)
);


-- INSERTS DAS TABELAS 
insert into empresa(id, descricao)
values(1, "Swift"),
	  (2, "Jbs"),
      (3, "Suzano"),
      (4, "Arueri Bovino"),
      (5, "Carnes do João");


insert into usuario (id, nome, email, nivel_acesso, empresa, senha)
values(100, "Melias Esmeraldo", "melias.esmeraldo@gmail.com", "a1", 1,"astdw12421"),
	  (101, "Luiz Henrique", "luiz.henrique@gmail.com", "a2", 2,"otomate764"),
	  (102, "Raul Golias", "raul.golias@gmail.com", "a2", 2,"latirude91023"),
      (103, "Rogério Silva", "rogério.silva@gmail.com", "a3", 3,"poeata2314"),
      (104, "Suiak Yang", "suiak.yang@gmail.com", "a4", 4,"laringe34321"),
      (105, "Almir Cesar", "almir.cesar@gmail.com", "a5", 5,"sajwa87639");
          
insert into sensor(descricao, fkempresa)
values ("Minas Gerais", 1),
	   ("Mato Grosso", 1),
       ("São Paulo", 1),
       ("Espirito Santo", 1),
       ("Salvador", 1);


insert into historico_alerta(mensagem, data_alerta, usuario)
values("PROBLEMA!!!", "2019-04-29", 100),
	  ("PROBLEMA!!!", "2021-08-24", 101),
	  ("PROBLEMA!!!", "2022-02-01", 102),
      ("PROBLEMA!!!", "2023-07-08", 103),
      ("PROBLEMA!!!", "2024-09-16", 104),
      ("PROBLEMA!!!", "2025-11-12", 105);
      
      
insert into historicos_sensor(id, temperatura, dataSensor, fksensor)
values(1, -19, "2019-04-29", 1), 
	  (2, -21, "2021-08-24", 1), 
      (3, 07, "2022-02-01", 2), 
      (4, -33, "2023-07-08", 3), 
      (5, -23, "2024-09-16", 4), 
      (6, -22, "2025-11-12", 5);
      
      
      -- Selects das tabelas diversas.......
      
select * from empresa;

      
select * from usuario;      

      
select * from sensor;      


select * from historico_alerta;      

      
select * from historicos_sensor;      


      
      