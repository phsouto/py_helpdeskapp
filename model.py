#
# file: db.py
# purpose: handles database interactions
# created on: 2018-10-21
#

from instance import config
import hashlib
import psycopg2


def connect():
    return psycopg2.connect(host=config.DATABASE_SERVER,
                            dbname=config.DATABASE_NAME,
                            user=config.DATABASE_USER,
                            password=config.DATABASE_PWD)


def add_user(username, password):
    conn = connect()
    cur = conn.cursor()
    cur.execute(
        f"insert into users(name, passwd) values ('{username}', '{password}')")
    conn.commit()
    conn.close()


def hash(stuff):
    m = hashlib.sha256()
    m.update(stuff.encode('UTF-8'))
    return m.hexdigest()


if __name__ == '__main__':
    add_user('admin', hash('admin'))
