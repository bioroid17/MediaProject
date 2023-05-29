from rest_framework import serializers
from .models import Member, Board, Comment

# 시리얼라이저 생성
# 시리얼라이저: 장고 모델 데이터를 JSON 타입으로 직렬화하는 코드
# 즉, 내 데이터를 JSON으로 바꿔주는 기계

class CommentSerializer(serializers.ModelSerializer):
    class Meta:
        model = Comment
        fields = ('commentNum', 'boardNum', 'username', 'content', 'writeDate', 'modifyDate')

class BoardSerializer(serializers.ModelSerializer):
    class Meta:
        model = Board
        fields = ('boardNum', 'username', 'boardType', 'content', 'writeDate', 'modifyDate')

class MemberSerializer(serializers.ModelSerializer):
    class Meta:
        model = Member
        fields = ('username', 'password', 'nickname', 'zonecode', 'address', 'detailAddress',
                  'email', 'phone', 'registerDate', 'modifyDate')