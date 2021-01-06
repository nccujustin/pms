from django.db import models

# 供應商表


class Supplier(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=10)  # 名稱
    phone = models.CharField(max_length=20)  # 電話
    address = models.CharField(max_length=100)  # 地址
    creDate = models.DateTimeField(auto_now_add=True, blank=True)

    def __str__(self):
        return self.name

# 原物料訂單


class Order(models.Model):
    id = models.AutoField(primary_key=True)
    orderDate = models.DateField(auto_now=False, auto_now_add=False)
    purchaseDate = models.DateField(auto_now=False, auto_now_add=False)
    supplierId = models.ForeignKey(
        Supplier, blank=True, null=True, on_delete=models.CASCADE)
    creDate = models.DateTimeField(auto_now_add=True, blank=True)

    def __str__(self):
        return str(self.id)

# 原物料存貨


class Inventory(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=10)  # 名稱
    currentAmount = models.IntegerField()
    creDate = models.DateTimeField(auto_now_add=True, blank=True)

    def __str__(self):
        return str(self.id)

# 原物料訂單細目


class OrderDetails(models.Model):
    id = models.AutoField(primary_key=True)
    weight = models.IntegerField()
    price = models.IntegerField()
    origin = models.CharField(max_length=100)
    EXP = models.DateField(auto_now=False, auto_now_add=False)
    materialOrderId = models.ForeignKey(
        Order, blank=True, null=True, on_delete=models.CASCADE)
    materialInventoryId = models.ForeignKey(
        Inventory, blank=True, null=True, on_delete=models.CASCADE)
    creDate = models.DateTimeField(auto_now_add=True, blank=True)

    def __str__(self):
        return str(self.id)
