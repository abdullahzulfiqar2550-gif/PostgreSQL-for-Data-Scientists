import time
import streamlit as st
import pandas as pd
import psycopg2

def connect():
    while True:
        try:
            return psycopg2.connect(
                host="postgres",
                database="employee_db",
                user="postgres",
                password="postgres"
            )
        except:
            time.sleep(2)

con = connect()
cur = con.cursor()

cur.execute("""
CREATE TABLE IF NOT EXISTS employees(
    emp_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    domain VARCHAR(100),
    language VARCHAR(50),
    experience INT,
    score FLOAT)""")
con.commit()

st.title("Employee Database (PostgreSQL)")

menu = st.sidebar.selectbox("Menu",["Insert", "View", "Search", "Update", "Delete", "Filter", "Sort", "Statistics", "Chart"])

if menu == "Insert":
    name = st.text_input("Name")
    domain = st.text_input("Domain")
    language = st.text_input("Language")
    exp = st.number_input("Experience", 0, 40)
    score = st.number_input("Score", 0.0, 100.0)

    if st.button("Insert"):
        cur.execute(
            "INSERT INTO employees(name, domain, language, experience, score) VALUES(%s, %s, %s, %s, %s)",
            (name, domain, language, exp, score))
        con.commit()
        st.success("Inserted")

elif menu == "View":
    st.dataframe(pd.read_sql("SELECT * FROM employees", con))

elif menu == "Search":
    key = st.text_input("Name")
    if st.button("Search"):
        cur.execute("SELECT * FROM employees WHERE name=%s", (key,))
        rows = cur.fetchall()
        st.dataframe(pd.DataFrame(rows, columns=["ID", "Name", "Domain", "Language", "Experience", "Score"]))

elif menu == "Update":
    emp = st.number_input("Employee ID", 1)
    score = st.number_input("New Score", 0.0, 100.0)
    if st.button("Update"):
        cur.execute("UPDATE employees SET score=%s WHERE emp_id=%s", (score, emp))
        con.commit()
        st.success("Updated")

elif menu == "Delete":
    name = st.text_input("Employee Name")
    if st.button("Delete"):
        cur.execute("DELETE FROM employees WHERE name=%s", (name,))
        con.commit()
        st.success("Deleted")

elif menu == "Filter":
    value = st.number_input("Minimum Score", 0.0, 100.0, 80.0)
    st.dataframe(pd.read_sql(f"SELECT * FROM employees WHERE score >= {value}", con))

elif menu == "Sort":
    st.dataframe(pd.read_sql("SELECT * FROM employees ORDER BY score DESC", con))

elif menu == "Statistics":
    cur.execute("SELECT COUNT(*), AVG(score), MAX(score), MIN(score) FROM employees")
    c, a, mx, mn = cur.fetchone()
    st.metric("Employees"c:\Users\Abdul\AppData\Local\Packages\Microsoft.ScreenSketch_8wekyb3d8bbwe\TempState\Recordings\20260818-0707-30.3219466.mp4, c)
    st.write("Average:", a)
    st.write("Maximum:", mx)
    st.write("Minimum:", mn)

elif menu == "Chart":
    df = pd.read_sql("SELECT name, score FROM employees", con)
    if not df.empty:
        st.bar_chart(df.set_index("name"))

con.close()