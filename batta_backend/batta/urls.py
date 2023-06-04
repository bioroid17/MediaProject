from django.urls.conf import path
from . import views

urlpatterns = [
    path("register/", views.register),
    path("login/", views.login),
    path("writeboard/", views.writeboard),
    path("writecomment/", views.writecomment),
    path("getboards", views.getboards),
    path("getcomments/", views.getcomments),
]