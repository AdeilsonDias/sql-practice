/*Contexto de negócio: O time de growth quer um relatório de engajamento para entender quem são os clientes mais ativos. Eles precisam de uma lista com o volume de transações e pontos acumulados por cliente — mas só clientes que realmente transacionaram devem aparecer.*/

SELECT t1.idCliente,
	count(t2.IdTransacao) AS Transacoes_clientes , 
	sum(t2.QtdePontos) AS Pontos_Acc ,
	avg(t2.QtdePontos) AS media_pontos
FROM clientes AS t1
INNER JOIN transacoes AS T2  ON T1.idCliente = t2.IdCliente 
GROUP BY t1.idCliente
HAVING count(t2.IdTransacao) > 10
ORDER BY Transacoes_clientes DESC

 -------------------------------------------------------------

/*Contexto de negócio: O time de retenção identificou que vários clientes se cadastraram mas nunca interagiram com a comunidade. Eles querem uma lista desses clientes para acionar uma campanha de reativação — mas precisam saber também há quantos dias cada um está cadastrado sem fazer nada,ordenado pelos clientes cadastrados há mais tempo primeiro.*/

SELECT t1.idCliente ,substr(t1.DtCriacao,1,10) AS data_criacao,
	count(t2.IdTransacao) AS qtd_transacoes,
	CAST (julianday('now') - julianday(t1.DtCriacao) AS INTEGER )  AS dias_sem_atividade
FROM clientes AS t1
LEFT  JOIN transacoes AS T2  ON T1.idCliente = t2.IdCliente 
WHERE t2.IdTransacao IS  NULL 
GROUP BY t1.idCliente,t1.DtCriacao 
ORDER BY  dias_sem_atividade DESC 

----------------------------------------------------------------------------------
/*Contexto de negócio: O time de produto quer entender o comportamento de resgate dos clientes. Eles precisam saber, para cada cliente, quantos produtos ele resgatou e quanto gastou em pontos no total — considerando apenas clientes que realmente resgataram algum produto,Ordenado pelos clientes que mais gastaram primeiro.*/

SELECT t1.idCliente,
	count(t3.QtdeProduto ) AS  total_itens,
	sum(t3.vlProduto ) AS total_gasto,
	count(T2.IdTransacao ) 	AS  qtd_transacoes
FROM clientes AS t1
INNER JOIN transacoes AS T2 ON t1.idCliente  = t2.IdCliente
INNER JOIN transacao_produto AS T3 on t2.IdTransacao  = t3.IdTransacao
GROUP BY t1.idCliente 
ORDER by total_gasto DESC

-----------------------------------------------------------------------------------
/*Contexto de negócio: O time de produto quer saber quais categorias de produto são mais populares entre os clientes, e qual canal traz os clientes que mais resgatam — Twitch ou cursos, ordenando pela quantidade de resgates*/

SELECT  t1.DescCategoriaProduto ,
		t3.DescSistemaOrigem ,
		count(t3.IdTransacao ) qntd_resgates,
		sum(t2.vlProduto) valor_gasto
FROM produtos  AS t1
INNER JOIN transacao_produto AS T2 ON t1.IdProduto = t2.IdProduto
INNER JOIN transacoes AS T3 on t2.IdTransacao = t3.IdTransacao 
GROUP BY t3.DescSistemaOrigem,t1.DescCategoriaProduto
ORDER BY qntd_resgates DESC



















