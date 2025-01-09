from django.shortcuts import render, redirect, get_object_or_404
from django.contrib import messages
#from .forms import UserRegisterForm
from django.contrib.auth.decorators import login_required
from .forms import UserUpdateForm, ProfileUpdateForm
from modules.models import Module  # Import Module model
from registrations.models import Registration  # Import Registration model

#HERE
#here you can update profile
@login_required
def profile(request):
    if request.method == 'POST':
        u_form = UserUpdateForm(request.POST, instance=request.user)
        p_form = ProfileUpdateForm(request.POST, request.FILES, instance=request.user.student)
        if u_form.is_valid() and p_form.is_valid():
            u_form.save()
            p_form.save()
            messages.success(request, 'Your account has been successfully updated!')
            return redirect('profile')
    else:     
        u_form = UserUpdateForm(instance=request.user) 
        p_form = ProfileUpdateForm(instance=request.user.student)
        context = {'u_form': u_form, 'p_form': p_form, 'title': 'Student Profile'} 
        return render(request, 'students/Profile.html', context)

# Create your views here.


@login_required
def my_registrations(request):
    # Fetch Registration objects for the logged-in user
    registrations = Registration.objects.filter(student=request.user.student)
    return render(request, 'students/my_registrations.html', {
        'registrations': registrations
    })