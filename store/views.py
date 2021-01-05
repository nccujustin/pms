from django.shortcuts import render
from .models import Order, OrderDetail, Inventory

# Create your views here.


def currentOrderRecord(request):
    orderList = OrderDetail.objects.all().select_related('productOrderId', 'productInventoryId')
    return render(request, 'store/currentOrderRecord.html', {
        'orderList': orderList
    })


def hisotryOrderRecord(request):
    return render(request, 'store/hisotryOrderRecord.html')


def inventory(request):
    inventoryList = Inventory.objects.all()

    return render(request, 'store/inventory.html',{
        'inventoryList': inventoryList
    })

def rmf(request):
    return render(request, 'store/rmf.html',{})

def value(request):
    return render(request, 'store/value.html',{})

def active(request):
    return render(request, 'store/active.html',{})