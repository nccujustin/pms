from django.contrib import admin

# Register your models here.
from .models import Supplier, Order as MaterialOrder, OrderDetails as MaterialOrderDetails, Inventory as MaterialInventory

class SupplierAdmin(admin.ModelAdmin):
    list_display = ['id', 'name','phone','address', 'creDate']

class MaterialInventoryAdmin(admin.ModelAdmin):
    list_display = ['id', 'name','currentAmount','creDate']
    search_fields = ['name']# 搜尋功能

admin.site.register(Supplier, SupplierAdmin)
admin.site.register(MaterialOrder)
admin.site.register(MaterialOrderDetails)
admin.site.register(MaterialInventory, MaterialInventoryAdmin)
