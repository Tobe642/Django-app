from django.contrib import admin
from .models import Registration 

# Register your models here.

class RegistrationAdmin(admin.ModelAdmin):
    list_display = ('student', 'module', 'date')  # Display these fields in the admin
    list_filter = ('module', 'date')             # Add filters for modules and dates
    search_fields = ('student__user__username', 'module__name')  # Add search functionality

admin.site.register(Registration, RegistrationAdmin)