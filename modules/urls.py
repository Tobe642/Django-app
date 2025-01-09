from django.urls import path
from .views import enroll_in_module, module_detail, unenroll_from_module, list_modules
from . import views

app_name = 'modules'

# Define URL patterns for the modules app here.
urlpatterns = [
    path('modules/', list_modules, name='module_list'),
    path('enroll/<str:module_code>/', enroll_in_module, name='enroll_in_module'), #here
    #path('module/<int:module_id>/', module_detail, name='module_detail'),
    path('<str:module_code>/', views.module_detail, name='module_detail'),
    path('unenroll/<str:module_code>/', unenroll_from_module, name='unenroll_from_module'),

    # Other URL patterns...
]
