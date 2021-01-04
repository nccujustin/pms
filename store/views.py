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