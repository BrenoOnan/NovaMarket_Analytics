# E-commerce NovaMarket

## Contexto da empresa 📚

A NovaMarket é uma empresa de e-commerce que iniciou suas atividades há 5 anos, Com o aumento vertiginoso de vendas nos últimos 5 anos, a NovaMarket começou a vender produtos sem estoque real, atrasar entregas e perder clientes antigos por falta de um histórico de compras centralizado.. Difuculdades na organização dos dados, controle de estoque, e principalmente metodos CRM para retençao de fidelização do cliente.
Para sustentar o próximo nível de expansão a NovaMarket reestrutura sua arquitetura utilizando SQL como modelo de banco de dados estruturado, e a nova estrutura garante integridade operacional no controle de pedidos e estoque, enquanto fornece uma base sólida de dados para impulsionar estratégias de CRM, permitindo segmentar clientes, identificar padrões de compra e implementar programas de fidelização personalizados.

## Objetivo do projeto 🚀
Triplicar o faturamento nos próximos 5 anos, elevando a taxa de retenção de clientes para 65 a 70% e reduzindo a zero os erros de estoque, sustentado por uma infraestrutura de dados SQL centralizada e ações estratégicas de CRM.

## Usuarios 🧑‍💻

1. Cliente
  * Consumidor digital que busca agilidade, transparência e bom atendimento.
  
2. Operacional Logística
  * Responsável por garantir que o produto certo saia do galpão no tempo certo.

3. Analistas de CRM
  * Profissional focado em retenção, campanhas de vendas e ciclo de vida do cliente

4. A Diretoria / Investidores
  * Liderança focada na expansão sustentável e na lucratividade do negócio.


# Levantamento de requisitos e definição de problema 

## Requisitos funcionais 🛠️


- RF01 - Controle e armazenamento dos dados 
  * O sistema deverá permitir o armazenamento, organização e consulta dos dados de clientes, produtos, categorias, pedidos, itens de pedidos, vendedores, pagamentos e localização.

- RF02 - Cadastro e perfil dos clientes
  * O sistema deverá armazenar informações cadastrais dos clientes e permitir a identificação de características como localização, data de cadastro, histórico de compras, quantidade de pedidos e valor total consumido.

- RF03 - Classificação de fidelização e churn
  * O sistema deverá analisar o histórico de compras dos clientes para classificá-los de acordo com seu nível de relacionamento com a empresa, identificando clientes recorrentes, clientes de baixa frequência e clientes potencialmente inativos (churn).

- RF04 - Análise de vendas
  * O sistema deverá permitir a análise do volume de vendas, quantidade de pedidos, faturamento e ticket médio, possibilitando a comparação dos resultados ao longo do tempo.
- RF05 - Análise de produtos e categorias
  * O sistema deverá permitir identificar os produtos e categorias com maior volume de vendas, faturamento e rentabilidade.

- RF06 - Geração de dados para análise
  * O sistema deverá disponibilizar os dados estruturados para realização de consultas SQL e análises complementares utilizando Python.

- RF07 — Análise geográfica
  * O sistema deverá permitir analisar a distribuição de clientes e vendas por cidade, estado e região.

## Requisito de dados 🛠️

- RD01 — Dados de clientes

 * Identificador único do cliente;
 * Nome;
 * Sobre Nome;
 * E-mail;
 * Cidade;
 * Estado;
 * Região.

- RD02 — Dados de produtos
 * Identificador único do produto;
 * Nome do produto;
 * Categoria;
 * Preço de venda;
 * Custo do produto;


- RD05 — Dados de vendedores
 * Identificador único;
 * Nome;
 * Sobre Nome;
 * Status.
 * Salário.

- RD06 — Dados de pedidos
 * Identificador único do pedido;
 * Cliente ID;
 * Vendedor ID;
 * Data do pedido;
 * Status do pedido;
 * Forma de Pagamento.
 * Valor total do pedido.

- RD07 — Dados dos itens dos pedidos
 * Identificador do item;
 * Pedido relacionado ID;
 * Produto relacionado ID;
 * Preço unitário.
 * Quantidade.
 * Preço total.
 * Desconto aplicado.

- RD09 — Dados históricos de compras
 * ID cliente ;
 * Primeira compra;
 * Última compra;
 * Quantidade de compras;
 * Valor total gasto;
 * Status
 * Valor médio das compras.

## Regras de negócio 🤝

### 1. Regras relacionadas aos clientes
  - RN01 — Identificação do cliente por id
  - RN02 — E-mail do cliente único
  - RN03 — Status do cliente - ativo, inativo, bloq

### 2. Regras relacionadas aos pedidos
  - RN04 — Identificação do pedido único
  - RN05 — Pedido deve possuir cliente
  - RN06 — Pedido deve possuir itens
  - RN07 — Pedido deve possuir vendedor
  - RN08 — Status do pedido
  - RN09 — Forma de pagamento
  - RN10 - Pedidos cancelado irá para
  status = CANCELADO

### 3. Regras de produtos
  - RN11 — Produto deve possuir preço
  - RN12 — Produto deve possuir custo registrado

### 4. Fidelicação - Régua comunicação 
  - RN14 - Novo cliente
  - RN15 - Recorrente
  - RN16 - Em risco
  - RN17 - Em Churn

**Classificação       **Estratégia

*Cliente_novo         *Comunicação de boas-vindas
*Recorrente           *Recomendação produto
*Churn                *Mensagem personalizada+Cupom     

