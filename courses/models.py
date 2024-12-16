from django.db import models
from django.urls import reverse

class Course(models.Model):
        
    name = models.CharField(max_length=255, blank=False, null=False)
    code = models.CharField(max_length=255, blank=False, null=False)
    description = models.TextField(default=None, blank=True, null=True)

    def __str__(self):
        return f'{self.name}'

    def get_absolute_url(self):
        return reverse('course_detail', kwargs={'course_id': self.id})
