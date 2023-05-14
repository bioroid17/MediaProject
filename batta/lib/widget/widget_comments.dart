import 'package:flutter/material.dart';

class Comments extends StatelessWidget {
  final String boardNum, commentNum, content, username, datetime;
  final String? profImage;

  const Comments({
    super.key,
    required this.boardNum,
    required this.commentNum,
    required this.content,
    required this.username,
    required this.datetime,
    this.profImage,
  });

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.person,
                  size: 30,
                ),
                SizedBox(
                  width: width * 0.02,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(username),
                    Text(datetime),
                  ],
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: height * 0.01,
        ),
        Text(content),
      ],
    );
  }
}
