from flask import Flask
import psycopg2
import hashlib

app = Flask(__name__, instance_relative_config=True)
app.config.from_pyfile('config.py')


@app.route('/')
def home():
    return 'Hello!'
