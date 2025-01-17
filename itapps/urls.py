"""
URL configuration for itapps project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/5.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))s
"""
from django.contrib import admin
from django.urls import path, include
from pages import views as page_views
from students import views as students_views
from modules import views 
from django.contrib.auth import views as auth_views


from django.conf import settings
from django.conf.urls.static import static
urlpatterns = static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

app_name='itapps'

urlpatterns += [
    path('admin/', admin.site.urls),
    path('', include('pages.urls')),
    path('', include('students.urls')),  # Include users app's URL configuration
    path('', include('modules.urls')), #
    #path('', include('courses.urls')),
    path('courses/', include('courses.urls', namespace='courses')),
    #path('register', views.register, name='register'),
    # path('login/',auth_views.LoginView.as_view(template_name='users/login.html'),name='login'),
    # path('logout/',auth_views.LogoutView.as_view(template_name='students/logout.html'),name='logout'),
    path('profile', students_views.profile, name = 'profile'),
]
