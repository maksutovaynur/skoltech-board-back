"""backend URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.0/topics/http/urls/
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
from django.urls import path, include
from board import views as V

from django.views.decorators.csrf import csrf_exempt


urlpatterns = [
    path('api/admin/', admin.site.urls, name='admin'),
    path('api/auth/', include('rest_framework.urls'), name='auth'),
    path('api/login/', csrf_exempt(V.LoginView.as_view())),
    path('api/logout/', csrf_exempt(V.LogoutView.as_view())),
    path('api/telegram_chat_update/', csrf_exempt(V.RefreshTelegramChannelId.as_view())),
    path('api/', include('board.urls'), name='board'),
]
