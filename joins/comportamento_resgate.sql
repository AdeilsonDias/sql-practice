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
