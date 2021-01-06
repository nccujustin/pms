from django.shortcuts import render, redirect
from django.http import JsonResponse
from .models import Order, OrderDetails, Inventory, Supplier
from datetime import timedelta
import datetime
import json

# Create your views here.


def currentOrderRecord(request):
    orderList = OrderDetails.objects.all().select_related(
        'materialOrderId', 'materialInventoryId')
    data = {}
    arr = []
    for order in orderList:
        now = datetime.datetime.now()

        d = datetime.date(now.year, now.month, now.day)

        if (d > order.materialOrderId.purchaseDate) == False:
            arr.append(order)
    
    for a in arr:
        k = str(a.materialOrderId.id)
        try:
            data[k].append(a)
        except KeyError:
            data[k] = [a]
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

def orderDetail(request, orderId):
    print(orderId)
    return render(request, 'material/orderDetails.html')


def addOrder(request):
    if request.method == 'GET':
        print("get")
        n = []
        for i in range(9):
            i = str(i)
            d = {}
            d["name"] = "name-" + i
            d["price"] = "price-" + i
            d["weight"] = "weight-" + i
            d["origin"] = "origin-" + i
            d["exp"] = "exp-" + i
            n.append(d)
        # get supplies list
        supplier = Supplier.objects.all()

        return render(request, 'material/addOrder.html', {
            'n': n,
            'supplierList': supplier
        })
