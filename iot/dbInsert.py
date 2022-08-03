import psycopg2
import os

def insert(value,type):
    try:
        connection = psycopg2.connect(
            user=os.environ['DB_USER'],
            password=os.environ['DB_PASSWORD'],
            host=os.environ['DB_HOST'],
            port=os.environ['DB_PORT'],
            database=os.environ['DB_DATABASE'])
            
        cursor = connection.cursor()

        postgres_insert_query = """ INSERT INTO metrics (value, metric_type_id) VALUES (%s,%s)"""
        record_to_insert = (value,type)
        cursor.execute(postgres_insert_query, record_to_insert)

        connection.commit()
        count = cursor.rowcount
        print("INSERT OK")

    except:
        print("INSERT FAIL")

    finally:
        if connection:
            cursor.close()
            connection.close()