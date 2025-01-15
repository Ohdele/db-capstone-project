-- Drop the existing tables if they exist
DROP TABLE IF EXISTS Customers, Bookings;

-- Create the Customers table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    contact_details VARCHAR(100)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Insert records into the Customers table
INSERT INTO Customers (customer_id, name, contact_details) VALUES
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
(4, '2022-10-13', 2, 1),
(5, '2022-10-14', 4, 4),
(6, '2022-10-15', 6, 5),
(7, '2022-10-16', 1, 6),
(8, '2022-10-17', 8, 7),  -- Booking for table 8
(9, '2022-10-18', 3, 8),
(10, '2022-10-19', 4, 9);

-- Drop the existing AddValidBooking procedure if it exists
DROP PROCEDURE IF EXISTS AddValidBooking;

-- Create the updated AddValidBooking procedure
DELIMITER //

CREATE PROCEDURE AddValidBooking(IN bookingDate DATE, IN tableNumber INT, IN customerID INT)
BEGIN
    DECLARE table_status INT;
    START TRANSACTION;

    SELECT COUNT(*) INTO table_status
    FROM Bookings
    WHERE date = bookingDate AND table_number = tableNumber;

    IF table_status > 0 THEN
        ROLLBACK;
        SELECT CONCAT('Table ', tableNumber, ' is already booked - booking cancelled') AS status;
    ELSE
        INSERT INTO Bookings (date, table_number, customer_id) VALUES (bookingDate, tableNumber, customerID);
        COMMIT;
        SELECT CONCAT('Booking for table ', tableNumber, ' on ', bookingDate, ' has been successfully completed.') AS status;
    END IF;
END //

DELIMITER ;

CALL AddValidBooking('2022-10-10', 5, 2);


