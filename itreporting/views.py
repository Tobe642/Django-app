from django.shortcuts import render
from django.http import HttpResponse
from django.views.generic import ListView, DetailView, CreateView, UpdateView, DeleteView
from django.urls import reverse_lazy
from .models import Issue
from django.contrib.auth.mixins import LoginRequiredMixin
import requests



# Create your views here.

def home(request):

    url = 'https://api.openweathermap.org/data/2.5/weather?q={},{}&units=metric&appid={}'
    cities = [('Sheffield', 'UK'), ('Melaka', 'Malaysia'), ('Bandung', 'Indonesia')]
    weather_data = []
    api_key = '90578464c7a68309e06ee53085ace0d6'

    for city in cities:
        city_weather = requests.get(url.format(city[0], city[1], api_key)).json() # Request the API data and convert the JSON to Python data types

        weather = {
            'city': city_weather['name'] + ', ' + city_weather['sys']['country'],
            'temperature': city_weather['main']['temp'],
            'description': city_weather['weather'][0]['description']
        }   
        weather_data.append(weather) # Add the data for the current city into our list
    
    return render(request, 'itreporting/home.html', {'title': 'Homepage', 'weather_data': weather_data})


    #return render(request, 'itreporting/home.html',{'title': 'Welcome'})

def about(request):
    return render(request,'itreporting/about.html')  # Corrected here

def contact(request):
    return render(request,'itreporting/contact.html')  # Corrected here

from .models import Issue
def report(request):
    daily_report = {'issues': Issue.objects.all(), 'title': 'Issues Reported'}
    return render(request, 'itreporting/report.html', daily_report)


class PostListView(ListView):
    model = Issue
    ordering = ['-date_submitted']
    template_name = 'itreporting/report.html'
    context_object_name = 'issues'
    paginate_by = 10  # Optional pagination


class PostDetailView(DetailView):
    model = Issue
    template_name = 'itreporting/issue_detail.html'

class PostCreateView(LoginRequiredMixin, CreateView):

    model = Issue
    fields = ['type', 'room', 'urgent', 'details']
    template_name = 'itreporting/issue_form.html'

    def form_valid(self, form): 

        form.instance.author = self.request.user
        return super().form_valid(form)

class PostUpdateView(LoginRequiredMixin, UpdateView): 
    model = Issue
    fields = ['type', 'room', 'details']

