from django.shortcuts import render
from django.http import JsonResponse
from material.models import Order, OrderDetails, Inventory, Supplier
from datetime import timedelta
import datetime
import json
from django.forms.models import model_to_dict

from django.core.serializers.json import DjangoJSONEncoder


# Create your views here.


def currentOrderRecordAPI(request):
    if request.method == 'GET':
        try:
            supplierList = []
            supplierObj = {}

            orderList = []
            orderObj = {}

            data = {}

            arr = []

            supplier = Supplier.objects.all()

            orderList = OrderDetails.objects.all().select_related(
                'materialOrderId', 'materialInventoryId')

            for s in supplier:
                supplierList.append(model_to_dict(s))
                sId = s.id
                supplierObj[sId] = s.name

            for order in orderList:
                now = datetime.datetime.now()

                d = datetime.date(now.year, now.month, now.day)

                if (d > order.materialOrderId.purchaseDate) == False:
                    arr.append(order)

            for a in arr:
                k = str(a.materialOrderId.id)
                a = model_to_dict(a)
                try:
                    data[k]['data'].append(a)
                except KeyError:
                    order = Order.objects.get(id=a["materialOrderId"])

                    order = model_to_dict(order)

                    print("order.supplierId", order["supplierId"])

                    data[k] = {
                        'data': [a],
                        'supplier': supplierObj[order["supplierId"]],
                        'orderDate': order["orderDate"],
                        'purchaseDate': order["purchaseDate"],
                    }

            data = {
                'message': 'ok',
                'success': True,
                'data': data
            }

            return JsonResponse(data, encoder=DjangoJSONEncoder)
        except Exception as e:
            print("currentOrderRecordAPI errro msg", e)
            data = {
                'message': e,
                'success': False
            }
            return JsonResponse(data)

def historyOrderRecordAPI(request):
    if request.method == 'GET':
        try:
            supplierList = []
            supplierObj = {}

            orderList = []
            orderObj = {}

            data = {}

            arr = []

            supplier = Supplier.objects.all()

            orderList = OrderDetails.objects.all().select_related(
                'materialOrderId', 'materialInventoryId')

            for s in supplier:
                supplierList.append(model_to_dict(s))
                sId = s.id
                supplierObj[sId] = s.name

            for order in orderList:
                now = datetime.datetime.now()

                d = datetime.date(now.year, now.month, now.day)

                if (d > order.materialOrderId.purchaseDate) == True:
                    arr.append(order)

            for a in arr:
                k = str(a.materialOrderId.id)
                a = model_to_dict(a)
                try:
                    data[k]['data'].append(a)
                except KeyError:
                    order = Order.objects.get(id=a["materialOrderId"])

                    order = model_to_dict(order)

                    print("order.supplierId", order["supplierId"])

                    data[k] = {
                        'data': [a],
                        'supplier': supplierObj[order["supplierId"]],
                        'orderDate': order["orderDate"],
                        'purchaseDate': order["purchaseDate"],
                    }

            data = {
                'message': 'ok',
                'success': True,
                'data': data
            }

            return JsonResponse(data, encoder=DjangoJSONEncoder)
        except Exception as e:
            print("currentOrderRecordAPI errro msg", e)
            data = {
                'message': e,
                'success': False
            }
            return JsonResponse(data)


def addOrderAPI(request):
    if request.method == 'POST':
        try:
            # parse json
            received_json_data = json.loads(request.body.decode("utf-8"))

            print('received_json_data', received_json_data)

            now = datetime.datetime.now()

            p = now + timedelta(days=10)

            orderDate = datetime.date(now.year, now.month, now.day)

            puchaseDate = datetime.date(p.year, p.month, p.day)

            # get all inventory and build mapping table
            inventory = Inventory.objects.all()

            inventoryTable = {}

            for i in inventory:
                inventoryTable[i.name] = i

            # 建立訂單 material_order , orderDate 今天， puchaseDate 先設定 +10天
            order = Order(orderDate=orderDate,
                          purchaseDate=puchaseDate, supplierId_id=received_json_data["supplier"])
            order.save()

            # 檢查原物料有沒有存在，沒有存在要先建立 inventory
            # 有存在就要把 currentAmmount 加上去(? 現在馬上加還是等進貨日期在增加)
            # loop data 去拿到 inventory id 去做 mapping

            bulk_arr = []

            for d in received_json_data["data"]:
                # check if exist this invnetory
                try:
                    # if not find this key will make error
                    inventoryTable[d["name"]]
                except KeyError:
                    # add this data to inventory
                    i = Inventory(name=d["name"], currentAmount=0)
                    i.save()
                    inventoryTable[d["name"]] = i

                exp = datetime.datetime.strptime(
                    d["exp"], '%Y-%m-%d').date()

                # 建立 material_orderdetails loop data 用 bulk_create 去產資料
                bulk_arr.append(OrderDetails(
                    weight=d["weight"],
                    price=d["price"],
                    origin=d["origin"],
                    EXP=exp,
                    materialOrderId=order,
                    materialInventoryId=inventoryTable[d["name"]])
                )

            OrderDetails.objects.bulk_create(bulk_arr)

            data = {
                'message': 'message',
                'success': True
            }
            return JsonResponse(data)
        except Exception as e:
            print("errro msg", e)
            data = {
                'message': e,
                'success': False
            }
            return JsonResponse(data)

