- ⚙️ Automações: Triggers & Stored Procedures
Este documento detalha as automações do banco de dados NovaMarket, responsáveis por manter a integridade financeira dos pedidos atualizada em tempo real e executar a manutenção diária das métricas de CRM.

- ⚡ 1. Triggers (Tempo Real)
As Triggers agem como "vigias" do banco de dados: disparam automaticamente no exato momento em que um registro é criado ou modificado.

'🛒 trg_after_insert_order_item'
 * 🎯 Onde atua: Tabela order_item (após a inserção de um produto no carrinho).

 * 💡 O que faz: Soma o valor de todos os itens vinculados ao pedido e atualiza automaticamente o valor total (total_price) na tabela orders.

'📊 trg_after_update_orders_history'
 * 🎯 Onde atua: Tabela orders (após a atualização do valor total do pedido).

 * 💡 O que faz: Recalcula instantaneamente o histórico do cliente na tabela purchase_history:

    * 💵 'total_spent': Total investido pelo cliente.

    * 📈 'avg_order_value': Ticket médio das compras.

    * 📦 'total_orders': Quantidade de pedidos realizados.

    * 📅 'last_purchase': Data da última compra efetuada.

 - 🔄 2. Stored Procedure (Rotina de Fechamento)
Diferente das Triggers, a Procedure é uma rotina temporal criada para simular a virada de lote / fechamento diário do e-commerce.

'📅 sp_fechamento_diario()'
- 💡 O que faz:

 * ⏳ Atualiza Pedidos Pendentes: Transiciona pedidos com status PENDENTE há mais de 7 dias para CONCLUIDO.

 * 👥 Atualiza a Régua de CRM: Avalia os dias de inatividade do cliente a partir do campo last_purchase:

 * 🚨 'CHURN': Mais de 90 dias sem comprar.

 * ⚠️ 'EM_RISCO': Entre 61 e 90 dias sem comprar.

 * 🔄 'RECORRENTE': Cliente ativo com mais de 1 pedido.

 * ✨ 'CLIENTE_NOVO': Cliente ativo realizando seu 1º pedido.

- 🚀 3. Como Executar a Rotina Operacional
Para simular o início do expediente ou atualizar as métricas do dia no ambiente de análise, execute o comando:

'CALL novamarket.sp_fechamento_diario();'