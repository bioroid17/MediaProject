from django.urls.conf import path
from . import views

urlpatterns = [
    path("register/", views.register),
    path("login/", views.login),
    path("writeboard/", views.writeboard),
    path("writecomment/", views.writecomment),
    path("getmember", views.getmember),
    path("getboards", views.getboards),
    path("getcomments", views.getcomments),
    path("modifyboard/", views.modifyboard),
    path("deleteboard/", views.deleteboard),
    path("modifycomment/", views.modifycomment),
    path("deletecomment/", views.deletecomment),
    path("getemail", views.getemail),
    path("getnick", views.getnick),
    path("changepassword/", views.changepassword),
    path("changeemail/", views.changeemail),
    path("changenick/", views.changenick),
    path("changephone/", views.changephone),
]