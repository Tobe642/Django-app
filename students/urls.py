from django.urls import path
from . import views
from pages import views
from django.contrib.auth import views as auth_views
from students import views 



urlpatterns = [
    path('profile', views.profile, name = 'profile'),
    path('my_registrations', views.my_registrations, name ='my_registrations'),
]

