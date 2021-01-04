from django.contrib import admin

# Register your models here.
from .models import Store, Order as ProductOrder, Inventory as ProductInventory, OrderDetail as ProductOrderDetail, RFM, CAI, LTV


admin.site.register(Store)
admin.site.register(ProductOrder)
admin.site.register(ProductInventory)
admin.site.register(ProductOrderDetail)
admin.site.register(RFM)
admin.site.register(CAI)
admin.site.register(LTV)