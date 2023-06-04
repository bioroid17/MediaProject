import 'dart:convert';

import 'package:batta/model/model_comments.dart';
import 'package:batta/model/model_login.dart';
import 'package:batta/widget/widget_comments.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class BoardDetailScreen extends StatefulWidget {
  final String boardType, title, content, username, modifyDate;
  final String? profImage;
  final int boardNum;
  const BoardDetailScreen({
    super.key,
    required this.boardNum,
    required this.boardType,
    required this.title,
    required this.content,
    required this.username,
    required this.modifyDate,
    this.profImage,
  });

  @override
  State<BoardDetailScreen> createState() => _BoardDetailScreenState();
}

class _BoardDetailScreenState extends State<BoardDetailScreen> {
  String content = "";

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    String writer = Provider.of<LoginModel>(context).getUsername();

    Future<List<CommentsModel>> comments = getComments();

    doWriteComment() async {
      final url = Uri.parse("http://10.0.2.2:8000/batta/writecomment/");
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: <String, String>{
          "boardNum": widget.boardNum.toString(),
          "username": writer,
          "content": content,
        },
      );
      if (response.statusCode == 200) {
      } else {
        throw Exception(response.statusCode.toString());
      }
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 13, 32, 101),
          title: Text(widget.title),
          centerTitle: true,
        ),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  width: width * 0.94,
                  child: Column(
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
                                  Text(widget.modifyDate),
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
                ),
                const Divider(
                  thickness: 0.5,
                  height: 20,
                  color: Color.fromARGB(255, 13, 32, 101),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.02,
                    vertical: height * 0.004,
                  ),
                  child: Row(
                    children: <Widget>[
                      Flexible(
                        child: TextField(
                          decoration: const InputDecoration.collapsed(
                            hintText: "댓글을 입력하세요.",
                          ),
                          controller: TextEditingController(text: content),
                          onChanged: (value) {
                            setState(() {
                              content = value;
                            });
                          },
                          maxLines: null,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: IconButton(
                            icon: const Icon(Icons.send),
                            onPressed: () {
                              doWriteComment().whenComplete(() {
                                setState(() {
                                  content = "";
                                });
                              });
                            }),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.02,
                    vertical: height * 0.004,
                  ),
                  child: const Divider(
                    thickness: 0.5,
                    height: 20,
                    color: Color.fromARGB(255, 13, 32, 101),
                  ),
                ),
                FutureBuilder(
                  future: comments,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        children: [
                          for (var comment in snapshot.data!)
                            Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: height * 0.01,
                                horizontal: width * 0.03,
                              ),
                              child: Comments(
                                boardNum: widget.boardNum,
                                commentNum: comment.commentNum,
                                content: comment.content,
                                username: comment.username,
                                writeDate: comment.writeDate,
                                modifyDate: comment.modifyDate,
                              ),
                            ),
                        ],
                      );
                    }
                    return const Center(
                      // 로딩 동그라미 그려주는 위젯
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<List<CommentsModel>> getComments() async {
    List<CommentsModel> commentList = [];
    final url = Uri.parse(
        "http://10.0.2.2:8000/batta/getcomments?boardNum=${widget.boardNum}");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> comments = jsonDecode(response.body);
      for (var comment in comments) {
        commentList.add(CommentsModel.fromJson(comment));
      }
      return commentList;
    } else {
      throw Exception(response.statusCode.toString());
    }
  }
}
