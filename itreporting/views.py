from django.shortcuts import render
from django.http import HttpResponse



# Create your views here.

def home(request):
    return render(request, 'itreporting/home.html',{'title': 'Welcome'})

def about(request):
    return render(request,'itreporting/about.html')  # Corrected here

def contact(request):
    return render(request,'itreporting/contact.html')  # Corrected here

from .models import Issue
def report(request):
    daily_report = {'issues': Issue.objects.all(), 'title': 'Issues Reported'}
    return render(request, 'itreporting/report.html', daily_report)




