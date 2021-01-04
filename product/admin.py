from django.contrib import admin

# Register your models here.
from .models import Production, Consume, Manufacture

class ProductionAdmin(admin.ModelAdmin):
    list_display = ['id', 'productionDate', 'creDate']


class ConsumeAdmin(admin.ModelAdmin):
    list_display = ['id', 'productionId','materialInventoryId','costAmount','creDate']
    # search_fields = ['productionId','materialInventoryId', 'costAmount']       # 搜尋功能

admin.site.register(Production, ProductionAdmin)
admin.site.register(Consume, ConsumeAdmin)
admin.site.register(Manufacture)
