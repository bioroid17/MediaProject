from rest_framework.response import Response
from rest_framework.decorators import api_view
from .models import Member, Board, Comment
from .serializers import MemberSerializer, BoardSerializer, CommentSerializer
from django.views.decorators.csrf import csrf_exempt
from django.core.exceptions import ObjectDoesNotExist

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
    username = request.POST["username"],
    boardNum = request.POST["boardNum"],
    dto = Comment(
        username = Member.objects.get(username=username),
        boardNum = Board.objects.get(boardNum=boardNum),
        content = request.POST["content"],
    )
    dto.save()
    return Response()