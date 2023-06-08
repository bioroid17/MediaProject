from rest_framework.response import Response
from rest_framework.decorators import api_view
from .models import Member, Board, Comment
from .serializers import MemberSerializer, BoardSerializer, CommentSerializer
from django.views.decorators.csrf import csrf_exempt
from django.core.exceptions import ObjectDoesNotExist
from django.core import serializers

import json

# Create your views here.
@api_view(["POST"])
@csrf_exempt
def register(request):
    dto = Member(
        username=request.POST.get('username'),
        password=request.POST.get('password'),
        nickname=request.POST.get('nickname'),
        zonecode=request.POST.get('zonecode'),
        address=request.POST.get('address'),
        profileImage=request.FILES.get('profileImage'),
        email=request.POST.get('email'),
        phone=request.POST.get('phone'),
    )
    dto.save()
    return Response()


@api_view(["POST"])
@csrf_exempt
def login(request):
    username = request.POST["username"]
    password = request.POST["password"]
    result = 0
    try:
        dto = Member.objects.get(username=username)
        if password == dto.password:
            # 아이디 존재, 비밀번호 일치
            result = 1
        else:
            # 아이디 존재, 비밀번호 불일치
            result = 0
    except ObjectDoesNotExist:
        # 아이디 없음
        result = -1
    return Response(result)


@api_view(["POST"])
@csrf_exempt
def writeboard(request):
    username = request.POST["username"]
    dto = Board(
        username = Member.objects.get(username=username),
        boardType = request.POST["boardType"],
        title = request.POST["title"],
        content = request.POST["content"],
    )
    dto.save()
    return Response()

@api_view(["POST"])
@csrf_exempt
def writecomment(request):
    username = request.POST["username"]
    boardNum = request.POST["boardNum"]
    content = request.POST["content"]
    dto = Comment(
        username = Member.objects.get(username=username),
        boardNum = Board.objects.get(boardNum=boardNum),
        content = content,
    )
    dto.save()
    return Response()

@api_view(["GET"])
def getmember(request):
    username = request.GET["username"]
    dto = Member.objects.filter(username=username)
    return Response(dto.values()[0], content_type=u"application/json; charset=utf-8")

@api_view(["GET"])
def getboards(request):
    boardType = request.GET["boardType"]
    dtos = Board.objects.filter(boardType=boardType).order_by("-boardNum")
    return Response(dtos.values(), content_type=u"application/json; charset=utf-8")

@api_view(["GET"])
def getcomments(request):
    boardNum = request.GET["boardNum"]
    dtos = Comment.objects.filter(boardNum=boardNum).order_by("-commentNum")
    return Response(dtos.values(), content_type=u"application/json; charset=utf-8")

@api_view(["POST"])
@csrf_exempt
def modifyboard(request):
    boardNum = request.POST["boardNum"]
    dto = Board.objects.get(boardNum=boardNum)
    dto.title = request.POST["title"]
    dto.content = request.POST["content"]
    dto.save()
    return Response()
    
@api_view(["POST"])
@csrf_exempt
def deleteboard(request):
    boardNum = request.POST["boardNum"]
    dto = Board.objects.get(boardNum=boardNum)
    dto.delete()
    return Response()
    
@api_view(["POST"])
@csrf_exempt
def modifycomment(request):
    commentNum = request.POST["commentNum"]
    dto = Comment.objects.get(commentNum=commentNum)
    dto.content = request.POST["content"]
    dto.save()
    return Response()
    
@api_view(["POST"])
@csrf_exempt
def deletecomment(request):
    commentNum = request.POST["commentNum"]
    dto = Comment.objects.get(commentNum=commentNum)
    dto.delete()
    return Response()

@api_view(["GET"])
def getemail(request):
    username = request.GET["username"]
    email = Member.objects.get(username=username).email
    return Response({"email":email})

@api_view(["GET"])
def getnick(request):
    username = request.GET["username"]
    nickname = Member.objects.get(username=username).nickname
    return Response({"nickname":nickname})

@api_view(["POST"])
@csrf_exempt
def changepassword(request):
    username = request.POST["username"]
    password = request.POST["password"]
    newPassword = request.POST["newPassword"]
    result = 0
    dto = Member.objects.get(username=username)
    if dto.password == password:
        result = 1
        dto.password = newPassword
        dto.save()
    else:
        result = 0
    return Response(result)

@api_view(["POST"])
@csrf_exempt
def changeemail(request):
    username = request.POST["username"]
    dto = Member.objects.get(username=username)
    dto.email = request.POST["email"]
    dto.save()
    return Response()
    
@api_view(["POST"])
@csrf_exempt
def changenick(request):
    username = request.POST["username"]
    dto = Member.objects.get(username=username)
    dto.nickname = request.POST["nickname"]
    dto.save()
    return Response()

@api_view(["POST"])
@csrf_exempt
def changephone(request):
    username = request.POST["username"]
    dto = Member.objects.get(username=username)
    dto.phone = request.POST["phone"]
    dto.save()
    return Response()