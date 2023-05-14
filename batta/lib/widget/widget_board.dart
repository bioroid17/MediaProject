import 'package:batta/screen/screen_boarddetail.dart';
import 'package:flutter/material.dart';

class Board extends StatelessWidget {
  final String boardNum, type, title, content, username, datetime;
  final String? profImage;

  const Board({
    super.key,
    required this.boardNum,
    required this.type,
    required this.title,
    required this.content,
    required this.username,
    required this.datetime,
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
              type: type,
              title: title,
              content: content,
              username: username,
              datetime: datetime,
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
                  Text(datetime),
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
