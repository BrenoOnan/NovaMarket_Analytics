# Banco de dados

CREATE DATABASE `novamarket` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

# Criando a tabela vendedores

CREATE TABLE `sellers` (
  `seller_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `status` enum('ACTIVE','INACTIVE','SUSPENDED') NOT NULL DEFAULT 'ACTIVE',
  `salary` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`seller_id`)
) 
ENGINE=InnoDB DEFAULT
CHARSET=utf8mb4 
COLLATE=utf8mb4_0900_ai_ci;



# Criando a tabela clientes

CREATE TABLE novamarket.clients (
	client_id INT auto_increment NOT NULL,
	name varchar(100) NOT NULL,
	last_name varchar(100) NOT NULL,
	email varchar(150) NOT NULL,
	state varchar(2) NOT NULL,
	city varchar(100) NOT NULL,
	region varchar(50) NOT NULL,
	CONSTRAINT clients_pk PRIMARY KEY (client_id),
	CONSTRAINT clients_unique UNIQUE KEY (email)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci;



# Criando a tabela historico compra
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
