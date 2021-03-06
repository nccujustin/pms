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

from . import views

urlpatterns = [
    path('order/', views.currentOrderRecord, name='storeOrder'),
    path('history/', views.hisotryOrderRecord, name='storeHistory'),
    path('inventory/', views.inventory, name='storeInventory'),
    path('rmf/', views.rmf, name='storeRmf'),
    path('value/', views.value, name='storeValue'),
    path('active/', views.active, name='storeActive'),
    path('order/add', views.addOrder, name='storeActive'),
    path('order/add', views.addOrder, name='storeActive'),
    path('order/detail/<int:orderId>', views.orderDetailPage, name='storeActive'),
    path('list/<str:storeId>', views.storePage, name='storeActive'),
]
