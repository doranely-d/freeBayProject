from rest_framework import serializers
from apirest.models import Cart, CartItem, Product, Role, User
from django.contrib.auth import authenticate
from rest_framework import serializers
from rest_framework.authtoken.models import Token

#Serializer Rol
class RoleSerializer(serializers.ModelSerializer):
    class Meta:
        model = Role
        fields = '__all__'

#Serializer users
class UserSerializer(serializers.ModelSerializer):
    Role = RoleSerializer(many=False, read_only=True)
    class Meta:
        model = User
        fields = '__all__'

#Serializer user login
class UserTokenSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ('id','username', 'email', 'first_name')

#Serializer Product
class ProductsSerializer(serializers.ModelSerializer):
    class Meta:
        model = Product
        fields = '__all__'

#Serializer Cart
class CartSerializer(serializers.ModelSerializer):
    class Meta:
        model = Cart
        fields = '__all__'

#Serializer CartItem
class CartItemSerializer(serializers.ModelSerializer):
    product = ProductsSerializer(many=False, read_only=True)
    cart = CartSerializer(many=False, read_only=True)

    class Meta:
        model = CartItem
        fields = '__all__'