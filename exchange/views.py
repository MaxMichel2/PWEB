from django.shortcuts import render
from django.http import HttpResponse, Http404
from datetime import datetime

# Create your views here.

def home_view(request):
	return render(request, 'exchange/date.html', {'date': datetime.now()})
	
def universities_view(request):
	return HttpResponse("List of all universities")
	
def university_view(request, id_university):
	return HttpResponse("This is university number {0}".format(id_university))