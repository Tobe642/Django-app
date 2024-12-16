from django.db import models
from django.contrib.auth.models import User
from django.db.models.signals import post_save
from django.contrib import admin
from django.shortcuts import render, get_object_or_404
from django.contrib.auth.decorators import login_required
from modules.models import Module 
class Student(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    date_of_birth = models.DateField(null=True, blank=True)
    address = models.CharField(max_length=255, null=True, blank=True)
    city = models.CharField(max_length=100, null=True, blank=True)
    country = models.CharField(max_length=100, null=True, blank=True) 
    image = models.ImageField(default='media/profile_pics/default.png', upload_to='profile_pics')

    def __str__(self):
        return f'{self.user.username}'
        

    # create Student porfile when new user signs up


def create_Student(sender, instance, created, **kwargs):
        if created:
            user_Student = Student(user=instance)
            user_Student.save()

            return user_Student
    
post_save.connect(create_Student, sender=User)

@login_required
def my_registrations(request):
    # Get the logged-in user's registered modules
    student = request.user
    registrations = Module.objects.filter(enrolled_students=student)

    return render(request, 'students/my_registrations.html', {
        'registrations': registrations
    })