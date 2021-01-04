from django.contrib import admin
from django.utils.html import format_html
from django.urls import reverse
# Register your models here.
from .models import Store, Order as ProductOrder, Inventory as ProductInventory, OrderDetail as ProductOrderDetail, RFM, CAI, LTV


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


class InventoryAdmin(admin.ModelAdmin):
    list_display = ['id', 'name', 'currentAmount', 'creDate']


class StoreAdmin(admin.ModelAdmin):
    list_display = ['id', 'name', 'phone', 'address', 'creDate']


class OrderAdmin(admin.ModelAdmin):
    list_display = ['id', 'orderDate', 'deliveryDate', linkify(field_name="storeId"), 'creDate']

class OrderDetailAdmin(admin.ModelAdmin):
    list_display = ['id', 'amount', 'price','EXP', linkify(field_name="productInventoryId"), linkify(field_name="productOrderId"), 'creDate']


admin.site.register(Store, StoreAdmin)
admin.site.register(ProductOrder, OrderAdmin)
admin.site.register(ProductInventory, InventoryAdmin)
admin.site.register(ProductOrderDetail, OrderDetailAdmin)
admin.site.register(RFM)
admin.site.register(CAI)
admin.site.register(LTV)
