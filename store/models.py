from django.db import models

# 商店
class Store(models.Model):
	name = models.CharField(max_length = 10) # 名稱
	phone = models.CharField(max_length = 20) # 電話
	address = models.CharField(max_length = 100) # 地址
	creDate = models.DateTimeField(auto_now_add=True, blank=True)
	def __str__(self):
  		return self.name

# 商品訂單
class Order(models.Model):
	id = models.AutoField(primary_key=True)
	orderDate = models.DateField(auto_now=False, auto_now_add=False) # 訂單日期
	deliveryDate = models.DateField(auto_now=False, auto_now_add=False) # 出貨日期
	storeId = models.ForeignKey(Store,blank=True,null=True, on_delete=models.CASCADE, related_name='order_store') # order by which store
	creDate = models.DateTimeField(auto_now_add=True, blank=True)

	def __str__(self):
  		return str(self.id)

# 商品存貨
class Inventory(models.Model):
	id = models.AutoField(primary_key=True)
	name = models.CharField(max_length = 50) # 名稱
	currentAmount = models.IntegerField() # 目前存量
	creDate = models.DateTimeField(auto_now_add=True, blank=True)
	def __str__(self):
  		return str(self.id)

# 商品訂單細目
class OrderDetail(models.Model):
	id = models.AutoField(primary_key=True)
	amount = models.CharField(max_length = 10) # 數量
	price = models.CharField(max_length = 20) # 價錢
	EXP = models.DateField(auto_now=False, auto_now_add=False) # 保存期限 expiration date
	productInventoryId = models.ForeignKey(Inventory,blank=True,null=True,on_delete=models.CASCADE) # 商品編號
	productOrderId = models.ForeignKey(Order,blank=True, null=True, on_delete=models.CASCADE) # 商品訂單編號
	creDate = models.DateTimeField(auto_now_add=True, blank=True)
	def __str__(self):
  		return str(self.id)
	
# RFM
class RFM(models.Model):
	time = models.CharField(max_length = 20, primary_key=True)
	recency = models.DateTimeField(auto_now_add=False, blank=False)
	frequency = models.CharField(max_length = 20)
	monetaryValue = models.IntegerField()
	storeId = models.ForeignKey(Store,blank=True, null=True,on_delete=models.CASCADE)
	creDate = models.DateTimeField(auto_now_add=True, blank=True)

# 顧客活動指標
class CAI(models.Model):
	time = models.CharField(max_length = 20, primary_key=True)
	AIT = models.CharField(max_length = 20)
	duration = models.CharField(max_length = 20)
	retentionRate = models.CharField(max_length = 20)
	survivalRate = models.CharField(max_length = 20)
	activeProbability = models.CharField(max_length = 20)
	storeId = models.ForeignKey(Store,blank=True,null=True, on_delete=models.CASCADE)
	creDate = models.DateTimeField(auto_now_add=True, blank=True)
#
class LTV(models.Model):
	time = models.CharField(max_length = 20, primary_key=True)
	SCR = models.CharField(max_length = 20)
	SW = models.CharField(max_length = 20)
	sizeOfWallet = models.CharField(max_length = 20)
	storeId = models.ForeignKey(Store,blank=True,null=True, on_delete=models.CASCADE)
	creDate = models.DateTimeField(auto_now_add=True, blank=True)