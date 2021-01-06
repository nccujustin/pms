from django.db import models
from material.models import Inventory as MaterialInventory
from store.models import Inventory as ProductInventory

# 生產表
class Production(models.Model):
	id = models.AutoField(primary_key=True)
	productionDate = models.DateField(auto_now=False, auto_now_add=False)
	creDate = models.DateTimeField(auto_now_add=True, blank=True)
	def __str__(self):
  		return str(self.id)

# 消耗
class Consume(models.Model):
	id = models.AutoField(primary_key=True)
	productionId = models.ForeignKey(Production,null=True, on_delete=models.CASCADE) # 生產計劃編號
	materialInventoryId = models.ForeignKey(MaterialInventory,blank=True, null=True, on_delete=models.CASCADE) # 原物料編號
	costAmount = models.IntegerField() # 消耗原物料存貨量
	creDate = models.DateTimeField(auto_now_add=True, blank=True)

	def __str__(self):
  		return str(self.id)

# 製造
class Manufacture(models.Model):
	id = models.AutoField(primary_key=True)
	productionId = models.ForeignKey(Production,null=True, on_delete=models.CASCADE)
	productInventoryId = models.ForeignKey(ProductInventory,blank=True, null=True, on_delete=models.CASCADE)
	amount = models.IntegerField()
	creDate = models.DateTimeField(auto_now_add=True, blank=True)

	def __str__(self):
  		return str(self.id)