from django.db import models
from django.contrib.auth.models import User
from categories.models import Category

class Course(models.Model):
        
    name = models.CharField(max_length=255, blank=False, null=False)
    code = models.CharField(max_length=255, blank=False, null=False)
    description = models.TextField(default=None, blank=True, null=True)

    def __str__(self):
        return f'{self.name}'