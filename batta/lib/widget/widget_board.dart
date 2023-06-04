import 'package:batta/screen/screen_boarddetail.dart';
import 'package:flutter/material.dart';

class Board extends StatelessWidget {
  final String boardType, title, content, username, writeDate, modifyDate;
  final String? profImage;
  final int boardNum;

  const Board({
    super.key,
    required this.boardNum,
    required this.boardType,
    required this.title,
    required this.content,
    required this.username,
    required this.writeDate,
    required this.modifyDate,
    this.profImage,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BoardDetailScreen(
              boardNum: boardNum,
              boardType: boardType,
              title: title,
              content: content,
              username: username,
              modifyDate: modifyDate,
              profImage: profImage,
            ),
          ),
        );
      },
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.person,
                      ),
                      Text(username),
                    ],
                  ),
                  Text(modifyDate),
                ],
              ),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                content,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
