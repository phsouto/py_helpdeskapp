from flask import Flask, render_template, redirect, flash, url_for
import psycopg2
import hashlib
from forms.formregister import FormRegister
from forms.formlogin import FormLogin

app = Flask(__name__, instance_relative_config=True)
app.config.from_pyfile('config.py')


@app.route('/')
@app.route('/home')
def home():
    data = {'title': 'Home'}
    return render_template('home.html', data=data)


@app.route('/login', methods=('GET', 'POST'))
def login():
    data = {'title': 'Login'}
    form = FormLogin()

    if form.validate_on_submit():
        flash('Welcome back, mr ' + form.username.data)

    return render_template('login.html', data=data, form=form)


@app.route('/register', methods=('GET', 'POST'))
def register():
    data = {'title': 'Register'}
    form = FormRegister()

    if form.passwd.data != form.confirm_passwd.data:
        flash('The passwords must match')
    else:
        flash('You\'re now registered, mr ' + form.username.data)

    return render_template('register.html', data=data, form=form)


if __name__ == '__main__':
    app.run()
