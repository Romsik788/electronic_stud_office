from django import forms
from django.contrib.auth.models import User
from django.db.models import fields
from .models import castom_user
from django.contrib.auth.forms import UserCreationForm, AuthenticationForm
from django.forms import ModelForm, widgets, TextInput

class UserSignInForm(forms.ModelForm):
    '''
    username = forms.CharField(label='username', widget=forms.TextInput(attrs={
        "class": "form-control",
        "type": "text",
        "name": "Login",
        "placeholder": "Логін",}))
    password = forms.CharField(label='password', widget=forms.PasswordInput(attrs={
        "class": "form-control",
        "type": "password",
        "name": "password",
        "placeholder": "Пароль",}))
    '''
    
    class Meta:
        model = User
        fields = ("username", "password")
        widgets = {
            "username": TextInput(attrs=({
                "class": "form-control",
                "type": "text",
                "name": "Login",
                "placeholder": "Логін",
            })),
            "password": TextInput(attrs=({
                "class": "form-control",
                "type": "password",
                "name": "password",
                "placeholder": "Пароль",
            })),
        }
