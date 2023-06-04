import 'package:batta/widget/widget_board.dart';
import 'package:flutter/material.dart';

class BoardScreen extends StatelessWidget {
  final String type;

  const BoardScreen({
    super.key,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return Board(
              boardNum: "$index",
              type: type,
              title: "$type title${index + 1}",
              content:
                  "글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용",
              username: "익명",
              datetime: "2023-05-15 00:00",
              profImage: "ㅁㄴㅇㄹ",
            );
          },
          separatorBuilder: (context, index) => const Divider(
            thickness: 0.5,
            height: 20,
            color: Color.fromARGB(255, 13, 32, 101),
          ),
          itemCount: 30,
        ),
      ),
    );
  }
}
