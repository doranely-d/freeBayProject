from django.db import models
from apirest.models import User

#Modelo Product
class Product(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=250)
    price = models.FloatField()
    qty = models.PositiveIntegerField()
    url_image = models.CharField(max_length=250)
    created_at = models.DateField(auto_now_add=True)
    modified_at = models.DateField()

#Modelo Cart
class Cart(models.Model):
    id = models.AutoField(primary_key=True)
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    total = models.FloatField()
    total_qty = models.PositiveIntegerField()
    created_at = models.DateField(auto_now_add=True)
    modified_at = models.DateField()

#Modelo CartItem
class CartItem(models.Model):
    cart = models.ForeignKey(Cart, on_delete=models.CASCADE)
    product =  models.ForeignKey(Product, on_delete=models.CASCADE)
    qty = models.PositiveIntegerField(null=True)

#Modelo Order
class Order(models.Model):
    id = models.AutoField(primary_key=True)
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    total = models.FloatField()
    total_qty = models.PositiveIntegerField()
    created_at = models.DateField(auto_now_add=True)
    modified_at = models.DateField(null=True)

#Modelo OrderDetail
class OrderDetail(models.Model):
    order = models.ForeignKey(Order, on_delete=models.CASCADE)
    product =  models.ForeignKey(Product, on_delete=models.CASCADE)
    qty = models.PositiveIntegerField(null=True)
