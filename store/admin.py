from django.contrib import admin

# Register your models here.
from .models import Store
from .models import Order as ProductOrder
from .models import Inventory as ProductInventory
from .models import OrderDetail as ProductOrderDetail
from .models import RFM
from .models import CAI
from .models import LTV


admin.site.register(Store)
admin.site.register(ProductOrder)
admin.site.register(ProductInventory)
admin.site.register(ProductOrderDetail)
admin.site.register(RFM)
admin.site.register(CAI)
admin.site.register(LTV)