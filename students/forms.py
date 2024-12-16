from django import forms
from django.contrib.auth.models import User
from django.contrib.auth.forms import UserCreationForm
from .models import Student


#user update form 
class UserUpdateForm(forms.ModelForm):
    email = forms.EmailField()

    class Meta:
        model = User
        fields = ['first_name', 'last_name', 'email']



#profile update form 
class ProfileUpdateForm(forms.ModelForm):
    class Meta:
        model = Student
        fields = ['date_of_birth', 'address', 'city', 'country','image']
