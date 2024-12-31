import psycopg2

db_conn = """
        host='ep-misty-hill-a1e2wqk0.ap-southeast-1.aws.neon.tech'
        dbname='smartbit'
        user='smartbit_owner'
        password='bZ5S4BjkztWw'
        """

def execute(query):
    conn = psycopg2.connect(db_conn)
    cur = conn.cursor()
    cur.execute(query)
    conn.commit()
    conn.close()

def insert_account(account):
    query = f"INSERT INTO accounts (name,email,cpf) VALUES ('{account["name"]}', '{account["email"]}', '{account["cpf"]}')"
    execute(query)

def delete_account_by_email(email):
    query = f"DELETE FROM accounts WHERE email = '{email}';"
    execute(query)    


