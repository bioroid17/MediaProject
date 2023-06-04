import 'package:batta/widget/widget_comments.dart';
import 'package:flutter/material.dart';

class BoardDetailScreen extends StatefulWidget {
  final String boardNum, type, title, content, username, datetime;
  final String? profImage;
  const BoardDetailScreen({
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
  State<BoardDetailScreen> createState() => _BoardDetailScreenState();
}

class _BoardDetailScreenState extends State<BoardDetailScreen> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 13, 32, 101),
          title: Text(widget.title),
          centerTitle: true,
        ),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            vertical: height * 0.02,
            horizontal: width * 0.04,
          ),
          child: Center(
            child: Column(
              children: [
                Column(
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
                                Text(widget.username),
                                Text(widget.datetime),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Text(
                      widget.title,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(widget.content),
                  ],
                ),
                // ListView.separated(
                //   scrollDirection: Axis.vertical,
                //   itemBuilder: (context, index) {
                // return Comments(
                //   boardNum: widget.boardNum,
                //   commentNum: '$index',
                //   content: "댓글 $index",
                //   username: "익명",
                //   datetime: "2023-05-15 02:45",
                //   profImage: "asdf",
                // );
                //   },
                //   separatorBuilder: (context, index) => const Divider(
                //     thickness: 2,
                //     height: 20,
                //     color: Color(0xFF0D2065),
                //   ),
                //   itemCount: 5,
                // ),
                Column(
                  children: [
                    const Divider(
                      color: Colors.grey,
                      thickness: 0.5,
                    ),
                    Comments(
                      boardNum: widget.boardNum,
                      commentNum: '1',
                      content: "댓글 1",
                      username: "익명",
                      datetime: "2023-05-15 02:45",
                      profImage: "asdf",
                    ),
                    const Divider(
                      color: Colors.grey,
                      thickness: 0.5,
                    ),
                    Comments(
                      boardNum: widget.boardNum,
                      commentNum: '2',
                      content: "댓글 2",
                      username: "익명",
                      datetime: "2023-05-15 02:45",
                      profImage: "asdf",
                    ),
                    const Divider(
                      color: Colors.grey,
                      thickness: 0.5,
                    ),
                    Comments(
                      boardNum: widget.boardNum,
                      commentNum: '3',
                      content: "댓글 3",
                      username: "익명",
                      datetime: "2023-05-15 02:45",
                      profImage: "asdf",
                    ),
                    const Divider(
                      color: Colors.grey,
                      thickness: 0.5,
                    ),
                    Comments(
                      boardNum: widget.boardNum,
                      commentNum: '4',
                      content: "댓글 4",
                      username: "익명",
                      datetime: "2023-05-15 02:45",
                      profImage: "asdf",
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
