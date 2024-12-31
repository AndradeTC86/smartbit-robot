import psycopg2

def delete_account_by_email(email):
    query = f"DELETE FROM accounts WHERE email = '{email}';"
    
    conn = psycopg2.connect(
        host='ep-misty-hill-a1e2wqk0.ap-southeast-1.aws.neon.tech',
        database='smartbit',
        user='smartbit_owner',
        password='bZ5S4BjkztWw'        
    )

    cur = conn.cursor()
    cur.execute(query)
    conn.commit()
    conn.close()