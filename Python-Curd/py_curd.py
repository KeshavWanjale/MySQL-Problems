import mysql.connector
from dotenv import load_dotenv
import os

load_dotenv()

mydb = mysql.connector.connect(
    host = os.getenv('MYSQL_HOST'),
    port = os.getenv('MYSQL_PORT'),
    user = os.getenv('MYSQL_USER'),
    password = os.getenv('MYSQL_PASSWORD'),
    database = os.getenv('MYSQL_DATABASE')
)

my_cursor = mydb.cursor()

# Create table
my_cursor.execute("""
    CREATE TABLE IF NOT EXISTS users (
        id INT AUTO_INCREMENT PRIMARY KEY,
        name VARCHAR(255),
        age INT
    )
""")

# Insert Data
sql_insert = "INSERT INTO users (name, age) VALUES (%s, %s)"
values = [("Aniket", 18), ("Keshav",22), ("Vicky", 22), ("Shree", 25)]
my_cursor.executemany(sql_insert, values)
mydb.commit()

# Read Data
my_cursor.execute("SELECT * FROM users")
result = my_cursor.fetchall()
print("Records in users table:")
for row in result:
    print(row)

# Update data
sql_update = "UPDATE users SET age = %s WHERE name = %s"
my_cursor.execute(sql_update, (24, "Aniket"))
mydb.commit()

# delete
sql_delete = "DELETE FROM users WHERE name = %s"
my_cursor.execute(sql_delete, ("Shree",))
mydb.commit()

mydb.commit()
my_cursor.close()
mydb.close()
print("Succsess")