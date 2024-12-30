from django.urls import path
from . import views
from django.contrib.auth import views as auth_views


#from .views import PostListView, PostDetailView, PostCreateView, PostUpdateView

app_name = 'pages'

urlpatterns = [
    path('', views.home, name ='home'),
    path('about', views.about, name ='about'),
    path('contact/', views.contact, name ='contact'),
    path('success/', views.contact, name ='success'),
    path('login',auth_views.LoginView.as_view(template_name='pages/login.html'),name='login'),
    path('logout/',auth_views.LogoutView.as_view(template_name='pages/login.html'),name='logout'),
    path('register', views.register, name='register'),
    path('modulelist/', views.modulelist, name ='modulelist')
]