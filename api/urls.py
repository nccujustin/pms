"""pms URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path

from . import views, stores, marterials

urlpatterns = [
    path('material/order/detail/<int:orderId>', marterials.getOrderDetailAPI, name='materialAddOrderAPI'),
    path('material/order/list', views.currentOrderRecordAPI, name='materialCurrentOrderAPI'),
    path('material/order/history', views.historyOrderRecordAPI, name='materialCurrentOrderAPI'),
    path('material/order/add', views.addOrderAPI, name='materialAddOrderAPI'),
    path('material/order/delete', marterials.deleteOrderAPI, name='materialAddOrderAPI'),
    path('store/order/list', stores.currentStoreRecordAPI, name='StoreCurrentOrderAPI'),
    path('store/order/history', stores.historyOrderRecordAPI, name='materialCurrentOrderAPI'),
    path('store/order/add', stores.addOrderAPI, name='StoreAddOrderAPI'),
    path('store/order/delete', stores.deleteOrderAPI, name='StoreAddOrderAPI'),
    path('store/order/detail/<int:orderId>', stores.getOrderDetailAPI, name='StoreAddOrderAPI'),
    path('material/order/detail/<int:orderId>', marterials.getOrderDetailAPI, name='materialAddOrderAPI'),
    path('eoq/<int:inventoryId>', marterials.getEOQAPI, name='getEOQAPI'),
    path('epq/<int:inventoryId>', marterials.getEPQAPI, name='getEPQAPI'),
]
