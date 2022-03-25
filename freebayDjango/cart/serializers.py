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
    class Meta:
        model = CartItem
        fields = '__all__'

    def to_representation(self, instance):
        self.fields['product'] =  ProductsSerializer(read_only=True)
        self.fields['cart'] =  CartSerializer(read_only=True)
        return super(CartItemSerializer, self).to_representation(instance)
    

#Serializer Order
class OrderSerializer(serializers.ModelSerializer):
    class Meta:
        model = Order
        fields = '__all__'
        extra_kwargs = {'total': {'required': False},'total_qty': {'required': False},'user': {'required': False}}

    def to_representation(self, instance):
        self.fields['user'] =  UserSerializer(read_only=True)
        return super(OrderSerializer, self).to_representation(instance)
    
#Serializer OrderDetail
class OrderDetailSerializer(serializers.ModelSerializer):

    class Meta:
        model = OrderDetail
        fields = '__all__'
    
    def to_representation(self, instance):
        self.fields['product'] =  ProductsSerializer(read_only=True)
        self.fields['cart'] =  CartSerializer(read_only=True)
        return super(OrderDetailSerializer, self).to_representation(instance)