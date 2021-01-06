from django.shortcuts import render
from .models import Order, OrderDetail, Inventory, Store
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
    if request.method == 'GET':
        n = []
        for i in range(9):
            i = str(i)
            d = {}
            d["name"] = "name-" + i
            d["price"] = "price-" + i
            d["amount"] = "amount-" + i
            d["exp"] = "exp-" + i
            n.append(d)
        # get supplies list
        store = Store.objects.all()
    return render(request, 'store/addOrder.html', {
        'storeList': store,
        'n': n}
    )


def storePage(request, storeId):
    if request.method == 'GET':
        store = Store.objects.get(name=storeId)

        return render(request, 'store/stores.html', {'store': store})


def orderDetailPage(request, orderId):
    return render(request, 'store/orderDetails.html', {})
