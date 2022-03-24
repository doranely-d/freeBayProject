"""freebayDjango URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from rest_framework_simplejwt import views as jwt_views
from apirest import views
from apirest.views import cart_item_view, cart_total_view, product_view

urlpatterns = [
    path('user', views.user.as_view()),
    path('register', views.register.as_view()),
    path('login', views.login.as_view(), name='login'),
    path('logout', views.Logout.as_view(), name='logout'),
    path('product/', product_view, name='product'),
    path('cartTotal/', cart_total_view, name='cartTotal'),
    path('cartItem/', cart_item_view, name='cartItem'),
    path('admin/', admin.site.urls),
    path('api/token/', jwt_views.TokenObtainPairView.as_view(), name='token_obtain_pair'),
    path('api/token/refresh/', jwt_views.TokenRefreshView.as_view(), name='token_refresh'),
]