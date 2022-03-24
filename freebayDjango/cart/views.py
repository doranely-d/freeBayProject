from rest_framework.decorators import api_view
from rest_framework import status
from rest_framework.response import Response

from cart.models import Cart, CartItem, Order, Product
from cart.serializers import CartItemSerializer, CartSerializer, OrderSerializer, ProductsSerializer

@api_view(['GET','POST','PUT','DELETE'])
def product_view(request, pk=None):

    if request.method == 'GET':
        products = Product.objects.all()
    
        title = request.GET.get('qty', None)
        if title is not None:
            products = products.filter(title__icontains=title)
        
        products_serializer = ProductsSerializer(products, many=True)
        return Response(products_serializer.data, status = status.HTTP_200_OK)

    elif request.method == 'POST':
        products_serializer = ProductsSerializer(data = request.data)

        if(products_serializer.is_valid()):
            products_serializer.save()
            return Response(products_serializer.data, status = status.HTTP_201_CREATED)
        return Response(products_serializer.errors)

    elif request.method == 'PUT':
        products = Product.objects.filter(id=pk).first()
        
        products_serializer = ProductsSerializer(products,data = request.data)
        if(products_serializer.is_valid()):
            products_serializer.save()
            return Response(products_serializer.data, status = status.HTTP_201_CREATED)
        return Response(products_serializer.errors)
    
    elif request.method == 'DELETE':
        products = Product.objects.filter(id=pk).first()
        products.delete()
        return Response('Eliminado', status = status.HTTP_201_CREATED)


@api_view(['GET','POST'])
def cart_total_view(request,pk=None):
    cartTotal = Cart.objects.filter(user=1).first()
   
    if cartTotal:
        if request.method == 'GET':      
            cart_serializer = CartSerializer(cartTotal)
            return Response(cart_serializer.data, status = status.HTTP_200_OK)

        elif request.method == 'POST':
            cart_serializer = CartSerializer(data = request.data)
            if(cart_serializer.is_valid):
                cart_serializer.save()
                return Response(cart_serializer.data, status = status.HTTP_201_CREATED)
            return Response(cart_serializer.errors)
            
    return Response({'message': 'No se ha encontrado el Carrito'}, status= status.HTTP_400_BAD_REQUEST)

@api_view(['GET','POST', 'PUT', 'DELETE'])
def cart_item_view(request,pk=None):
    cartItem = CartItem.objects.filter(cart=1)
    
    if cartItem:
        if request.method == 'GET':   
            cart_serializer = CartItemSerializer(cartItem, many=True)
            return Response(cart_serializer.data, status = status.HTTP_200_OK)
            
    elif request.method == 'POST':
        cart_serializer = CartItemSerializer(data = request.data)
        if(cart_serializer.is_valid()):
            cart_serializer.save()
            return Response(cart_serializer.data, status = status.HTTP_201_CREATED)
        return Response(cart_serializer.errors)

    elif request.method == 'PUT':
        cart = CartItem.objects.filter(id=1).first()
        
        cart_serializer = CartItemSerializer(cart,data = request.data)
        if(cart_serializer.is_valid()):
            cart_serializer.save()
            return Response(cart_serializer.data, status = status.HTTP_201_CREATED)
        return Response(cart_serializer.errors)
    
    elif request.method == 'DELETE':
        cart = CartItem.objects.filter(id=1).first()
        cart_serializer.delete()
        return Response('Eliminado', status = status.HTTP_201_CREATED)
            
    return Response({'message': 'No se ha encontrado items del carrito'}, status= status.HTTP_400_BAD_REQUEST)
  

@api_view(['GET','POST'])
def order_view(request,pk=None):
   
    if request.method == 'GET':  
        orders = Order.objects.all()    
        order_serializer = OrderSerializer(orders, many=True)
        return Response(order_serializer.data, status = status.HTTP_200_OK)

    elif request.method == 'POST':
        order_serializer = OrderSerializer(data = request.data)
        if(order_serializer.is_valid()):
            order_serializer.save()
            return Response(order_serializer.data, status = status.HTTP_201_CREATED)
        return Response(order_serializer.errors)
            
    return Response({'message': 'No se ha encontrado el Carrito'}, status= status.HTTP_400_BAD_REQUEST)