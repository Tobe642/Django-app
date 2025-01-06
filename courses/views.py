from django.shortcuts import render, get_object_or_404
#from django.http import HttpResponse
#from django.views.generic import ListView, DetailView, CreateView, UpdateView, DeleteView
#from django.urls import reverse_lazy
from .models import Course
#from django.contrib.auth.mixins import LoginRequiredMixin
#import requests
from modules.models import Module
from django.core.paginator import Paginator

def course_detail(request, course_id):
    course = get_object_or_404(Course, id=course_id)  # Get the course by ID
    modules = course.module_set.all()  # Retrieve all associated modules

    paginator = Paginator(modules, 3)  # Show 5 modules per page
    page_number = request.GET.get('page')  # Get the page number from query params
    page_obj = paginator.get_page(page_number)  # Get the modules for the current page

    return render(request, 'courses/course_detail.html', {
        'course': course,
        'modules': page_obj,  # Pass the paginated modules
    })

def course_list(request):
    courses = Course.objects.prefetch_related('modules')  # Load related modules efficiently
    return render(request, 'template_name.html', {'courses': courses})
#class PostListView(ListView):
#    model = Course
#    ordering = ['-date_submitted']
#    template_name = 'itreporting/report.html'
#    context_object_name = 'Courses'
#    paginate_by = 10  # Optional pagination


#class PostDetailView(DetailView):
#    model = Course
#    template_name = 'courses/coursedetail.html'

#class PostCreateView(LoginRequiredMixin, CreateView):

 #   model = Issue
 #   fields = ['type', 'room', 'urgent', 'details']
 #   template_name = 'itreporting/issue_form.html'

 #   def form_valid(self, form): 

 #       form.instance.author = self.request.user
 #       return super().form_valid(form)

#class PostUpdateView(LoginRequiredMixin, UpdateView): 
 #   model = Issue
 #   fields = ['type', 'room', 'details']


# Create your views here.
