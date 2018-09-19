DROP TABLE NOTAFISCALPRODUTO;
DROP TABLE NOTAFISCALSERVICO;
DROP TABLE NOTAFISCAL;
DROP TABLE CLIENTE;
DROP TABLE PRODUTO;
DROP TABLE SERVICO;

create table Cliente(
  ClienteID INTEG_KEY constraint pk_ClienteID primary key,
  Nome VCHAR60NN,
  Telefone VCHAR20NN,
  Cidade INTEG_KEY,
  Estado INTEG_KEY
);
-- 4106902 Curitiba  - Código ibge
-- 41 Paraná
insert into Cliente (ClienteID, Nome, Telefone, Cidade, Estado) values (1,'Shopping Estacao','41998887777',4106902, 41);
insert into Cliente (ClienteID, Nome, Telefone, Cidade, Estado) values (2,'Shopping Cidade', '41996668888',4106902, 41);
insert into Cliente (ClienteID, Nome, Telefone, Cidade, Estado) values (3,'Shopping Total', '41996668888',4106902, 41);
insert into Cliente (ClienteID, Nome, Telefone, Cidade, Estado) values (4,'Shopping Pinheirinho', '41996668888',4106902, 41);

create table Produto(
  ProdutoID INTEG_KEY constraint pk_ProdutoID primary key,
  Nome VCHAR60NN
);  
insert into Produto (ProdutoID, Nome) values (1,'Notebook 1');
insert into Produto (ProdutoID, Nome) values (2,'Notebook 2');
insert into Produto (ProdutoID, Nome) values (3,'Notebook 3');
insert into Produto (ProdutoID, Nome) values (4,'Mouse 1');
insert into Produto (ProdutoID, Nome) values (5,'Teclado 2');

create table Servico(
  ServicoID INTEG_KEY constraint pk_ServicoID primary key,
  Nome VCHAR60NN
);
insert into Servico (ServicoID, nome) values (1, 'Instalação elétrica');
insert into Servico (ServicoID, nome) values (2, 'Manutenção de servidores');

create table NotaFiscal(
  NotaFiscalID INTEG_KEY constraint pk_NotaFiscalID primary key,
  ClienteID INTEG_KEY,
  Data DATA,
  ValorTotal VALOR12_2  
);
alter table NotaFiscal add constraint fk_NF_ClienteID foreign key (ClienteID) references Cliente(ClienteID);
insert into NotaFiscal (NotaFiscalID, ClienteID, Data, ValorTotal) values (1, 1, '15.09.2018', 3000); -- nfe
insert into NotaFiscal (NotaFiscalID, ClienteID, Data, ValorTotal) values (2, 2, '15.09.2018', 5000); -- nfe
insert into NotaFiscal (NotaFiscalID, ClienteID, Data, ValorTotal) values (3, 1, '15.09.2018', 7000); -- nfse
insert into NotaFiscal (NotaFiscalID, ClienteID, Data, ValorTotal) values (4, 2, '15.09.2018', 15000); -- nfse
insert into NotaFiscal (NotaFiscalID, ClienteID, Data, ValorTotal) values (5, 3, '15.09.2018', 3060); -- nfe
insert into NotaFiscal (NotaFiscalID, ClienteID, Data, ValorTotal) values (6, 4, '15.09.2018', 3072); -- nfe
insert into NotaFiscal (NotaFiscalID, ClienteID, Data, ValorTotal) values (7, 3, '15.09.2018', 1110); -- nfe

create table NotaFiscalProduto(
  NotaFiscalProdutoID INTEG_KEY constraint pk_NFProdutoID primary key,
  NotaFiscalID INTEG_KEY,
  ProdutoID INTEG_KEY,
  Data DATA,
  Quantidade INTEG_KEY,
  ValorUnitario VALOR12_2,
  ValorTotal VALOR12_2
);
alter table NotaFiscalProduto add constraint fk_NFProduto_NotaFiscalID foreign key (NotaFiscalID) references NotaFiscal(NotaFiscalID);
alter table NotaFiscalProduto add constraint fk_NFProduto_ProdutoID foreign key (ProdutoID) references Produto(ProdutoID);
insert into NotaFiscalProduto (NotaFiscalProdutoID, NotaFiscalID, ProdutoID, Data, Quantidade, ValorUnitario, ValorTotal) values (1,1,1,'15.09.2018',6,500,3000);
insert into NotaFiscalProduto (NotaFiscalProdutoID, NotaFiscalID, ProdutoID, Data, Quantidade, ValorUnitario, ValorTotal) values (2,2,2,'15.09.2018',2,1000,2000);
insert into NotaFiscalProduto (NotaFiscalProdutoID, NotaFiscalID, ProdutoID, Data, Quantidade, ValorUnitario, ValorTotal) values (3,2,3,'15.09.2018',3,1000,3000);
insert into NotaFiscalProduto (NotaFiscalProdutoID, NotaFiscalID, ProdutoID, Data, Quantidade, ValorUnitario, ValorTotal) values (4,5,1,'15.09.2018',6,510,3060);
insert into NotaFiscalProduto (NotaFiscalProdutoID, NotaFiscalID, ProdutoID, Data, Quantidade, ValorUnitario, ValorTotal) values (5,6,1,'15.09.2018',6,512,3072);
insert into NotaFiscalProduto (NotaFiscalProdutoID, NotaFiscalID, ProdutoID, Data, Quantidade, ValorUnitario, ValorTotal) values (6,7,2,'15.09.2018',1,1110,1110);


create table NotaFiscalServico(
  NotaFiscalServicoID INTEG_KEY constraint pk_NFServicoID primary key,
  NotaFiscalID INTEG_KEY,
  ServicoID INTEG_KEY,
  Data DATA,
  Quantidade INTEG_KEY,
  ValorUnitario VALOR12_2,
  ValorTotal VALOR12_2
);
alter table NotaFiscalServico add constraint fk_NFServico_NotaFiscalID foreign key (NotaFiscalID) references NotaFiscal(NotaFiscalID);
alter table NotaFiscalServico add constraint fk_NFServico_ServicoID foreign key (ServicoID) references Servico(ServicoID);

insert into NotaFiscalServico (NotaFiscalServicoID,NotaFiscalID, ServicoID, data, Quantidade, ValorUnitario, ValorTotal) values (1,3,1,'15.09.2018',1,7000,7000);
insert into NotaFiscalServico (NotaFiscalServicoID,NotaFiscalID, ServicoID, data, Quantidade, ValorUnitario, ValorTotal) values (2,4,1,'15.09.2018',1,7000,7000);
insert into NotaFiscalServico (NotaFiscalServicoID,NotaFiscalID, ServicoID, data, Quantidade, ValorUnitario, ValorTotal) values (3,4,2,'15.09.2018',2,4000,8000);