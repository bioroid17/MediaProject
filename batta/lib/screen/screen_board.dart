import 'dart:convert';

import 'package:batta/model/model_board.dart';
import 'package:batta/widget/widget_board.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BoardScreen extends StatelessWidget {
  final String boardType;

  const BoardScreen({
    super.key,
    required this.boardType,
  });

  Future<List<BoardModel>> getBoards() async {
    List<BoardModel> boardList = [];
    final url =
        Uri.parse("http://10.0.2.2:8000/batta/getboards?boardType=$boardType");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> boards = jsonDecode(response.body);
      for (var board in boards) {
        boardList.add(BoardModel.fromJson(board));
      }
      return boardList;
    } else {
      throw Exception(response.statusCode.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    Future<List<BoardModel>> boards = getBoards();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return Board(
              boardNum: "$index",
              type: boardType,
              title: "$boardType title${index + 1}",
              content:
                  "글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용",
              username: "익명",
              datetime: "2023-05-15 00:00",
              profImage: "ㅁㄴㅇㄹ",
            );
          },
          separatorBuilder: (context, index) => const Divider(
            thickness: 1.8,
            height: 20,
            color: Color.fromARGB(255, 13, 32, 101),
          ),
          itemCount: 30,
        ),
      ),
    );
  }
}
