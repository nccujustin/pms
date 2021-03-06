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
    path('order/', views.currentOrderRecord, name='materialOrder'),
    path('order/edit/<int:orderId>', views.editOrder, name='materialEditOrder'),
    path('history/', views.historyOrderRecord, name='materialOrderRecord'),
    path('inventory/', views.inventory, name='materialOrderRecord'),
    path('order/add', views.addOrder, name='materialAddOrderRecord'),
    path('order/detail/<int:orderId>', views.orderDetail, name='materialAddOrderRecord'),
    path('suppliers/<str:supplierId>', views.suppliersPage, name='suppliersList'),
    path('eoq/', views.eoqPage, name='eoqPage'),
    path('epq/', views.epqPage, name='epqPage'),
]
