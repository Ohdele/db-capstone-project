import mysql.connector

# Establish a connection to the database
conn = mysql.connector.connect(
    host='localhost',
    user='littlelemon_admin',
    password='Lemon@2025!XyZ$',
    database='littlelemondb'
)

# Create a cursor object
cursor = conn.cursor()

# SQL statement to call the CancelBooking procedure
sql = "CALL CancelBooking(%s)"
params = (99,)

# Execute the statement
cursor.execute(sql, params)

# Fetch and print the result
result = cursor.fetchall()
for row in result:
    print(row)

# Close the cursor and connection
cursor.close()
conn.close()
