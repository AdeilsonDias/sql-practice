# Análise de Dados com SQL

Este repositório reúne alguns exercícios práticos de SQL voltados para análise de dados, usando cenários de negócio simulados.

A ideia foi treinar não só a escrita das queries, mas também o raciocínio por trás dos dados — entender o problema e extrair informações úteis.

---

## Casos trabalhados

### Engajamento de clientes

Aqui o foco foi identificar quais clientes são mais ativos.

Considerei apenas clientes com mais de 10 transações para filtrar quem realmente usa a plataforma com frequência.

A ideia é que esse tipo de cliente pode ser mais interessante para ações de fidelização.

---

### Clientes inativos

Nesse caso, busquei clientes que nunca realizaram nenhuma transação.

Usei `LEFT JOIN` com `IS NULL` para encontrar quem está cadastrado mas nunca interagiu.

Esse grupo é importante porque pode ser trabalhado com campanhas de reativação.

---

### Comportamento de resgate

Aqui analisei quantos produtos cada cliente resgatou e quanto ele gastou em pontos.

Usei `COUNT(DISTINCT IdTransacao)` para evitar duplicidade, já que uma transação pode ter mais de um produto.

Isso ajuda a entender melhor o comportamento de consumo.

---

### Categorias de produtos

Nesse exercício, o objetivo foi ver quais categorias são mais populares e de quais canais vêm esses resgates.

Isso pode ajudar a entender onde vale mais a pena investir ou quais produtos têm mais saída.

---

## Tecnologias

* SQL (SQLite)
* DBeaver

---
Observação

Os dados são simulados e o foco aqui foi praticar:

JOINs
agregações
organização de queries
raciocínio de análise
## Observação

Os dados são simulados e o foco aqui foi praticar:

* JOINs
* agregações
* organização de queries
* raciocínio de análise
