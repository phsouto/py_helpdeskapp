
from flask_wtf import FlaskForm
from wtforms import StringField, PasswordField
from wtforms.validators import DataRequired, Length, Email


class FormRegister(FlaskForm):
    username = StringField('Username', validators=[
                           DataRequired(), Length(max=50)])
    passwd = PasswordField('Password', validators=[DataRequired()])
    confirm_passwd = PasswordField(
        'Confirm Password', validators=[DataRequired()])
