import mysql.connector

# Connect to the database
conn = mysql.connector.connect(
    host='localhost',
    user='littlelemon_admin',
    password='Lemon@2025!XyZ$',
    database='littlelemondb'
)

# Create a cursor object
cursor = conn.cursor()

# SQL statement to call CancelBooking() procedure
sql = "CALL CancelBooking(%s)"
params = (99,)  # Pass the table number 99

# Execute the SQL statement
cursor.execute(sql, params)

# Fetch the result
result = cursor.fetchall()

# Print the result
print(result)


# Expected Outcome
[('Booking 99 has been cancelled.',)]


# Close the cursor and connection
cursor.close()
conn.close()
