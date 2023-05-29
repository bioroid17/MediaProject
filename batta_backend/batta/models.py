from django.db import models

# Create your models here.
class Member(models.Model):
    username = models.CharField(max_length=16, verbose_name="아이디",primary_key=True)
    password = models.CharField(max_length=20, verbose_name="비밀번호", null=False)
    nickname = models.CharField(max_length=16, verbose_name="닉네임", null=False)
    zonecode = models.CharField(max_length=5, verbose_name="우편번호", null=False)
    address = models.TextField(verbose_name="주소", null=False)
    detailAddress = models.TextField(verbose_name="상세주소", null=False)
    email = models.TextField(verbose_name="이메일", null=True)
    phone = models.CharField(max_length=13, verbose_name="전화번호", null=True)
    registerDate = models.DateTimeField(auto_now_add=True, verbose_name="가입일", null=False, blank=True)
    modifyDate = models.DateTimeField(auto_now=True, verbose_name="최근 수정일", null=False, blank=True)

class Board(models.Model):
    boardNum = models.BigAutoField(verbose_name="글 번호", primary_key=True)
    username = models.ForeignKey("Member", on_delete=models.CASCADE, null=False, db_column="username")  # 작성자
    boardType = models.CharField(verbose_name="게시판 타입", null=False)
    content = models.TextField(null=False, verbose_name="글 내용")
    writeDate = models.DateTimeField(auto_now_add=True, verbose_name="작성일시", null=False, blank=True)
    modifyDate = models.DateTimeField(auto_now=True, verbose_name="최근 수정일시", null=False, blank=True)

class Comment(models.Model):
    commentNum = models.BigAutoField(verbose_name="댓글 번호", primary_key=True)
    boardNum = models.ForeignKey("Board", on_delete=models.CASCADE, null=False, db_column="boardNum")   # 글 번호
    username = models.ForeignKey("Member", on_delete=models.CASCADE, null=False, db_column="username")  # 작성자
    content = models.TextField(null=False, verbose_name="글 내용")
    writeDate = models.DateTimeField(auto_now_add=True, verbose_name="작성일시", null=False, blank=True)
    modifyDate = models.DateTimeField(auto_now=True, verbose_name="최근 수정일시", null=False, blank=True)
