

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

-- Delete existing orders records
DELETE FROM orders WHERE order_id BETWEEN 21 AND 30;

-- Populate orders table
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

-- Drop the existing view if it exists
DROP VIEW IF EXISTS OrdersView;

-- Create the new view
CREATE VIEW OrdersView AS
SELECT order_id, quantity, total_cost
FROM orders
WHERE quantity > 2;

-- Query OrdersView
SELECT * FROM OrdersView;




