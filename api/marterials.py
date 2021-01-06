from django.shortcuts import render
from django.http import JsonResponse
from material.models import Order, OrderDetails, Inventory, Supplier
from datetime import timedelta
import datetime
import json
from django.forms.models import model_to_dict

from django.core.serializers.json import DjangoJSONEncoder


# Create your views here.


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
