from django.db import models
from django.contrib.auth.models import User
from categories.models import Category
from courses.models import Course

class Module(models.Model):
        
    AVAILABILITY_OPTIONS = {
        ('OPEN', 'Open'),
        ('CLOSED', 'Closed'),
        ('WAITLIST', 'Waitlist'),
    }


    name = models.CharField(max_length=255, blank=False, null=False)
    code = models.CharField(max_length=255, blank=False, null=False)
    credit = models.IntegerField(default=30, blank=False, null=False)
    category = models.ForeignKey(Category, on_delete=models.CASCADE, blank=False, null=False)
    description = models.TextField(default=None, blank=True, null=True)
    available = models.CharField(choices=AVAILABILITY_OPTIONS, max_length=255)
    courses = models.ManyToManyField(Course, blank=True)

    def __str__(self):
        return f'{self.name}'