import 'dart:convert';

import 'package:batta/model/model_member.dart';
import 'package:http/http.dart' as http;

class BoardModel {
  final String boardType, title, content, username, writeDate, modifyDate;
  final int boardNum;

  MemberModel? member;

  BoardModel.fromJson(Map<String, dynamic> json)
      : boardType = json['boardType'],
        title = json['title'],
        boardNum = json['boardNum'],
        content = json['content'],
        username = json['username_id'],
        writeDate = json['writeDate'],
        modifyDate = json['modifyDate'];

  void getMember() async {
    final url =
        Uri.parse('http://10.0.2.2:8000/batta/getmember?username=$username');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      member = MemberModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(response.statusCode.toString());
    }
  }
}
