DATABASE ENGINEER CAPSTONE - META

SETTING UP THE REPOSITORY
Created a GitHub repository for version control and collaboration.

EXERCISE 1: SET UP MYSQL INSTANCE IN MYSQL WORKBENCH
Task I: Created a new user (littlelemon_admin) and granted full permissions.
Task II: Established a new MySQL connection for database management.
Conclusion: Set up the MySQL environment for Little Lemon's database development.

EXERCISE 2: CREATE ER DIAGRAM AND IMPLEMENT IN MYSQL
Task I: Designed a normalized ER diagram for Little Lemon, covering Bookings, Orders, Delivery Status, Menu, Customers, and Staff.
Task II: Implemented the ER diagram in MySQL Workbench and exported the schema.
Conclusion: Successfully created and implemented Little Lemon’s database model.

EXERCISE 3: CREATE VIRTUAL TABLE AND USE SQL QUERIES
Task I: Created a virtual table OrdersView summarizing orders with a quantity greater than 2.
Task II: Retrieved data from multiple tables using JOINs to filter customers with orders > $150.
Task III: Created a subquery to find menu items with more than 2 orders.
Conclusion: Used SQL views, JOINs, and subqueries to generate useful reports.

EXERCISE 4: CREATE OPTIMIZED QUERIES
Task I: Created a stored procedure GetMaxQuantity to display the maximum order quantity.
Task II: Developed a prepared statement GetOrderDetail to retrieve order details securely.
Task III: Created CancelOrder to delete orders by ID.
Conclusion: Optimized queries using stored procedures and prepared statements.

EXERCISE 5: MANAGE BOOKINGS WITH SQL QUERIES
Task I: Developed a stored procedure CheckBooking to check table availability.
Task II: Created AddValidBooking procedure to handle booking verification using transactions.
Conclusion: Implemented procedures to check and manage bookings.

EXERCISE 6: ADD/UPDATE/CANCEL BOOKINGS
Task I: Created AddBooking procedure to add new bookings.
Task II: Developed UpdateBooking procedure to modify existing bookings.
Task III: Created CancelBooking procedure to remove bookings.
Conclusion: Built stored procedures to add, update, and cancel bookings.

EXERCISE 7: SET UP TABLEAU WORKSPACE FOR DATA ANALYSIS
Task I: Connected to Little Lemon’s data, filtering for the United States.
Task II: Split Full Name into First and Last Name fields.
Task III: Created a calculated field Profit from Sales and Cost.
Conclusion: Prepared Tableau workspace for data analysis.

EXERCISE 8: CREATE INTERACTIVE DASHBOARD
Task I: Created a bar chart for customer sales and filtered by sales ≥ $70.
Task II: Built a line chart showing sales trends from 2019-2022.
Task III: Developed a bubble chart to visualize sales by customer.
Task IV: Analyzed sales data for Turkish, Italian, and Greek cuisines.
Task V: Created an interactive dashboard combining sales data and bubble chart.
Conclusion: Created interactive visualizations to support sales and profit analysis.

EXERCISE 9: SET UP CLIENT PROJECT
Task I: Verified Python installation using python --version.
Task II: Installed Jupyter and created a new notebook for code.
Task III: Established a connection to MySQL using mysql-connector.
Conclusion: Set up the development environment for Little Lemon’s booking system.

EXERCISE 10: ADD QUERY FUNCTIONS
Scenario: Assisted Little Lemon in building a query system to manage customer bookings.
Conclusion: Implemented the necessary query functions to manage customer data effectively.

