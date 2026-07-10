from dotenv import dotenv_values
import mysql.connector
# Load database configuration
config = dotenv_values(".env")

# Connect to the movies database
db = mysql.connector.connect(**config)

# Create cursor
cursor = db.cursor()
def show_films(cursor, title):

    print("\n -- {} --".format(title))

    cursor.execute("""
        SELECT film_name AS Name,
               film_director AS Director,
               genre_name AS Genre,
               studio_name AS Studio
        FROM film
        INNER JOIN genre
            ON film.genre_id = genre.genre_id
        INNER JOIN studio
            ON film.studio_id = studio.studio_id
    """)

    films = cursor.fetchall()

    for film in films:
        print("Film Name:", film[0])
        print("Director:", film[1])
        print("Genre:", film[2])
        print("Studio:", film[3])
        print()
show_films(cursor, "DISPLAYING FILMS")
cursor.execute("""
INSERT INTO film
(film_name, film_releaseDate, film_runtime, film_director, studio_id, genre_id)
VALUES
('Inception', '2010', 148, 'Christopher Nolan', 3, 2)
""")

db.commit()

show_films(cursor, "DISPLAY FILMS AFTER INSERT")
cursor.execute("""
UPDATE film
SET genre_id = (
    SELECT genre_id
    FROM genre
    WHERE genre_name = 'Horror'
)
WHERE film_name = 'Alien'
""")

db.commit()

show_films(cursor, "DISPLAY FILMS AFTER UPDATE")
cursor.execute("""
DELETE FROM film
WHERE film_name = 'Gladiator'
""")

db.commit()

show_films(cursor, "DISPLAY FILMS AFTER DELETE")
db.close()