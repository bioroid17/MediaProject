from django.urls.conf import path
from .views import register, login

urlpatterns = [
    path("register/", register),
    path("login/", login),
]