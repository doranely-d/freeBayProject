import datetime
from django.contrib.sessions.models import Session
from django.http.response import JsonResponse
from rest_framework.decorators import api_view
from rest_framework import status
from rest_framework.authtoken.views import ObtainAuthToken
from rest_framework.authtoken.models import Token
from rest_framework.views import APIView
from rest_framework.response import Response
from apirest.models import  User
from apirest.serializers import  UserSerializer, UserTokenSerializer
from cart.models import Cart
from cart.serializers import CartSerializer

@api_view(['GET','POST', 'PUT', 'DELETE'])
def user_view(request, pk=None):

    if request.method == 'GET':
        users = User.objects.all()

        user_serializer = UserSerializer(users, many=True)
        return Response(user_serializer.data, status = status.HTTP_200_OK)

    elif request.method == 'POST':
        print(request.data)
        user_serializer = UserSerializer(data = request.data)

        if user_serializer.is_valid():
            user_serializer.save()
            return Response(user_serializer.data, status = status.HTTP_201_CREATED)
        return Response(user_serializer.errors)

#Login users
class login(ObtainAuthToken):
    def post(self, request, *args, **kwargs):
   
        login_serializer = self.serializer_class(data=request.GET, context = {'request': request})

        if login_serializer.is_valid():
            user = login_serializer.validated_data['user']
            if user.is_active:
                token, created = Token.objects.get_or_create(user =user)
                user_serializer = UserTokenSerializer(user)
                if created:
                    cartTotal = Cart.objects.filter(user=user).first()
                    cart_serializer = CartSerializer(cartTotal)

                    return Response({ 
                        'cart':cart_serializer.data,
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
                    cartTotal = Cart.objects.filter(user=user).first()
                    cart_serializer = CartSerializer(cartTotal)
                    return Response({ 
                        'cart':cart_serializer.data,
                        'token':token.key,
                        'user':user_serializer.data,
                        'message': 'Inicio correcto'
                        }, status= status.HTTP_201_CREATED)
            else:
                return Response({'message': 'El usuario no puede iniciar Sesion'}, status= status.HTTP_401_UNAUTHORIZED)
        else:
            return Response({'message': 'El usuario y password incorrectos'}, status= status.HTTP_400_BAD_REQUEST)

class Logout(APIView):
    def get(self, request, *args, **kwargs):
        token = request.GET.get('token')

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

