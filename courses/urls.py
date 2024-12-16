from django.urls import path
from . import views
from .views import course_detail


app_name = 'courses'

urlpatterns = [
    path('course/<int:course_id>/',course_detail, name = 'course_detail'),
#    path('issue/new', PostCreateView.as_view(), name = 'issue-create'),
#    path('issues/<int:pk>/update/', PostUpdateView.as_view(), name = 'issue-update'),
]

