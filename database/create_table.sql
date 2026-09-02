# ==========================================
# 1. TABELAS MÃES (Sem Chaves Estrangeiras)
# ==========================================
# quantidade na tabela  orders - salary na tabela vendedor - tirei freq compra no purchase_h

# Tabela Vendedores
CREATE TABLE novamarket.sellers (
	seller_id INT NOT NULL AUTO_INCREMENT,
	first_name VARCHAR(100) NOT NULL,
	last_name VARCHAR(100) NOT NULL,
	status ENUM('ACTIVE','INACTIVE','SUSPENDED') NOT NULL DEFAULT 'ACTIVE',
	salary DECIMAL(10,2) NOT NULL DEFAULT 0.00,
	CONSTRAINT sellers_pk PRIMARY KEY (seller_id)
) 
ENGINE=InnoDB 
DEFAULT CHARSET=utf8mb4 
COLLATE=utf8mb4_0900_ai_ci;

# Tabela Clientes
CREATE TABLE novamarket.clients (
	client_id INT AUTO_INCREMENT NOT NULL,
	name VARCHAR(100) NOT NULL,
	last_name VARCHAR(100) NOT NULL,
	email VARCHAR(150) NOT NULL,
	state VARCHAR(2) NOT NULL,
	city VARCHAR(100) NOT NULL,
	region VARCHAR(50) NOT NULL,
	CONSTRAINT clients_pk PRIMARY KEY (client_id),
	CONSTRAINT clients_unique UNIQUE KEY (email)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci;

# Tabela Produtos
CREATE TABLE novamarket.product (
	product_id INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(100) NOT NULL,
	cost DECIMAL(10,2) NOT NULL DEFAULT 0.00,
	price DECIMAL(10,2) NOT NULL,
	category VARCHAR(100) NOT NULL,
	CONSTRAINT product_pk PRIMARY KEY (product_id)
) 
ENGINE=InnoDB 
DEFAULT CHARSET=utf8mb4 
COLLATE=utf8mb4_0900_ai_ci;

# ==========================================
# 2. TABELAS DEPENDENTES (Com Foreign Keys)
# ==========================================

# Tabela Historico de Compra (Depende de clients)
CREATE TABLE novamarket.purchase_history (
	cliente_id_history INT NOT NULL,
	first_purchase DATE DEFAULT (CURRENT_DATE) NOT NULL,
	last_purchase DATE DEFAULT (CURRENT_DATE) NOT NULL,
	total_orders INT DEFAULT 1 NOT NULL,
	total_spent DECIMAL(10,2) DEFAULT 0.00 NOT NULL,
	avg_order_value DECIMAL(10,2) DEFAULT 0.00 NOT NULL,
	crm_status ENUM('CLIENTE_NOVO', 'RECORRENTE', 'EM_RISCO', 'CHURN') DEFAULT 'CLIENTE_NOVO' NOT NULL,
	CONSTRAINT purchase_history_pk PRIMARY KEY (cliente_id_history),
	CONSTRAINT purchase_history_clients_FK FOREIGN KEY (cliente_id_history) REFERENCES novamarket.clients(client_id) ON DELETE CASCADE ON UPDATE CASCADE
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci;

# Tabela Pedidos (Depende de clients e sellers)
CREATE TABLE novamarket.orders (
	order_id INT AUTO_INCREMENT NOT NULL,
	cliente_id_order INT NOT NULL,
	seller_id_order INT NOT NULL,
	date_order DATE DEFAULT (CURRENT_DATE) NOT NULL,
	total_price DECIMAL(10,2) NOT NULL DEFAULT 0.00,
	pay_method ENUM('credito', 'debito', 'pix') NOT NULL,
	status ENUM('PENDENTE', 'CONCLUIDO', 'CANCELADO') NOT NULL DEFAULT 'PENDENTE',
	CONSTRAINT orders_pk PRIMARY KEY (order_id),
	CONSTRAINT orders_clients_fk FOREIGN KEY (client_id) REFERENCES novamarket.clients(client_id) ON DELETE RESTRICT ON UPDATE CASCADE,
	CONSTRAINT orders_sellers_fk FOREIGN KEY (seller_id) REFERENCES novamarket.sellers(seller_id) ON DELETE RESTRICT ON UPDATE CASCADE
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci;

# Tabela Itens do Pedido (Depende de orders e product)
CREATE TABLE novamarket.order_item (
	item_id INT NOT NULL AUTO_INCREMENT,
	order_id INT NOT NULL,
	product_id INT NOT NULL,
	price_unit DECIMAL(10,2) NOT NULL DEFAULT 0.00,
	amount INT NOT NULL DEFAULT 1,
	discount DECIMAL(10,2) NOT NULL DEFAULT 0.00,
	total_price DECIMAL(10,2) GENERATED ALWAYS AS ((price_unit * amount) - discount) STORED,
	CONSTRAINT order_item_pk PRIMARY KEY (item_id),
	CONSTRAINT order_item_orders_FK FOREIGN KEY (order_id) REFERENCES novamarket.orders(order_id) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT order_item_product_FK FOREIGN KEY (product_id) REFERENCES novamarket.product(product_id) ON DELETE CASCADE ON UPDATE CASCADE
) 
ENGINE=InnoDB 
DEFAULT CHARSET=utf8mb4 
COLLATE=utf8mb4_0900_ai_ci;