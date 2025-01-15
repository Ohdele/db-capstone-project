-- Drop the Bookings table if it exists
DROP TABLE IF EXISTS Bookings;

-- Create the Bookings table
CREATE TABLE Bookings (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    date DATE,
    table_number INT,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Insert records into the Bookings table
INSERT INTO Bookings (booking_id, date, table_number, customer_id) VALUES
(1, '2022-10-10', 5, 1),
(2, '2022-11-12', 3, 3),
(3, '2022-10-11', 2, 2),
(4, '2022-10-13', 2, 1);

-- Query to check the inserted data
SELECT * FROM Bookings;


-- Expected Output
+------------+------------+--------------+-------------+
| booking_id | date       | table_number | customer_id |
+------------+------------+--------------+-------------+
|          1 | 2022-10-10 |            5 |           1 |
|          2 | 2022-11-12 |            3 |           3 |
|          3 | 2022-10-11 |            2 |           2 |
|          4 | 2022-10-13 |            2 |           1 |
+------------+------------+--------------+-------------+
