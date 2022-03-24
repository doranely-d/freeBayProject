from rest_framework import serializers
from apirest.serializers import UserSerializer
from cart.models import Cart, CartItem, Order, OrderDetail, Product

#Serializer Product
class ProductsSerializer(serializers.ModelSerializer):
    class Meta:
        model = Product
        fields = '__all__'
        extra_kwargs = {
            'name': {'required': False},
            'price': {'required': False},
            'url_image': {'required': False}, 
            'qty': {'required': False},
            'modified_at': {'required': False}
        }

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

#Serializer Order
class OrderSerializer(serializers.ModelSerializer):
    user = UserSerializer(many=False, read_only=True)
    class Meta:
        model = Order
        fields = '__all__'

#Serializer OrderDetail
class OrderDetailSerializer(serializers.ModelSerializer):
    product = ProductsSerializer(many=False, read_only=True)
    order = OrderSerializer(many=False, read_only=True)

    class Meta:
        model = OrderDetail
        fields = '__all__'