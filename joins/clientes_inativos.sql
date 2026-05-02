/*Contexto de negócio: O time de retenção identificou que vários clientes se cadastraram mas nunca interagiram com a comunidade. Eles querem uma lista desses clientes para acionar uma campanha de reativação — mas precisam saber também há quantos dias cada um está cadastrado sem fazer nada,ordenado pelos clientes cadastrados há mais tempo primeiro.*/

SELECT t1.idCliente ,substr(t1.DtCriacao,1,10) AS data_criacao,
	count(t2.IdTransacao) AS qtd_transacoes,
	CAST (julianday('now') - julianday(t1.DtCriacao) AS INTEGER )  AS dias_sem_atividade
FROM clientes AS t1
LEFT  JOIN transacoes AS T2  ON T1.idCliente = t2.IdCliente 
WHERE t2.IdTransacao IS  NULL 
GROUP BY t1.idCliente,t1.DtCriacao 
ORDER BY  dias_sem_atividade DESC 