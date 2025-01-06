from django import forms
from django.contrib.auth.models import User
from django.contrib.auth.forms import UserCreationForm
from students.models import Student
from django.core.validators import EmailValidator
from django.shortcuts import render, redirect


class UserRegisterForm(UserCreationForm):
    email = forms.EmailField(label='Email address', help_text='Your SHU email address.')
    class Meta:
      model = User
      fields = ['username', 'first_name', 'last_name', 'email', 'password1','password2']

class ProfileRegisterForm(forms.ModelForm):
    class Meta:
        model = Student
        fields = ['date_of_birth', 'address', 'city', 'country','image']
    
def register(request):
    if request.method == 'POST':
        user_form = UserRegisterForm(request.POST)
        profile_form = ProfileRegisterForm(request.POST, request.FILES)
        
        if user_form.is_valid() and profile_form.is_valid():
            # Save the user form to create a new user
            user = user_form.save()
            
            # Save the profile form but don't commit to the database yet
            profile = profile_form.save(commit=False)
            # Associate the profile with the user
            profile.user = user
            # Save the profile to the database
            profile.save()
            
            # Optionally log the user in after registration
            #login(request, user)
            
            #return redirect('pages:login')
    else:
        user_form = UserRegisterForm()
        profile_form = ProfileRegisterForm()
    
    return render(request, 'pages/register.html', {
        'user_form': user_form,
        'profile_form': profile_form
    })

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

class contactForm(forms.Form):
    name = forms.CharField(max_length=100)
    email = forms.EmailField(validators=[EmailValidator()])
    phone = forms.CharField(max_length=15)
    subject = forms.CharField(max_length=100)
    message = forms.CharField(widget=forms.Textarea)