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
