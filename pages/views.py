from django.shortcuts import render, redirect, HttpResponse
import requests
from django.contrib import messages
from .forms import UserRegisterForm, contactForm
from django.contrib.auth.decorators import login_required
from courses.models import Course
from modules import models
from django.core.paginator import Paginator
from django.core.mail import EmailMessage
from django.http import JsonResponse, HttpResponse
#HERE
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
    if request.method == 'POST':
        form = contactForm(request.POST)
        if form.is_valid():
            # You can handle the email sending here (optional)
            # Example: Send email logic (if required)
            name = form.cleaned_data['name']
            email = form.cleaned_data['email']

            
            message = form.cleaned_data['message']
            EmailMessage(
                'Contact Form Submission from{}' .format(name),
                message,
                'form-response@example.com', # send from user
                ['test.mailtrap123@gmail.com'],  #send to admin email
                [],
                reply_to=[email]
            ).send()
            # Add a success message
            messages.success(request, 'Your message has been sent successfully!')
            form = contactForm()  # Reset form after submission
    else:
        form = contactForm()
    
    return render(request, 'pages/contact.html', {'form': form})

#def log

#HERE
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