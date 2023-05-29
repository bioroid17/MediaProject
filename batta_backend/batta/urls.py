from django.urls.conf import path
from .views import register

urlpatterns = [
    path("register/", register),
]