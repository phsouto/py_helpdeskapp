
from flask_wtf import FlaskForm
from wtforms import StringField, PasswordField
from wtforms.validators import DataRequired, Length, Email
import re


class FormLogin(FlaskForm):
    ''' Defines and validates the login form '''

    username = StringField('Username', validators=[
                           DataRequired(), Length(max=50)])
    passwd = PasswordField('Password', validators=[DataRequired()])

    def check_username(self):
        ''' Checks for invalid characters in username '''
        exp = re.compile(r'^.*\W+.*$')
        username_match = exp.match(str(self.username.data))
        return False if username_match else True

    def check_passwd(self):
        return False if len(str(self.passwd.data)) < 8 else True

    def is_valid(self):
        return self.check_username() and self.check_passwd()
