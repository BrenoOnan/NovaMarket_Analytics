-- ======================================================
-- 1. CADASTRO DE VENDEDORES (10 Vendedores)
-- ======================================================
INSERT INTO sellers (first_name, last_name , salary) VALUES
('Carlos', 'Silva', 2400),
('Ana ', 'Souza', 3300),
('Roberto ', 'Alves', 4000),
('Mariana ', 'Lima', 3800),
('Fernando ', 'Costa', 5100),
('Beatriz ', 'Mendes', 2900),
('Lucas ', 'Pereira', 6000),
('Camila ', 'Rocha', 4500),
('Gabriel ', 'Martins', 2940),
('Juliana ', 'Barbosa', 3700);


-- ======================================================
-- 2. CADASTRO DE CLIENTES 
-- ======================================================
INSERT INTO clients (name, last_name, email, state, city, region) VALUES
('João ','Pedro', 'joao@email.com', 'SP', 'São Paulo','Norte'),
('Maria ','Clara', 'maria@email.com', 'RJ', 'Rio de Janeiro', 'Oeste'),
('Lucas ','Santos', 'lucas@email.com', 'MG', 'Minas Gerais', 'Sul'),
('Fernanda ','Lima', 'fernanda@email.com', 'PR', 'Paraná','Leste'),
('Ricardo ','Oliveira', 'ricar_oli@email.com', 'SC', 'Santa Catarina', 'Sul'),
('Arnaldo ','Vieira', 'arnaldo@email.com', 'SC', 'Santa Catarina','Oeste'),
('Pedro ', 'Costa', 'pedro_costa@email.com', 'SC', 'Santa Catarina','Norte'),
('Claudio ', 'Bandeira', 'bandeiras@email.com', 'BA', 'Bahia','Sul'),
('Pedro ', 'Caprio', 'Caprio_pedro@email.com', 'SP', 'São Paulo','Norte');


-- ======================================================
-- 3. CADASTRO DE PRODUTOS
-- ======================================================
INSERT INTO product (product_id, name, cost, price, category) VALUES
(101, 'Teclado Mecânico RGB', 120.00, 180.00, 'Periféricos'),
(102, 'Mouse Gamer 10000 DPI', 50.00, 100.00, 'Periféricos'),
(103, 'Monitor 24" Full HD', 400.00, 650.00, 'Monitores'),
(104, 'Headset Wireless', 150.00, 220.00, 'Áudio'),
(105, 'Webcam 1080p', 90.00, 150.00, 'Acessórios'),
(106, 'Cadeira Ergonômica', 500.00, 850.00, 'Móveis'),
(107, 'Mousepad Extra Large', 25.00, 60.00, 'Acessórios'),
(108, 'Suporte para Monitor', 40.00, 90.00, 'Móveis'),
(109, 'Teclado Mecânico', 120.00, 249.90, 'Periféricos'),
(110, 'Webcam Full HD', 85.00, 179.90, 'Periféricos'),
(111, 'Headset Gamer', 95.00, 199.90, 'Áudio'),
(112, 'Hub USB 3.0', 35.00, 79.90, 'Acessórios'),
(113, 'Cadeira Gamer', 450.00, 899.90, 'Móveis'),;




-- ======================================================
-- 1. INSERÇÃO DOS NOVOS PEDIDOS 
-- ======================================================

INSERT INTO orders (cliente_id_order, seller_id_order, date_order, pay_method, status, total_price) VALUES
(10, 5,  DATE_SUB(CURRENT_DATE, INTERVAL 120 DAY), 'pix',     'CONCLUIDO', 0.00),
(11, 6,  DATE_SUB(CURRENT_DATE, INTERVAL 110 DAY), 'debito',  'CONCLUIDO', 0.00),
(12, 7,  DATE_SUB(CURRENT_DATE, INTERVAL 95 DAY),  'credito', 'CONCLUIDO', 0.00),
(13, 8,  DATE_SUB(CURRENT_DATE, INTERVAL 85 DAY),  'pix',     'CONCLUIDO', 0.00),
(14, 9,  DATE_SUB(CURRENT_DATE, INTERVAL 75 DAY),  'credito', 'CONCLUIDO', 0.00),
(7,  10, DATE_SUB(CURRENT_DATE, INTERVAL 65 DAY),  'debito',  'CONCLUIDO', 0.00),
(8,  11, DATE_SUB(CURRENT_DATE, INTERVAL 50 DAY),  'pix',     'CONCLUIDO', 0.00),
(9,  12, DATE_SUB(CURRENT_DATE, INTERVAL 45 DAY),  'credito', 'CONCLUIDO', 0.00),
(6,  13, DATE_SUB(CURRENT_DATE, INTERVAL 40 DAY),  'pix',     'CONCLUIDO', 0.00),
(10, 14, DATE_SUB(CURRENT_DATE, INTERVAL 35 DAY),  'debito',  'CONCLUIDO', 0.00),
(11, 5,  DATE_SUB(CURRENT_DATE, INTERVAL 30 DAY),  'credito', 'CONCLUIDO', 0.00),
(12, 6,  DATE_SUB(CURRENT_DATE, INTERVAL 12 DAY),  'pix',     'PENDENTE',  0.00),
(13, 7,  DATE_SUB(CURRENT_DATE, INTERVAL 9 DAY),   'debito',  'PENDENTE',  0.00),
(14, 8,  DATE_SUB(CURRENT_DATE, INTERVAL 5 DAY),   'credito', 'PENDENTE',  0.00),
(7,  9,  DATE_SUB(CURRENT_DATE, INTERVAL 4 DAY),   'pix',     'CONCLUIDO', 0.00),
(8,  10, DATE_SUB(CURRENT_DATE, INTERVAL 3 DAY),   'credito', 'CONCLUIDO', 0.00),
(9,  11, DATE_SUB(CURRENT_DATE, INTERVAL 2 DAY),   'pix',     'PENDENTE',  0.00),
(6,  12, DATE_SUB(CURRENT_DATE, INTERVAL 1 DAY),   'credito', 'CONCLUIDO', 0.00),
(10, 13, CURRENT_DATE,                             'pix',     'PENDENTE',  0.00),
(11, 14, CURRENT_DATE,                             'credito', 'CONCLUIDO', 0.00);




-- ======================================================
-- 1. INSERÇÃO DOS  NOVOS ITEMS PARA PEDIDOS
-- ======================================================
INSERT INTO novamarket.order_item (order_id, product_id, amount, price_unit, discount) VALUES
(21, 103, 1, 650.00, 30.00),
(21, 107, 2, 60.00,  0.00),
(22, 106, 1, 850.00, 50.00),
(23, 101, 1, 180.00, 25.00),
(23, 102, 1, 100.00, 0.00),
(24, 109, 1, 249.90, 10.00),
(25, 104, 1, 220.00, 20.00),
(25, 105, 1, 150.00, 0.00),
(26, 113, 1, 899.90, 70.00),
(27, 108, 2, 90.00,  0.00),
(28, 111, 1, 199.90, 10.00),
(28, 112, 2, 79.90,  0.00),
(29, 103, 2, 650.00, 0.00),
(30, 102, 2, 100.00, 5.00),
(31, 110, 1, 179.90, 5.00),
(32, 106, 1, 850.00, 0.00),
(33, 107, 3, 60.00,  0.00),
(34, 101, 1, 180.00, 0.00),
(35, 113, 1, 899.90, 50.00),
(35, 104, 1, 220.00, 0.00),
(36, 109, 2, 249.90, 30.00),
(37, 112, 1, 79.90,  0.00),
(38, 103, 1, 650.00, 20.00),
(38, 108, 1, 90.00,  0.00),
(39, 105, 2, 150.00, 15.00),
(40, 111, 1, 199.90, 10.00);