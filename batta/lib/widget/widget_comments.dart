import 'package:flutter/material.dart';

class Comments extends StatelessWidget {
  final String content, username, writeDate, modifyDate;
  final int boardNum, commentNum;
  final String? profImage;

  const Comments({
    super.key,
    required this.boardNum,
    required this.commentNum,
    required this.content,
    required this.username,
    required this.writeDate,
    required this.modifyDate,
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
                    Text(modifyDate),
                  ],
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: height * 0.01,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.02),
          child: Text(content),
        ),
        const Divider(
          thickness: 0.5,
          height: 20,
          color: Color.fromARGB(255, 13, 32, 101),
        ),
      ],
    );
  }
}
