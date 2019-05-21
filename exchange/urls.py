from django.urls import path
from . import views

urlpatterns = [
	path('home', views.home_view, name='home'),
	path('universities', views.universities_view),
	path('university/<int:id_university>', views.university_view),
	
]