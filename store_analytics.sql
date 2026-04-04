create database analytics_db;

use analytics_db;

create table customers(
	customer_id int not null auto_increment primary key,
    name varchar(50) not null,
    email varchar(100) not null,
    created_at datetime);
    
create table products(
	product_id int not null auto_increment primary key,
    name varchar(50) not null,
    category varchar(50) not null,
    price decimal not null,
    stock_quantity int not null);
    
create table orders(
	order_id int not null auto_increment primary key,
    customer_id int not null,
    order_date datetime not null,
    total_amount decimal not null,
    foreign key (customer_id)
    references customers(customer_id));
    
create table order_items(
	order_item_id int not null auto_increment primary key,
    order_id int not null,
    product_id int not null,
    quantity int not null,
    price decimal not null,
    foreign key (order_id)
    references orders(order_id),
    foreign key (product_id)
    references products(product_id)
);

INSERT INTO customers (customer_id, name, email, created_at) VALUES
(1, 'Ivan Petrov', 'ivan.petrov@gmail.com', '2025-01-10'),
(2, 'Maria Ivanova', 'maria.ivanova@gmail.com', '2025-02-05'),
(3, 'Georgi Georgiev', 'georgi.g@gmail.com', '2025-02-20'),
(4, 'Petar Dimitrov', 'petar.d@gmail.com', '2025-03-01'),
(5, 'Elena Nikolova', 'elena.n@gmail.com', '2025-03-10'),
(6, 'Nikolay Stoyanov', 'nikolay.s@gmail.com', '2025-03-15'),
(7, 'Desislava Koleva', 'desi.k@gmail.com', '2025-03-18'),
(8, 'Hristo Hristov', 'hristo.h@gmail.com', '2025-03-22');

INSERT INTO products (product_id, name, category, price, stock_quantity) VALUES
(1, 'iPhone 14', 'Electronics', 1800.00, 10),
(2, 'Samsung Galaxy S23', 'Electronics', 1500.00, 15),
(3, 'Nike Air Max', 'Shoes', 250.00, 30),
(4, 'Adidas Ultraboost', 'Shoes', 300.00, 20),
(5, 'Gaming Mouse Logitech', 'Accessories', 120.00, 50),
(6, 'Mechanical Keyboard', 'Accessories', 200.00, 25),
(7, 'Dell XPS 13', 'Laptops', 2500.00, 8),
(8, 'HP Pavilion', 'Laptops', 1800.00, 12),
(9, 'Monitor LG 27"', 'Electronics', 400.00, 18),
(10, 'USB-C Charger', 'Accessories', 40.00, 100);

INSERT INTO orders (order_id, customer_id, order_date, total_amount) VALUES
(1, 1, '2025-03-01', 1920.00),
(2, 2, '2025-03-02', 250.00),
(3, 1, '2025-03-05', 120.00),
(4, 3, '2025-03-06', 300.00),
(5, 4, '2025-03-07', 1800.00),
(6, 5, '2025-03-10', 400.00),
(7, 6, '2025-03-12', 200.00),
(8, 7, '2025-03-15', 2500.00),
(9, 2, '2025-03-18', 340.00),
(10, 8, '2025-03-20', 40.00);

INSERT INTO order_items (order_item_id, order_id, product_id, quantity, price) VALUES
(1, 1, 1, 1, 1800.00),
(2, 1, 10, 3, 40.00),
(3, 2, 3, 1, 250.00),
(4, 3, 5, 1, 120.00),
(5, 4, 4, 1, 300.00),
(6, 5, 8, 1, 1800.00),
(7, 6, 9, 1, 400.00),
(8, 7, 6, 1, 200.00),
(9, 8, 7, 1, 2500.00),
(10, 9, 3, 1, 250.00),
(11, 9, 10, 2, 40.00),
(12, 10, 10, 1, 40.00);

/*top customers*/
SELECT c.name, SUM(o.total_amount) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.name
ORDER BY total_spent DESC;

/*best-selling products*/
SELECT p.name, SUM(oi.quantity) AS total_sold
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.name
ORDER BY total_sold DESC;

/* full order details*/
SELECT 
    o.order_id,
    c.name AS customer_name,
    p.name AS product_name,
    oi.quantity,
    oi.price
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id;