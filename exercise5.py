import psycopg2

def connect():
    try:
        """ Connect to the PostgreSQL database server """
        conn = psycopg2.connect(
            host="localhost",
            database="PyCoders",
            user="postgres",
            password="me5842")
        cur = conn.cursor()
        
        #Create a table with name students,This table will have student_id and name columns
        cur.execute("""
            CREATE TABLE students(
  student_id serial PRIMARY KEY,
  name VARCHAR (255)  NOT NULL
);
            """)
    
        #Create a table with name teachers,This table will have teacher_id and name columns
        cur.execute("""
                 CREATE TABLE teachers(
  teacher_id serial PRIMARY KEY,
  name VARCHAR (255)  NOT NULL
);
            """)
        
        
        #Now add 3 records for both of these databases.
        cur.execute("""
           insert into students(student_id,name)
           values (1,'elif'),(2,'mustafa'),(3,'merve')
            """)
        cur.execute("""
           insert into teachers(teacher_id,name)
           values (1,'yavuz'),(2,'fatih'),(3,'mehmet')
            """)
        #After doing these, run SELECT queries to get all data from both tables. Print these outputs.
        cur.execute("""
           select * from students
            """)
        info = cur.fetchall()
        print(info)
        
        cur.execute("""
           select * from teachers
            """)
        info = cur.fetchall()
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