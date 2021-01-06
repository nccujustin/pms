from django.shortcuts import render
from .models import Order, OrderDetail, Inventory
import datetime

# Create your views here.


def currentOrderRecord(request):
    orderList = OrderDetail.objects.select_related(
        'productOrderId', 'productInventoryId')
    arr = []

    for order in orderList:
        now = datetime.datetime.now()

        d = datetime.date(now.year, now.month, now.day)

        if (d > order.productOrderId.deliveryDate) == False:
            arr.append(order)

    return render(request, 'store/currentOrderRecord.html', {
        'orderList': arr
    })


def hisotryOrderRecord(request):
    orderList = OrderDetail.objects.select_related(
        'productOrderId', 'productInventoryId')
    arr = []

    for order in orderList:
        now = datetime.datetime.now()

        d = datetime.date(now.year, now.month, now.day)

        if (d > order.productOrderId.deliveryDate) == True:
            arr.append(order)
    return render(request, 'store/hisotryOrderRecord.html', {
        'historyList': arr
    })


def inventory(request):
    inventoryList = Inventory.objects.all()

    return render(request, 'store/inventory.html', {
        'inventoryList': inventoryList
    })


def rmf(request):
    return render(request, 'store/rmf.html', {})


def value(request):
    return render(request, 'store/value.html', {})


def active(request):
    return render(request, 'store/active.html', {})

def addOrder(request):
    return render(request, 'store/addOrder.html', {})