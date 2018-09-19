                                                     
Criar um relat�rio de notas fiscais que contenha os seguintes dados: #4
 Open    gustavomuhlmann opened this issue 17 days ago � 0 comments Comments
Assignees
No one assigned
Labels
None yet
Projects
-- ########
-- ########
-- ########
To do in Test
Milestone
No milestone
Notifications
You�re not receiving notifications from this thread.
1 participant
@gustavomuhlmann
@gustavomuhlmann
 
gustavomuhlmann commented 17 days ago � 
Criar um relat�rio que contenha os seguintes dados:

  Cabe�alho: T�tulo.
  Cliente: C�digo, Nome, Cidade, Estado.
  Nota Fiscal: N�mero, Data.
  Produtos: C�digo, Nome, Valor unit�rio, Quantidade, Valor total;
  Total Produtos: Soma quantidade, Soma valor total;
  Servi�os: C�digo, Nome, Valor unit�rio, Quantidade, Valor total;
  Total Servi�os: Soma quantidade, Soma valor total;
  Total Nota Fiscal: Soma quantidade, Soma valor total.
  Total Cliente: Soma quantidade, Soma valor total.
  Total Geral: Soma quantidade, Soma valor total.


select * from cliente;
select * from notafiscal;
select * from notafiscalproduto;
select * from notafiscalservico;
select * from produto;
select * from servico;

-- NF-E
select
  cli.clienteid, cli.nome as NomeCliente, cli.estado, cli.cidade,
  nf.notafiscalid, nf.data, nf.valortotal,
  nfp.produtoid, p.nome as NomeProduto, nfp.quantidade, nfp.valorunitario
from
  notafiscal nf
  inner join cliente as cli on (cli.clienteid = nf.clienteid)
  inner join notafiscalproduto as nfp on (nfp.notafiscalid = nf.notafiscalid)
  inner join produto as p on (p.produtoid = nfp.produtoid)

-- NFS-E
select
  cli.clienteid, cli.nome as NomeCliente, cli.estado, cli.cidade,
  nf.notafiscalid, nf.data, nf.valortotal,
  nfs.servicoid, s.nome as NomeServico, nfs.quantidade, nfs.valorunitario
from
  notafiscal nf
  inner join cliente as cli on (cli.clienteid = nf.clienteid)
  inner join notafiscalservico as nfs on (nfs.notafiscalid = nf.notafiscalid)
  inner join servico as s on (s.servicoid = nfs.servicoid)

select
  cli.clienteid, cli.nome as NomeCliente, cli.estado, cli.cidade,
  nf.notafiscalid, nf.data, nf.valortotal,
  nfp.produtoid, p.nome as NomeProduto, nfp.quantidade, nfp.valorunitario
  ,nfs.servicoid, s.nome as NomeServico, nfs.quantidade, nfs.valorunitario
from
  notafiscal nf
  inner join cliente as cli on (cli.clienteid = nf.clienteid)
  left join notafiscalproduto as nfp on (nfp.notafiscalid = nf.notafiscalid)
  left join produto as p on (p.produtoid = nfp.produtoid)
  left join notafiscalservico as nfs on (nfs.notafiscalid = nf.notafiscalid)
  left join servico as s on (s.servicoid = nfs.servicoid)

-- ########
-- ######## Criar um Relat�rio de Servi�os e Produtos que contenha os seguintes dados:
-- ########
 Criar um relat�rio que contenha os seguintes dados:

  Cabe�alho: T�tulo.
  Produtos: C�digo, Nome, Data, Quantidade, Valor unit�rio m�dio, Valor total;
  Servi�os: C�digo, Nome, Data, Quantidade,Valor unit�rio m�dio, Valor total.

select
  nfp.data, nfp.produtoid, p.nome as NomeProduto, nfp.quantidade, nfp.valorunitario, nfp.valortotal
From
  notafiscalproduto as nfp
  inner join produto as p on (p.produtoid = nfp.produtoid)
order by produtoid

select
  nfs.data, nfs.servicoid, s.nome as NomeServico, nfs.quantidade, nfs.valorunitario, nfs.valortotal
From
  notafiscalservico as nfs
  left join servico as s on (s.servicoid = nfs.servicoid)
order by servicoid

-- ########
-- ######## Criar um Relat�rio de Ranking que contenha os seguintes dados:
-- ########
Criar um relat�rio que contenha os seguintes dados:

  Cabe�alho: T�tulo.
  Top 3 clientes: C�digo, Nome, Valor total;
  Top 3 produtos: C�digo, Nome, Valor total;
  Top 3 servi�os: C�digo, Nome, Valor total.

select
  cli.clienteid, cli.nome as NomeCliente, nf.valortotal,
  nfp.produtoid, p.nome as NomeProduto, nfp.valortotal
  ,nfs.servicoid, s.nome as NomeServico, nfs.valortotal
from
  notafiscal nf
  inner join cliente as cli on (cli.clienteid = nf.clienteid)
  left join notafiscalproduto as nfp on (nfp.notafiscalid = nf.notafiscalid)
  left join produto as p on (p.produtoid = nfp.produtoid)
  left join notafiscalservico as nfs on (nfs.notafiscalid = nf.notafiscalid)
  left join servico as s on (s.servicoid = nfs.servicoid)
order by
  cli.clienteid


select
  first 3
  cli.clienteid, cli.nome as NomeCliente
  ,sum(nf.valortotal) as valortotal
from
  notafiscal nf
  left join cliente as cli on (cli.clienteid = nf.clienteid)
group by
  cli.clienteid, cli.nome

select
  first 3
  p.produtoid, p.nome as NomeProduto
  ,sum(coalesce(nfp.valortotal,0)) as valortotal
from
  produto as p
  left join notafiscalproduto as nfp on (nfp.produtoid = p.produtoid)
group by
  p.produtoid, p.nome

select
  first 3
  s.servicoid, s.nome as NomeProduto
  ,sum(coalesce(nfs.valortotal,0)) as valortotal
from
  servico as s
  left join notafiscalservico as nfs on (nfs.servicoid = s.servicoid)
group by
  s.servicoid, s.nome


