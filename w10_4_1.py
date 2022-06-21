import psycopg2

def connect():
    try:
        """ Connect to the PostgreSQL database server """
        conn = psycopg2.connect(
            host="localhost",
            database="pgl",
            user="postgres",
            password="me5842")
        cur = conn.cursor()
        
        #Select all rows from actor table
        cur.execute("""
            SELECT * from public."actor";
            """)
        
        info = cur.fetchall()
        print(info)
        
        #Select first row of category table
        cur.execute("""
            SELECT * from public."category";
            """)
        info = cur.fetchone()
        print(info)
        
        #Select first 50 rows of address table
        cur.execute("""
            SELECT * from public."address";
            """)
        info = cur.fetchmany(50)
        print(info)
    
        cur.close()
        conn.commit()
    except (Exception) as error:
        print(error)
    finally:
        if conn is not None:
            conn.close()
            print('Database connection closed.')

if __name__ == '__main__':
    connect()