from django.shortcuts import render
from django.http import JsonResponse
from material.models import Order, OrderDetails, Inventory, Supplier
from store.models import Inventory as StoreInventory
from datetime import timedelta
import datetime
import json
from django.forms.models import model_to_dict
from django.core.serializers.json import DjangoJSONEncoder


# Create your views here.

# 原物料年度需求 (單位:kg)
dict1 = {
    '大麥芽': 73249600,
    '啤酒花': 71232100,
    '蓬萊米': 16038500,
    '酵母': 215700,
    '特殊處理水': 359500,
    '雙啤酒花': 2017500,
    '麥芽萃取液': 2011500,
    '啤酒花萃取液': 2011500,
    '碳酸水': 402300,
    '龍眼蜂蜜': 563200,
    '檸檬酸': 140800,
    '芒果': 568400,
    '葡萄': 568400,
    '鳳梨': 568400
}

# 原物料年持有成本 (元/1kg 原物料)
dict2 = {
    '大麥芽': 10,
    '啤酒花': 15,
    '蓬萊米': 10,
    '龍眼蜂蜜': 20,
    '檸檬酸': 17,
    '酵母': 10,
    '特殊處理水': 23,
    '雙啤酒花': 17,
    '麥芽萃取液': 17,
    '啤酒花萃取液': 17,
    '碳酸水': 15,
    '芒果': 30,
    '葡萄': 30,
    '鳳梨': 30,
    '荔枝': 30,
    '慕尼黑麥芽': 13,
    '小麥芽': 10,
}

# 原物料訂夠成本 (元/1kg 原物料)
dict3 = {
    '大麥芽': 70,
    '啤酒花': 60,
    '蓬萊米': 50,
    '龍眼蜂蜜': 90,
    '檸檬酸': 40,
    '酵母': 60,
    '特殊處理水': 60,
    '雙啤酒花': 65,
    '麥芽萃取液': 50,
    '啤酒花萃取液': 40,
    '碳酸水': 30,
    '芒果': 90,
    '葡萄': 80,
    '鳳梨': 80,
}

# 商品年度需求量 (單位: 10000個)
dict4 = {
    '金牌台灣啤酒': 14790,
    '經典台灣啤酒': 14500,
    '18天台灣生啤酒': 14380,
    '爽啤酒': 13450,
    '桶裝啤酒': 13620,
    '金牌Free': 13410,
    '蜂蜜啤酒': 14080,
    '水果啤酒': 14210,
}

# 商品年持有成本
dict5 = {
    '金牌台灣啤酒': 30,
    '經典台灣啤酒': 40,
    '18天台灣生啤酒': 30,
    '爽啤酒': 50,
    '桶裝啤酒': 80,
    '金牌Free': 60,
    '蜂蜜啤酒': 60,
    '水果啤酒': 45,
}

# 商品訂購成本(1kg 原物料)
dict6 = {
    '金牌台灣啤酒': 70,
    '經典台灣啤酒': 80,
    '18天台灣生啤酒': 60,
    '爽啤酒': 90,
    '桶裝啤酒': 100,
    '金牌Free': 60,
    '蜂蜜啤酒': 60,
    '水果啤酒': 65,
}

# 生產率 (單位:百分比， eg :30%)
dict7 = {
    '金牌台灣啤酒': 30,
    '經典台灣啤酒': 40,
    '18天台灣生啤酒': 30,
    '爽啤酒': 50,
    '桶裝啤酒': 80,
    '金牌Free': 60,
    '蜂蜜啤酒': 60,
    '水果啤酒': 45,
}


def getOrderDetailAPI(request, orderId):
    if request.method == 'GET':
        try:
            supplierList = []
            supplierObj = {}

            orderList = []
            orderObj = {}

            data = {}

            d = []

            arr = []

            supplier = Supplier.objects.all()

            orderList = OrderDetails.objects.all().select_related(
                'materialOrderId', 'materialInventoryId')

            inventory = Inventory.objects.all()

            inventoryTable = {}

            for i in inventory:
                inventoryTable[i.id] = i.name

            for s in supplier:
                supplierList.append(model_to_dict(s))
                sId = s.id
                supplierObj[sId] = s.name

            for order in orderList:
                arr.append(order)

            for a in arr:
                k = str(a.materialOrderId.id)
                orderId = str(orderId)
                if k == orderId:
                    a = model_to_dict(a)
                    a["inventoryName"] = inventoryTable[a["materialInventoryId"]]
                    d.append(a)

            data = {
                'message': 'ok',
                'success': True,
                'data': d
            }

            return JsonResponse(data, encoder=DjangoJSONEncoder)
        except Exception as e:
            print("currentOrderRecordAPI errro msg", e)
            data = {
                'message': e,
                'success': False
            }
            return JsonResponse(data)


def getEOQAPI(request, inventoryId):
    if request.method == 'GET':
        try:
            data = {}

            inventory = Inventory.objects.filter(id=inventoryId).values()

            inventory = list(inventory)

            inventory[0]["iYearNeed"] = dict1[inventory[0]["name"]]
            inventory[0]["iYearCost"] = dict2[inventory[0]["name"]]
            inventory[0]["iYearOrderCost"] = dict3[inventory[0]["name"]]

            inventory[0]["eoq"] = pow((2*inventory[0]["iYearNeed"] * inventory[0]
                                       ["iYearCost"] / inventory[0]["iYearOrderCost"]), 1 / 2)
            data = {
                'message': 'ok',
                'success': True,
                'data': inventory,
            }

            return JsonResponse(data, encoder=DjangoJSONEncoder)
        except Exception as e:
            print("getEOQAPI errro msg", e)
            data = {
                'message': e,
                'success': False
            }
            return JsonResponse(data)


def getEPQAPI(request, inventoryId):
    if request.method == 'GET':
        print('inventoryId', type(inventoryId))
        try:
            data = {}

            inventory = StoreInventory.objects.filter(id=inventoryId).values()
            inventory = list(inventory)

            print('inventory', inventory)

            print('inventory', inventory[0]['name'])

            inventory[0]["iYearNeed"] = dict4[inventory[0]["name"]]

            inventory[0]["iYearCost"] = dict5[inventory[0]["name"]]

            inventory[0]["iYearOrderCost"] = dict6[inventory[0]["name"]]

            inventory[0]["epq"] = pow((2*inventory[0]["iYearNeed"] * inventory[0]
                                       ["iYearCost"] / inventory[0]["iYearOrderCost"]), 1 / 2) * pow(2, 1/2)

            data = {
                'message': 'ok',
                'success': True,
                'data': inventory
            }

            return JsonResponse(data, encoder=DjangoJSONEncoder)
        except Exception as e:
            print("getEOQAPI errro msg", e)
            data = {
                'message': e,
                'success': False
            }
            return JsonResponse(data)


def deleteOrderAPI(request):
    if request.method == 'POST':
        try:
            received_json_data = json.loads(request.body.decode("utf-8"))

            print('received_json_data', received_json_data)

            Order.objects.filter(id=received_json_data["id"]).delete()

            data = {
                'message': 'ok',
                'success': True,
            }

            return JsonResponse(data, encoder=DjangoJSONEncoder)
        except Exception as e:
            print("currentStoreRecordAPI errro msg", e)
            data = {
                'message': e,
                'success': False
            }
            return JsonResponse(data)
