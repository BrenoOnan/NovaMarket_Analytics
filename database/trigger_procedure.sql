USE novamarket;

-- ======================================================
-- 1. TRIGGER: order_item -> orders
-- ======================================================
DROP TRIGGER IF EXISTS trg_after_insert_order_item;

DELIMITER //

CREATE TRIGGER trg_after_insert_order_item
AFTER INSERT ON novamarket.order_item
FOR EACH ROW
BEGIN
    UPDATE novamarket.orders
    SET total_price = (
        SELECT SUM(total_price) 
        FROM novamarket.order_item 
        WHERE order_id = NEW.order_id
    )
    WHERE order_id = NEW.order_id;
END//

DELIMITER ;

-- ======================================================
-- 2. TRIGGER: orders -> purchase_history
-- ======================================================
DROP TRIGGER IF EXISTS trg_after_update_orders_history;

DELIMITER //

CREATE TRIGGER trg_after_update_orders_history
AFTER UPDATE ON novamarket.orders
FOR EACH ROW
BEGIN
    INSERT INTO novamarket.purchase_history (
        cliente_id_history, 
        last_purchase,
        total_orders,
        total_spent,
        avg_order_value,
        crm_status
    )
    VALUES (
        NEW.cliente_id_order,
        NEW.date_order,
        1,
        NEW.total_price,
        NEW.total_price,
        'CLIENTE_NOVO'
    )
    ON DUPLICATE KEY UPDATE
        total_orders = (
            SELECT COUNT(*) 
            FROM novamarket.orders 
            WHERE cliente_id_order = NEW.cliente_id_order AND total_price > 0
        ),
        total_spent = (
            SELECT COALESCE(SUM(total_price), 0) 
            FROM novamarket.orders 
            WHERE cliente_id_order = NEW.cliente_id_order
        ),
        avg_order_value = (
            SELECT COALESCE(SUM(total_price), 0) / NULLIF(COUNT(*), 0)
            FROM novamarket.orders 
            WHERE cliente_id_order = NEW.cliente_id_order AND total_price > 0
        ),
        last_purchase = (
            SELECT MAX(date_order) 
            FROM novamarket.orders 
            WHERE cliente_id_order = NEW.cliente_id_order
        ),
        crm_status = IF(
            (SELECT COUNT(*) FROM novamarket.orders WHERE cliente_id_order = NEW.cliente_id_order AND total_price > 0) > 1, 
            'RECORRENTE', 
            'CLIENTE_NOVO'
        );
END//

DELIMITER ;

-- ======================================================
-- 3. STORED PROCEDURE: Fechamento Diário (CRM & Pedidos)
-- ======================================================
DROP PROCEDURE IF EXISTS novamarket.sp_fechamento_diario;

DELIMITER //

CREATE PROCEDURE novamarket.sp_fechamento_diario()
BEGIN
    -- 1. Transiciona pedidos pendentes há mais de 7 dias para CONCLUIDO
    UPDATE novamarket.orders
    SET status = 'CONCLUIDO'
    WHERE status = 'PENDENTE' 
      AND DATEDIFF(CURRENT_DATE, date_order) > 7;

    -- 2. Atualiza o status do CRM com base na recência
    UPDATE novamarket.purchase_history
    SET crm_status = CASE 
                        WHEN DATEDIFF(CURRENT_DATE, last_purchase) > 90 THEN 'CHURN'
                        WHEN DATEDIFF(CURRENT_DATE, last_purchase) > 60 THEN 'EM_RISCO'
                        WHEN total_orders > 1 THEN 'RECORRENTE'
                        ELSE 'CLIENTE_NOVO'
                     END;
END//

DELIMITER ;