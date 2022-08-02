import psycopg2
from python-decouple import config

def insert(value,type):
    print(config("DB_USER"))
    print(config("DB_PASSWORD"))
    print(config("DB_DATABASE"))
    print(config("DB_HOST"))
    print(config("DB_PORT"))
    try:
        connection = psycopg2.connect(user=config("DB_USER"),
                                    password=config("DB_PASSWORD"),
                                    host=config("DB_HOST"),
                                    port=config("DB_PORT"),
                                    database=config("DB_DATABASE"))
        cursor = connection.cursor()

        postgres_insert_query = """ INSERT INTO metrics (value, metric_type_id) VALUES (%s,%s)"""
        record_to_insert = (value,type)
        cursor.execute(postgres_insert_query, record_to_insert)

        connection.commit()
        count = cursor.rowcount
        print(count, "OK")

    except (Exception, psycopg2.Error) as error:
        print("FAIL", error)

    finally:
        if connection:
            cursor.close()
            connection.close()