-- 1. Quais categorias e produtos trazem o maior retorno de faturamento para o e-commerce

SELECT 
	p.name,
	p.category,
	oi.order_id, p.cost,
	oi.price_unit,
	oi.amount,
	oi.discount,
	oi.total_price  
from order_item oi 
left JOIN product p 
	ON oi.product_id = p.product_id;


-- 2. Qual é o comportamento de compra de cada cliente e como está o seu nível de fidelidade ?

SELECT 
	c.name,
	c.state,
	ph.last_purchase,
	ph.total_orders,
	ph.total_spent,
	ph.crm_status,
	ph.avg_order_value
FROM purchase_history ph
LEFT JOIN clients c
	on ph.cliente_id_history = c.client_id;
