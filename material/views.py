from django.shortcuts import render
from .models import Order, OrderDetails, Inventory

# Create your views here.


def currentOrderRecord(request):
    orderList = OrderDetails.objects.all().select_related('materialOrderId', 'materialInventoryId')
    return render(request, 'material/currentOrderRecord.html',{
        'orderList': orderList
    })


def historyOrderRecord(request):
    return render(request, 'material/hisotryOrderRecord.html')


def inventory(request):
    inventoryList = Inventory.objects.all()

    return render(request, 'material/inventory.html',{
        'inventoryList': inventoryList
    })


def editOrder(request, orderId):
    print(orderId)
    return render(request, 'material/currentOrderRecord.html')