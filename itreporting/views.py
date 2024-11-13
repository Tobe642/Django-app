from django.shortcuts import render
from django.http import HttpResponse
from django.views.generic import ListView, DetailView, CreateView, UpdateView, DeleteView
from django.urls import reverse_lazy
from .models import Issue
from django.contrib.auth.mixins import LoginRequiredMixin



# Create your views here.

def home(request):
    return render(request, 'itreporting/home.html',{'title': 'Welcome'})

def about(request):
    return render(request,'itreporting/about.html')  # Corrected here

def contact(request):
    return render(request,'itreporting/contact.html')  # Corrected here

from .models import Issue
def report(request):
    daily_report = {'issues': Issue.objects.all(), 'title': 'Issues Reported'}
    return render(request, 'itreporting/report.html', daily_report)


class PostListView(ListView):
    model = Issue
    ordering = ['-date_submitted']
    template_name = 'itreporting/report.html'
    context_object_name = 'issues'
    paginate_by = 10  # Optional pagination


class PostDetailView(DetailView):
    model = Issue
    template_name = 'itreporting/issue_detail.html'

class PostCreateView(LoginRequiredMixin, CreateView):

    model = Issue
    fields = ['type', 'room', 'urgent', 'details']
    template_name = 'itreporting/issue_form.html'

    def form_valid(self, form): 

        form.instance.author = self.request.user
        return super().form_valid(form)

class PostUpdateView(LoginRequiredMixin, UpdateView): 
    model = Issue
    fields = ['type', 'room', 'details']

