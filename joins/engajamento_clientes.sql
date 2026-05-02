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