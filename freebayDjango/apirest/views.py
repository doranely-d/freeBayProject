import datetime
from django.contrib.sessions.models import Session
from django.http.response import JsonResponse
from rest_framework import status
from rest_framework.authtoken.views import ObtainAuthToken
from rest_framework.authtoken.models import Token
from rest_framework.views import APIView
from rest_framework.decorators import api_view
from rest_framework.response import Response
from apirest.models import Cart, CartItem, Product, User
from apirest.serializers import CartItemSerializer, CartSerializer, ProductsSerializer, UserSerializer, UserTokenSerializer

class user(APIView):
    def get(self, request):
        return Response('HELLO WORLD! from Django.')

#Login users
class login(ObtainAuthToken):
    def post(self, request, *args, **kwargs):
        data = {
            'username':'adminfreebay',
            'password':'freeBay2015***5',
        }
        login_serializer = self.serializer_class(data=data, context = {'request': request})
        print( request.GET)
        if login_serializer.is_valid():
            user = login_serializer.validated_data['user']
            if user.is_active:
                token, created = Token.objects.get_or_create(user =user)
                user_serializer = UserTokenSerializer(user)
                if created:
                    return Response({ 
                        'token':token.key,
                        'user':user_serializer.data,
                        'message': 'Inicio correcto'
                        }, status= status.HTTP_201_CREATED)
                else:
                    all_sessions  = Session.objects.filter(expire_date__gte=datetime.datetime.now())
                    for session in all_sessions:
                        session_data = session.get_decoded()
                        if user.id == int(session_data.get('_auth_user_id')):
                            session.delete()
                    token.delete()
                    token = Token.objects.create(user=user)
                    return Response({ 
                        'token':token.key,
                        'user':user_serializer.data,
                        'message': 'Inicio correcto'
                        }, status= status.HTTP_201_CREATED)
            else:
                return Response({'message': 'El usuario no puede iniciar Sesion'}, status= status.HTTP_401_UNAUTHORIZED)
        else:
            return Response({'message': 'El usuario y password incorrectos'}, status= status.HTTP_400_BAD_REQUEST)

        return Response({'message': 'No se ha encontrado el Carrito'}, status= status.HTTP_200_OK)

class Logout(APIView):
    def get(self, request, *args, **kwargs):
        token = request.GET.get('token')
        print(token)
        token =Token.objects.filter(key = token).first()

        if token:
            user = token.user
            all_sessions  = Session.objects.filter(expire_date__gte=datetime.datetime.now())
            for session in all_sessions:
                session_data = session.get_decoded()
                if user.id == int(session_data.get('_auth_user_id')):
                    session.delete()
            
            token.delete()
            session_message = 'sesiones de usuario eliminadas'
            token_message = 'Token eliminado'
            return Response({'token_message': token_message,'session_message':session_message}, status= status.HTTP_200_OK)
   
        return Response({'error': "No se encontro el token"}, status= status.HTTP_400_BAD_REQUEST)

#Register users
class register(APIView):
    def get(self,request):
        first = User.objects.all()
        print(first)
        products_serializer = UserSerializer(first, many=True)
        return JsonResponse(products_serializer.data, safe=False)

@api_view(['GET'])
def product_view(request):

    if request.method == 'GET':
        products = Product.objects.all()
    
        title = request.GET.get('qty', None)
        if title is not None:
            products = products.filter(title__icontains=title)
        
        products_serializer = ProductsSerializer(products, many=True)
        return Response(products_serializer.data, status = status.HTTP_200_OK)


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
        if(cart_serializer.is_valid):
            cart_serializer.save()
            return Response(cart_serializer.data, status = status.HTTP_201_CREATED)
        return Response(cart_serializer.errors)

    elif request.method == 'PUT':
        cart = CartItem.objects.filter(id=1).first()
        
        cart_serializer = CartItemSerializer(cart,data = request.data)
        if(cart_serializer.is_valid):
            cart_serializer.save()
            return Response(cart_serializer.data, status = status.HTTP_201_CREATED)
        return Response(cart_serializer.errors)
    
    elif request.method == 'DELETE':
        cart = CartItem.objects.filter(id=1).first()

        cart_serializer = CartItemSerializer(cart,data = request.data)
        if(cart_serializer.is_valid):
            cart_serializer.delete()
            return Response(cart_serializer.data, status = status.HTTP_201_CREATED)
        return Response(cart_serializer.errors)
            
    return Response({'message': 'No se ha encontrado items del carrito'}, status= status.HTTP_400_BAD_REQUEST)
  
