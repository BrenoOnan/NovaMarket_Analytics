-- Quais categorias e produtos trazem o maior retorno de faturamento para o e-commerce

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