from rest_framework import serializers
from apirest.models import  Role, User
from rest_framework import serializers
from rest_framework.authtoken.models import Token

#Serializer Rol
class RoleSerializer(serializers.ModelSerializer):
    class Meta:
        model = Role
        fields = '__all__'

#Serializer users
class UserSerializer(serializers.ModelSerializer):
    role = RoleSerializer(many=False, read_only=True)
    class Meta:
        model = User
        exclude = [
            'password',
            'user_permissions',
            'groups',
            'is_superuser',
            'is_staff',
        ]

#Serializer user login
class UserTokenSerializer(serializers.ModelSerializer):
    role = RoleSerializer(many=False, read_only=True)
    class Meta:
        model = User
        fields = ('id','username', 'email', 'first_name','role')
