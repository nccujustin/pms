from django.shortcuts import render

# Create your views here.


def currentOrderRecord(request):
    return render(request, 'material/currentOrderRecord.html')


def historyOrderRecord(request):
    return render(request, 'material/hisotryOrderRecord.html')


def inventory(request):
    return render(request, 'material/inventory.html')
