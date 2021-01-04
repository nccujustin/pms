from django.shortcuts import render
from django.http import HttpResponse

# Create your views here.
def materialOrder(request):
    return render(request, 'welcome/materialOrder.html')

def materialOrderRecord(request):
    return render(request, 'welcome/materialOrderRecord.html')

def index(request):
    return render(request, 'page.html')

def index2(request):
    return render(request, 'ttt.html')    