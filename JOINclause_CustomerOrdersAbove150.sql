-- Drop existing tables if they exist
DROP TABLE IF EXISTS staffinformation, customerdetails, orders, menu, ordermenu, menu_items;

-- Create and populate staffinformation table
CREATE TABLE staffinformation (
    staff_id INT PRIMARY KEY,
    role VARCHAR(50),
    salary DECIMAL(10, 2)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO staffinformation (staff_id, role, salary) VALUES
(1, 'Manager', 50000.00),
(2, 'Chef', 40000.00),
(3, 'Waiter', 30000.00),
(4, 'Waiter', 30000.00),
(5, 'Chef', 50000.00),
(6, 'Manager', 60000.00),
(7, 'Chef', 40000.00),
(8, 'Waiter', 30000.00),
(9, 'Chef', 50000.00),
(10, 'Manager', 60000.00);

-- Create and populate customerdetails table
CREATE TABLE customerdetails (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    contact_details VARCHAR(100)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO customerdetails (customer_id, name, contact_details) VALUES
(1, 'John Doe', '123-456-7890'),
(2, 'Jane Smith', '098-765-4321'),
(3, 'Alice Johnson', '234-567-8901'),
(4, 'Bob Brown', '345-678-9012'),
(5, 'Charlie Davis', '456-789-0123'),
(6, 'Diana Evans', '567-890-1234'),
(7, 'Ethan Wilson', '678-901-2345'),
(8, 'Fiona White', '789-012-3456'),
(9, 'George Harris', '890-123-4567'),
(10, 'Hannah Clark', '901-234-5678');

-- Create orders table
CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE,
    quantity INT,
    total_cost DECIMAL(10, 2),
    customer_id INT,
    staff_id INT,
    FOREIGN KEY (customer_id) REFERENCES customerdetails(customer_id),
    FOREIGN KEY (staff_id) REFERENCES staffinformation(staff_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO orders (order_id, order_date, quantity, total_cost, customer_id, staff_id) VALUES
(1, '2025-01-01', 3, 200.00, 1, 1),
(2, '2025-01-02', 4, 250.00, 2, 2),
(3, '2025-01-03', 1, 100.00, 3, 3),
(4, '2025-01-04', 5, 300.00, 4, 4),
(5, '2025-01-05', 6, 350.00, 5, 5),
(6, '2025-01-06', 2, 150.00, 6, 6),
(7, '2025-01-07', 3, 220.00, 7, 7),
(8, '2025-01-08', 4, 280.00, 8, 8),
(9, '2025-01-09', 1, 110.00, 9, 9),
(10, '2025-01-10', 5, 330.00, 10, 10);

-- Create and populate menu table
CREATE TABLE menu (
    menu_id INT PRIMARY KEY AUTO_INCREMENT,
    cuisine VARCHAR(100),
    course VARCHAR(100),
    drink VARCHAR(100),
    dessert VARCHAR(100)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO menu (menu_id, cuisine, course, drink, dessert) VALUES
(1, 'Italian', 'Pasta', 'Wine', 'Tiramisu'),
(2, 'Mexican', 'Tacos', 'Margarita', 'Churros'),
(3, 'Indian', 'Curry', 'Lassi', 'Gulab Jamun'),
(4, 'American', 'Burger', 'Soda', 'Brownie'),
(5, 'Japanese', 'Ramen', 'Sake', 'Mochi'),
(6, 'Chinese', 'Fried Rice', 'Tea', 'Fortune Cookie'),
(7, 'French', 'Coq au Vin', 'Champagne', 'Crème Brûlée'),
(8, 'Greek', 'Gyro', 'Ouzo', 'Baklava'),
(9, 'Spanish', 'Paella', 'Sangria', 'Flan'),
(10, 'Lebanese', 'Shawarma', 'Arak', 'Baklava');

-- Create and populate ordermenu table
CREATE TABLE ordermenu (
    order_id INT,
    menu_id INT,
    PRIMARY KEY (order_id, menu_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (menu_id) REFERENCES menu(menu_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO ordermenu (order_id, menu_id) VALUES
(1, 1),
(2, 2),
(4, 3),
(5, 4),
(7, 5),
(8, 6),
(10, 7);

-- Create and populate menu_items table
CREATE TABLE menu_items (
    menu_item_id INT PRIMARY KEY AUTO_INCREMENT,
    menu_id INT,
    course_name VARCHAR(100),
    starter_name VARCHAR(100),
    FOREIGN KEY (menu_id) REFERENCES menu(menu_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO menu_items (menu_id, course_name, starter_name) VALUES
(1, 'Pasta', 'Bruschetta'),
(2, 'Tacos', 'Nachos'),
(3, 'Curry', 'Samosa'),
(4, 'Burger', 'Wings'),
(5, 'Ramen', 'Sushi'),
(6, 'Fried Rice', 'Spring Rolls'),
(7, 'Coq au Vin', 'Croissant'),
(8, 'Gyro', 'Hummus'),
(9, 'Paella', 'Tapas'),
(10, 'Shawarma', 'Mezze');

-- Query to retrieve the required information
SELECT c.customer_id, c.name AS full_name, o.order_id, o.total_cost, m.cuisine AS menu_name, mi.course_name, mi.starter_name
FROM customerdetails c
JOIN orders o ON c.customer_id = o.customer_id
JOIN ordermenu om ON o.order_id = om.order_id
JOIN menu m ON om.menu_id = m.menu_id
JOIN menu_items mi ON m.menu_id = mi.menu_id
WHERE o.total_cost > 150
ORDER BY o.total_cost ASC;
