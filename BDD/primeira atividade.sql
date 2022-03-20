/*1*/

create database BDD;
use BDD;
create table clientes(
cod_cliente int identity (1,1), 
nome varchar(50) not null, 
cidade varchar(50) not null,
primary key (cod_cliente));

create table contas(
cod_cliente int,
cod_conta int identity (1,10), 
agencia int not null unique, 
numero varchar(15) not null unique, 
saldo money default 0, 
primary key (cod_conta),
foreign key (cod_cliente) references clientes(cod_cliente));

create table emprestimos(
cod_emprestimo int identity (0,1), 
cod_conta int, 
valor_emprestimo money default 0, 
quatidade_parcelas int not null, 
taxa_juros float, 
data_emprestimo date,
primary key (cod_emprestimo),
foreign key (cod_conta) references contas (cod_conta));

create table emprestimoParcelas(
cod_parcela int identity (0,1) unique, 
cod_emprestimo int, 
valor_parcela money not null, 
valor_pago money, 
data_vencimento date, 
data_pagamento date,
primary key (cod_parcela),
foreign key (cod_emprestimo) references emprestimos (cod_emprestimo));
/*2*/
alter table clientes
add telefone varchar(15);
/*3*/

insert into clientes(nome, cidade) values ('Marco A.', 'Palmas');
insert into contas(cod_cliente, agencia, numero, saldo) values (1, 0001, 0800, 100);
insert into emprestimos(cod_conta, quatidade_parcelas, data_emprestimo) values (1, 3, '2019/02/20');

select nome 
from clientes C
inner join contas Ca on C.cod_cliente = Ca.cod_cliente
inner join emprestimos E on Ca.cod_conta = E.cod_conta and E.data_emprestimo between '2019/01/01' and '2019/12/31'
group by nome

