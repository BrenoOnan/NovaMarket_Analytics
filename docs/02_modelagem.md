# Modelagem de Dados — NovaMarket

## 1. Objetivo

A modelagem de dados da NovaMarket tem como objetivo estruturar e relacionar os dados de clientes, pedidos, produtos, vendedores e histórico de compras, garantindo organização e integridade dos dados.

A estrutura foi desenvolvida a partir dos requisitos funcionais, requisitos de dados e regras de negócio definidos no projeto no documento de requisitos.

---

## 2. Entidades

O modelo inicial é composto pelas seguintes entidades:

- **Clientes** — informações cadastrais dos clientes.
- **Histórico de Compra** — informações relacionadas ao histórico de compras dos clientes.
- **Pedidos** — registros das compras realizadas.
- **Itens de Compra** — produtos pertencentes a cada pedido.
- **Produtos** — produtos comercializados pela NovaMarket.
- **Vendedores** — vendedores relacionados aos pedidos.

---

## 3. Principais atributos

### Clientes
- `cliente_id` — PK
- `nome`
- `sobre_nome`
- `email`
- `estado`
- `cidade`
- `região`

### Histórico de Compra
- `id_cliente` — PK, FK
- `primeira_compra`
- `ultima_compra`
- `quantidade_compra`
- `frequencia_compra`
- `valor_total`
- `gasto_medio`
- `status`

### Pedidos
- `pedido_id` — PK
- `cliente_id` — FK
- `vendedor_id` — FK
- `data`
- `valor_total`
- `pagamento`
- `status`

### Itens de Compra
- `itens_id` — PK
- `pedido_id` — FK
- `produto_id` — FK
- `quantidade`
- `preco_total`
- `desconto`

### Produtos
- `produto_id` — PK
- `status`
- `custo`
- `preço`
- `categoria`
- `nome`

### Vendedores
- `vendedor_id` — PK
- `nome`
- `sobre_nome`
- `status`

---

## 4. Relacionamentos

| Relacionamento | Cardinalidade |
|---|---|
| Clientes → Pedidos | 1:N |
| Clientes → Histórico de Compra | 1:1 |
| Vendedores → Pedidos | 1:N |
| Pedidos → Itens de Compra | 1:N |
| Produtos → Itens de Compra | 1:N |

A entidade `itens_compra` representa a relação entre pedidos e produtos, permitindo que um pedido possua vários produtos e que um produto esteja presente em diferentes pedidos.

---

## 5. Chaves

### Chaves primárias

- `clientes.cliente_id`
- `histórico_compra.id_cliente`
- `pedidos.pedido_id`
- `itens_compra.itens_id`
- `produto.produto_id`
- `vendedores.vendedor_id`

### Chaves estrangeiras

- `histórico_compra.id_cliente` → `clientes.cliente_id`
- `pedidos.cliente_id` → `clientes.cliente_id`
- `pedidos.vendedor_id` → `vendedores.vendedor_id`
- `itens_compra.pedido_id` → `pedidos.pedido_id`
- `itens_compra.produto_id` → `produto.produto_id`

---

## 6. Diagrama

![Diagrama Entidade-Relacionamento](../diagrams/diagrama_novamarket.png)  

---

## 7. Observação

A modelagem representa a estrutura de dados necessária para o funcionamento do projeto NovaMarket.

Os dados armazenados poderão posteriormente ser utilizados em consultas SQL e análises complementares com Python.

Os cálculos e análises de indicadores, como faturamento, lucro, margem e outros KPIs, não fazem parte da estrutura do banco nesta etapa.



## 8. CRM e Régua de Comunicação

A modelagem da NovaMarket foi estruturada para fornecer os dados necessários à aplicação de estratégias de CRM e retenção de clientes.

A partir do relacionamento entre clientes, será possível classificá-los de acordo com suas compras.

Os principais grupos considerados na régua de comunicação são:

- Classificação 
  * Cliente novo
  * Cliente recorrente
  * Cliente em risco
  * Churn


-  Estratégia de CRM |
  * Comunicação de boas-vindas
  * Recomendação de produtos e notificações
  * Ofertas e descontos para recuperação
  * Comunicação personalizada e cupom de desconto


A régua de comunicação representa uma estratégia de CRM baseada no estágio do relacionamento do cliente com a NovaMarket, permitindo direcionar diferentes ações para cada grupo.