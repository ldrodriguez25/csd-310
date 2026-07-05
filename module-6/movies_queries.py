from dotenv import dotenv_values
import mysql.connector
# Load database configuration
config = dotenv_values(".env")

# Connect to the movies database
db = mysql.connector.connect(**config)

# Create cursor
cursor = db.cursor()
# Display Studio records
print("-- DISPLAYING STUDIO RECORDS --")

cursor.execute("SELECT studio_id, studio_name FROM studio")

studios = cursor.fetchall()

for studio in studios:
    print(f"Studio ID: {studio[0]}")
    print(f"Studio Name: {studio[1]}")
    print()
    # Display Genre records
print("-- DISPLAYING GENRE RECORDS --")

cursor.execute("SELECT genre_id, genre_name FROM genre")

genres = cursor.fetchall()

for genre in genres:
    print(f"Genre ID: {genre[0]}")
    print(f"Genre Name: {genre[1]}")
    print()
    # Display films with a runtime less than 2 hours
print("-- DISPLAYING SHORT FILMS --")

cursor.execute("""
SELECT film_name, film_runtime
FROM film
WHERE film_runtime < 120
""")

films = cursor.fetchall()

for film in films:
    print(f"Film Name: {film[0]}")
    print(f"Runtime: {film[1]} minutes")
    print()
    # Display films by director
print("-- DISPLAYING FILMS GROUPED BY DIRECTOR --")

cursor.execute("""
SELECT film_name, film_director
FROM film
ORDER BY film_director
""")

directors = cursor.fetchall()

for director in directors:
    print(f"Film Name: {director[0]}")
    print(f"Director: {director[1]}")
    print()
    db.close()