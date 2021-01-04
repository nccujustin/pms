from django.contrib import admin

# Register your models here.
from .models import Supplier, Order as MaterialOrder, OrderDetails as MaterialOrderDetails, Inventory as MaterialInventory

admin.site.register(Supplier)
admin.site.register(MaterialOrder)
admin.site.register(MaterialOrderDetails)
admin.site.register(MaterialInventory)
