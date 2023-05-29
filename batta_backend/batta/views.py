from rest_framework.response import Response
from rest_framework.decorators import api_view
from .models import Member, Board, Comment
from .serializers import MemberSerializer, BoardSerializer, CommentSerializer
from django.views.decorators.csrf import csrf_exempt

# Create your views here.
@api_view(["POST"])
def registerMember(request):
    dto = Member(
        username=request.POST.get('username'),
        password=request.POST.get('password'),
        nickname=request.POST.get('nickname'),
        zonecode=request.POST.get('zonecode'),
        address=request.POST.get('address'),
        detailAddress=request.POST.get('detailAddress'),
        email=request.POST.get('email'),
        phone=request.POST.get('phone'),
    )
    dto.save()
    return Response(True)