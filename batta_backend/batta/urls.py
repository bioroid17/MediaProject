from django.urls.conf import path
from .views import register, login, writeboard, writecomment

urlpatterns = [
    path("register/", register),
    path("login/", login),
    path("writeboard/", writeboard),
    path("writecomment/", writecomment),
]