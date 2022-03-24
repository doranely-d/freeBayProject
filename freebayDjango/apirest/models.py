from django.db import models
from django.contrib.auth.models import AbstractUser

#Modelo Rol
class Role(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=250)
    created_at = models.DateField(auto_now_add=True)
    modified_at = models.DateField()

#Modelo User
class User(AbstractUser):
    GENDER_CHOICES = (
        ('Mujer', 'Mujer'),
        ('Hombre', 'Hombre'),
    )
    id = models.AutoField(primary_key=True)
    role = models.ForeignKey(Role, on_delete=models.CASCADE)
    first_name = models.CharField(max_length=250)
    last_name = models.CharField(max_length=250)
    email = models.EmailField(max_length=250,unique=True)
    age = models.DateField(null=True)
    password = models.CharField(max_length=250, unique=True)
    gender = models.CharField(max_length=250, choices=GENDER_CHOICES)
    created_at = models.DateField(auto_now_add=True)
    modified_at = models.DateField(null=True)
    is_active = models.BooleanField(default=True)
    
