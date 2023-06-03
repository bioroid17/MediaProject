import 'package:flutter/material.dart';

import '../widget/widget_board.dart';

class NoticeScreen extends StatefulWidget {
  const NoticeScreen({super.key, required this.type});
  final String type;

  @override
  State<NoticeScreen> createState() => _NoticeScreenState();
}

class _NoticeScreenState extends State<NoticeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(8.0),
        color: const Color(0xFFEFECE5),
        child: ListView.separated(
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return Board(
              username: '운영자',
              boardNum: "$index",
              type: widget.type,
              title: "${widget.type} title${index + 1}",
              content: "[공지]asdf",
              datetime: "2023-05-21 00:00",
            );
          },
          separatorBuilder: (context, index) => const Divider(
            thickness: 1.8,
            height: 20,
            color: Color.fromARGB(255, 13, 32, 101),
          ),
          itemCount: 6,
        ),
      ),
    );
  }
}
