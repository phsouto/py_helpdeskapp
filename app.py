from flask import Flask, render_template, redirect, flash, url_for
import psycopg2
import hashlib
from forms.formregister import FormRegister
from forms.formlogin import FormLogin

app = Flask(__name__, instance_relative_config=True)
app.config.from_pyfile('config.py')


@app.route('/')
@app.route('/home/')
def home():
    data = {'title': 'Home'}
    return render_template('home.html', data=data)


@app.route('/login/', methods=('GET', 'POST'))
def login():
    data = {'title': 'Login'}
    form = FormLogin()

    if form.validate_on_submit() and form.is_valid():
        return 'TODO: We need to log in the user now...'
    elif form.validate_on_submit() and not form.is_valid():
        flash('The username must have only letters, numbers and underscores')
        flash('The password must have at least 8 characters')

    return render_template('login.html', data=data, form=form)


@app.route('/register/', methods=('GET', 'POST'))
def register():
    data = {'title': 'Register'}
    form = FormRegister()

    if form.validate_on_submit() and form.is_valid():
        return 'TODO: We need to add the user to the database...'
    elif form.validate_on_submit() and not form.is_valid():
        flash('The username must have only letters, numbers and underscores')
        flash('The password must have at least 8 characters')
        flash('The password and confirmation must match')

    return render_template('register.html', data=data, form=form)

@app.route('/new/', methods=('GET', 'POST'))
def new():
    return "To be implemented."

@app.route('/mytickets/', methods=('GET', 'POST'))
def mytickets():
    return "To be implemented."

if __name__ == '__main__':
    app.run()
