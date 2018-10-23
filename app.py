from flask import Flask, render_template
import psycopg2
import hashlib

app = Flask(__name__, instance_relative_config=True)
app.config.from_pyfile('config.py')


@app.route('/')
@app.route('/home')
def home():
    data = {'title': 'Home'}
    return render_template('home.html', data=data)


@app.route('/login')
def login():
    data = {'title': 'Login'}
    return render_template('login.html', data=data)


@app.route('/register')
def register():
    data = {'title': 'Register'}
    return render_template('register.html', data=data)


if __name__ == '__main__':
    app.run()
