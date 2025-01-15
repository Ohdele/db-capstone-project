import mysql.connector

# Connect to the MySQL database
conn = mysql.connector.connect(
    host='localhost',
    user='root',  # Replace with your database user
    password='your_password',  # Replace with your database password
    database='littlelemondb'  # Replace with your database name
)

cursor = conn.cursor()

# Define the SQL query to call the UpdateBooking() procedure
sql = "CALL UpdateBooking(%s, %s)"
params = (99, '2022-01-10')  # Table number 99 and Booking date '2022-01-10'

# Execute the query with the parameters
cursor.execute(sql, params)

# Fetch the result and print
result = cursor.fetchall()
print(result)


# Expected Output
[('Confirmation',)]


# Close the cursor and connection
cursor.close()
conn.close()
