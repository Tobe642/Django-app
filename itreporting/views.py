from django.shortcuts import render
from django.http import HttpResponse


# Create your views here.

def home(request):
    return render(request, 'itreporting/home.html',{'title': 'Welcome'})

def about(request):
    return render(request,'itreporting/about.html')  # Corrected here

def contact(request):
    return render(request,'itreporting/contact.html')  # Corrected here
