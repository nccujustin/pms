from django.contrib import admin
from django.utils.html import format_html
from django.urls import reverse
# Register your models here.
from .models import Supplier, Order as MaterialOrder, OrderDetails as MaterialOrderDetails, Inventory as MaterialInventory

def linkify(field_name):
    """
    Converts a foreign key value into clickable links.

    If field_name is 'parent', link text will be str(obj.parent)
    Link will be admin url for the admin url for obj.parent.id:change
    """
    def _linkify(obj):
        linked_obj = getattr(obj, field_name)
        if linked_obj is None:
            return '-'
        app_label = linked_obj._meta.app_label
        model_name = linked_obj._meta.model_name
        view_name = f'admin:{app_label}_{model_name}_change'
        link_url = reverse(view_name, args=[linked_obj.pk])
        return format_html('<a href="{}">{}</a>', link_url, linked_obj)

    _linkify.short_description = field_name  # Sets column name
    return _linkify

class SupplierAdmin(admin.ModelAdmin):
    list_display = ['id', 'name','phone','address', 'creDate']

class MaterialOrderAdmin(admin.ModelAdmin):
    list_display = ['id', 'orderDate','purchaseDate',linkify(field_name="supplierId"),'creDate']
    # search_fields = ['name']# 搜尋功能

class MaterialInventoryAdmin(admin.ModelAdmin):
    list_display = ['id', 'name','currentAmount','creDate']
    search_fields = ['name']# 搜尋功能

class MaterialOrderDetailAdmin(admin.ModelAdmin):
    list_display = ['id', 'weight','price','origin', 'EXP',linkify(field_name="materialOrderId"), linkify(field_name="materialInventoryId"), 'creDate']
    # search_fields = ['name']# 搜尋功能

admin.site.register(Supplier, SupplierAdmin)
admin.site.register(MaterialOrder, MaterialOrderAdmin)
admin.site.register(MaterialOrderDetails, MaterialOrderDetailAdmin)
admin.site.register(MaterialInventory, MaterialInventoryAdmin)
