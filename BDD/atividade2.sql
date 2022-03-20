/*1*/
use BDD
select * from clientes cli
inner join contas ct on cli.cod_cliente = ct.cod_cliente
/*2*/
select cli.cod_cliente, cli.nome, cli.telefone, ep.cod_emprestimo, ep.cod_parcela, ep.data_vencimento, ep.valor_parcela from clientes cli
inner join contas ct on ct.cod_cliente = cli.cod_cliente
inner join emprestimos emp on emp.cod_conta = ct.cod_conta
inner join emprestimoParcelas ep on ep.cod_emprestimo = emp.cod_emprestimo
where ep.valor_pago < ep.valor_parcela
/*3*/
select * from clientes cli
inner join contas ct on ct.cod_cliente = cli.cod_cliente
inner join emprestimos emp on emp.cod_conta = ct.cod_conta
inner join emprestimoParcelas ep on ep.cod_emprestimo = emp.cod_emprestimo
where ep.valor_pago = ep.valor_parcela and ep.data_pagamento < '2020/01/01' 
/*4*/
select cli.cod_cliente, cli.nome, cli.telefone, ep.cod_emprestimo, ep.cod_parcela, ep.data_vencimento, ep.valor_parcela from clientes cli
inner join contas ct on ct.cod_cliente = cli.cod_cliente
inner join emprestimos emp on emp.cod_conta = ct.cod_conta
inner join emprestimoParcelas ep on ep.cod_emprestimo = emp.cod_emprestimo
where ep.valor_pago < ep.valor_parcela and data_vencimento < GETDATE()
/*5*/
alter table clientes
add ativo bit not null default 1;
/*6*/
update clientes 
set ativo = 0 
where nome in (select nome from clientes cli
inner join contas con on cli.cod_cliente = con.cod_cliente
inner join (select con.cod_conta from contas con
except
select emp.cod_conta from emprestimos emp) emptemp
on emptemp.cod_conta = con.cod_conta)

select sum(ep.valor_pago) as 'soma valores pagos' from clientes cli
select * from clientes cli
inner join contas ct on ct.cod_cliente = cli.cod_cliente
inner join emprestimos emp on emp.cod_conta = ct.cod_conta
inner join emprestimoParcelas ep on ep.cod_emprestimo = emp.cod_emprestimo
where


/*ALTERAÇÕES*/

update emprestimos
set valor_emprestimo = 500
where cod_emprestimo = 1

update emprestimos
set cod_conta = 11
where cod_emprestimo = 1


delete from clientes
where cod_cliente = 2


/*PREENCHIMENTO*/

select * from clientes
select * from contas
select * from emprestimos
select * from emprestimoParcelas

insert into clientes(nome, cidade) values ('Marco A.', 'Palmas');
insert into contas(cod_cliente, agencia, numero, saldo) values (1, 0001, 0800, 100);
insert into emprestimos(cod_conta, quatidade_parcelas, data_emprestimo) values (1, 3, '2019/02/18');
insert into emprestimoParcelas(cod_emprestimo, valor_parcela, valor_pago, data_vencimento) values (0, 1000, 1000, '2019/02/20')
insert into emprestimoParcelas(cod_emprestimo, valor_parcela, valor_pago, data_vencimento) values (0, 500, 500, '2022/02/20')
insert into emprestimoParcelas(cod_emprestimo, valor_parcela, valor_pago, data_vencimento) values (0, 500, 0, '2023/02/20')

insert into contas(cod_cliente, agencia, numero, saldo) values (1, 0002, 0801, 1000);
insert into emprestimos(cod_conta, quatidade_parcelas, data_emprestimo, valor_emprestimo) values (11, 2, '2017/02/18', '500');
insert into emprestimoParcelas(cod_emprestimo, valor_parcela, valor_pago, data_vencimento) values (11, 300, 300, '2019/02/18')
insert into emprestimoParcelas(cod_emprestimo, valor_parcela, valor_pago, data_vencimento) values (11, 200, 200, '2020/02/18')

insert into clientes(nome, cidade, telefone) values ('Jorge', 'Palmas', '(63) 98499-9014');
insert into contas(cod_cliente, agencia, numero, saldo) values (3, 0003, 0802, 0); /*cod cliente é 3, pq já teve um cliente criado com cod 2*/
insert into emprestimos(cod_conta, quatidade_parcelas, data_emprestimo, taxa_juros, valor_emprestimo) values (21, 3, '2021/02/20', 10, 5000); 
insert into emprestimoParcelas(cod_emprestimo, valor_parcela, valor_pago, data_vencimento) values (2, 3000, 0, '2021/02/20')
insert into emprestimoParcelas(cod_emprestimo, valor_parcela, valor_pago, data_vencimento) values (2, 1000, 0, '2022/02/20')
insert into emprestimoParcelas(cod_emprestimo, valor_parcela, valor_pago, data_vencimento) values (2, 1000, 0, '2023/02/20')