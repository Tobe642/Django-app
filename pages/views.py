from django.shortcuts import render, redirect, HttpResponse
import requests
from django.contrib import messages
from .forms import UserRegisterForm, contactForm
from django.contrib.auth.decorators import login_required
from courses.models import Course
from modules import models
from django.core.paginator import Paginator

from django.http import JsonResponse, HttpResponse

def home(request):
    url = 'https://api.openweathermap.org/data/2.5/weather?q={},{}&units=metric&appid={}'
    cities = [('Sheffield', 'UK'), ('Melaka', 'Malaysia'), ('Bandung', 'Indonesia')]
    weather_data = []
    api_key = '90578464c7a68309e06ee53085ace0d6'
    courses = Course.objects.all()

    for city in cities:
        city_weather = requests.get(url.format(city[0], city[1], api_key)).json()

        weather = {
            'city': city_weather['name'] + ', ' + city_weather['sys']['country'],
            'temperature': city_weather['main']['temp'],
            'description': city_weather['weather'][0]['description'],
            'icon': city_weather['weather'][0]['icon']  # Add the weather icon code
        }
        weather_data.append(weather)

    paginator = Paginator(courses, 3)  # Display 6 courses per page
    page_number = request.GET.get('page')  # Get current page number from query params
    page_obj = paginator.get_page(page_number)  # Paginated courses

    return render(request, 'pages/home.html', {
        'title': 'Homepage',
        'weather_data': weather_data,
        'page_obj': page_obj  # Paginated courses
    })

    # return JsonResponse({'HELLO' :'WORLD'}) 
    #return render(request, 'pages/home.html', {'title': 'Homepage', 'weather_data': weather_data, 'courses': courses})


    #return render(request, 'itapps/home.html',{'title': 'Welcome'})

def about(request):
    return render(request,'pages/about.html')  


def modulelist(request):
    return render(request,'pages/modulelist.html')  

def contact(request):
    return render(request,'pages/contact.html')  


#def log

def register(request):
    if request.method == 'POST':
        form = UserRegisterForm(request.POST)
        if form.is_valid():
            form.save()
            username = form.cleaned_data.get('username')
            messages.success(request, f'Account created for {username}!')
            return redirect('pages:home')
        else:
            messages.warning(request, 'Unable to create account.')
    else:
        form = UserRegisterForm()
    return render(request, 'pages/register.html', {'form': form, 'title': 'Student Registration'})