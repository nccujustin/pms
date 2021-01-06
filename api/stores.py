from django.shortcuts import render
from django.http import JsonResponse
from store.models import Store, Order, Inventory,  OrderDetail, RFM, CAI, LTV
from datetime import timedelta
import datetime
import json
from django.forms.models import model_to_dict

from django.core.serializers.json import DjangoJSONEncoder


# Create your views here.


def currentStoreRecordAPI(request):
    if request.method == 'GET':
        try:
            storeList = []
            storeObj = {}

            orderList = []
            orderObj = {}

            data = {}

            arr = []

            store = Store.objects.all()

            orderList = OrderDetail.objects.all().select_related(
                'productOrderId', 'productInventoryId')

            for s in store:
                storeList.append(model_to_dict(s))
                sId = s.id
                storeObj[sId] = s.name

            for order in orderList:
                now = datetime.datetime.now()

                d = datetime.date(now.year, now.month, now.day)

                if (d > order.productOrderId.deliveryDate) == False:
                    arr.append(order)

            for a in arr:
                k = str(a.productOrderId.id)
                a = model_to_dict(a)
                try:
                    data[k]['data'].append(a)
                except KeyError:
                    order = Order.objects.get(id=a["productOrderId"])

                    order = model_to_dict(order)

                    print("order.storeId", order["storeId"])

                    data[k] = {
                        'data': [a],
                        'store': supplierObj[order["storeId"]],
                        'orderDate': order["orderDate"],
                        'deliveryDate': order["deliveryDate"],
                    }

            data = {
                'message': 'ok',
                'success': True,
                'data': data
            }

            return JsonResponse(data, encoder=DjangoJSONEncoder)
        except Exception as e:
            print("currentStoreRecordAPI errro msg", e)
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

            deliveryDate = datetime.date(p.year, p.month, p.day)

            # get all inventory and build mapping table
            inventory = Inventory.objects.all()

            inventoryTable = {}

            for i in inventory:
                inventoryTable[i.name] = i

            # 建立訂單 material_order , orderDate 今天， puchaseDate 先設定 +10天
            order = Order(orderDate=orderDate,
                          deliveryDate=deliveryDate, storeId_id=received_json_data["store"])
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
                bulk_arr.append(OrderDetail(
                    amount=d["amountt"],
                    price=d["price"],
                    EXP=exp,
                    productOrderId=order,
                    productInventoryId=inventoryTable[d["name"]])

                	

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
from django.shortcuts import render
