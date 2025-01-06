from django.contrib import admin
from .models import Module

class ModuleAdmin(admin.ModelAdmin):
    list_display = ('id', 'name', 'code', 'credit', 'description', 'available')  # Customize fields as needed

admin.site.register(Module, ModuleAdmin)
