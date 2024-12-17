from django.db import models
from students.models import Student
from modules.models import Module


class Registration(models.Model):
        
    student = models.ForeignKey(Student,on_delete=models.CASCADE, blank=False, null=False)
    module = models.ForeignKey(Module,on_delete=models.CASCADE, blank=False, null=False)
    date = models.DateTimeField(auto_now_add=True, null=True, blank=True)

    def __str__(self):
        return f'{self.student} {self.module.name}'



# Create your models here.
