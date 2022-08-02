import psycopg2

def insert(value,type):
    
    DB_USER=""
    DB_PASSWORD=""
    DB_DATABASE=""
    DB_HOST=""
    DB_PORT=5432
    
    try:
        connection = psycopg2.connect(user=DB_USER,
                                    password=DB_PASSWORD,
                                    host=DB_HOST,
                                    port=DB_PORT,
                                    database=DB_DATABASE)
        cursor = connection.cursor()

        postgres_insert_query = """ INSERT INTO metrics (value, metric_type_id) VALUES (%s,%s)"""
        record_to_insert = (value,type)
        cursor.execute(postgres_insert_query, record_to_insert)

        connection.commit()
        count = cursor.rowcount
        #print("OK")

    except (Exception, psycopg2.Error) as error:
        #print("FAIL")

    finally:
        if connection:
            cursor.close()
            connection.close()