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
      for (var board in boardList) {
        board.getMember();
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
        child: FutureBuilder(
          future: boards,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.separated(
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  var board = snapshot.data![index];
                  return Board(
                    boardNum: board.boardNum,
                    boardType: board.boardType,
                    title: board.title,
                    content: board.content,
                    username: board.username,
                    writeDate: board.writeDate,
                    modifyDate: board.modifyDate,
                  );
                },
                separatorBuilder: (context, index) => const Divider(
                  thickness: 0.5,
                  height: 20,
                  color: Color.fromARGB(255, 13, 32, 101),
                ),
                itemCount: snapshot.data!.length,
              );
            }
            return const Center(
              // 로딩 동그라미 그려주는 위젯
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
