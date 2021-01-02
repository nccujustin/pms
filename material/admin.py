from django.contrib import admin

# Register your models here.
from .models import Supplier
from .models import Order as MaterialOrder
from .models import OrderDetails as MaterialOrderDetails
from .models import Inventory as MaterialInventory

admin.site.register(Supplier)
admin.site.register(MaterialOrder)
admin.site.register(MaterialOrderDetails)
admin.site.register(MaterialInventory)