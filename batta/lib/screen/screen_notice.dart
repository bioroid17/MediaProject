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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 13, 32, 101),
          shadowColor: Colors.grey,
          title: const Text('알림'),
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.all(8.0),
          color: const Color.fromARGB(255, 255, 255, 255),
          child: ListView.separated(
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return Board(
                username: '운영자',
                boardNum: "$index",
                type: widget.type,
                title: "${widget.type} 공지 ${index + 1}",
                content: "[공지] BATTA입니다",
                datetime: "2023-06-01 00:00",
              );
            },
            separatorBuilder: (context, index) => const Divider(
              thickness: 1.8,
              height: 25,
              color: Colors.transparent,
            ),
            itemCount: 10,
          ),
        ),
      ),
    );
  }
}
