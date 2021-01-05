from django.shortcuts import render
from .models import Order, OrderDetails, Inventory
import datetime

# Create your views here.


def currentOrderRecord(request):
    orderList = OrderDetails.objects.all().select_related(
        'materialOrderId', 'materialInventoryId')
    arr = []
    for order in orderList:
        now = datetime.datetime.now()

        d = datetime.date(now.year, now.month, now.day)
        print('d', d)
        print('order.materialOrderId.purchaseDate',
              order.materialOrderId.purchaseDate)
        print(d > order.materialOrderId.purchaseDate)
        if (d > order.materialOrderId.purchaseDate) == False:
            arr.append(order)
    return render(request, 'material/currentOrderRecord.html', {
        'orderList': arr
    })


def historyOrderRecord(request):
    orderList = OrderDetails.objects.all().select_related(
        'materialOrderId', 'materialInventoryId')
    arr = []
    for order in orderList:
        now = datetime.datetime.now()

        d = datetime.date(now.year, now.month, now.day)

        print('d', d)
        print('order.materialOrderId.purchaseDate',
              order.materialOrderId.purchaseDate)
        print(d > order.materialOrderId.purchaseDate)
        if (d > order.materialOrderId.purchaseDate) == True:
            arr.append(order)
    return render(request, 'material/hisotryOrderRecord.html', {
        'historyList': arr
    })


def inventory(request):
    inventoryList = Inventory.objects.all()

    return render(request, 'material/inventory.html', {
        'inventoryList': inventoryList
    })


def editOrder(request, orderId):
    print(orderId)
    return render(request, 'material/currentOrderRecord.html')
