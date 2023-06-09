import 'package:batta/model/model_login.dart';
import 'package:batta/screen/screen_modifycomment.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

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
    String writer = Provider.of<LoginModel>(context).getUsername();
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
                SizedBox(
                  width: width * 0.20,
                ),
                if (writer == username)
                  PopupMenuButton(
                    itemBuilder: (context) => [
                      const PopupMenuItem(
                        value: 0,
                        child: Text("댓글 수정"),
                      ),
                      const PopupMenuItem(
                        value: 1,
                        child: Text("댓글 삭제"),
                      ),
                    ],
                    onSelected: ((value) {
                      if (value == 0) {
                        // 글 수정
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ModifyCommentScreen(
                              commentNum: commentNum,
                              content: content,
                            ),
                          ),
                        );
                      } else if (value == 1) {
                        // 글 삭제
                        showDialog(
                          context: context,
                          barrierDismissible: true,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text("작성한 댓글 삭제"),
                              content: const SingleChildScrollView(
                                child: ListBody(
                                  children: [
                                    Text("댓글을 삭제하시겠습니까?"),
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    doDeleteComment().whenComplete(() {
                                      Navigator.of(context).pop();
                                    });
                                  },
                                  child: const Text("확인"),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text("취소"),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    }),
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

  doDeleteComment() async {
    final url = Uri.parse("http://10.0.2.2:8000/batta/deletecomment/");
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: <String, String>{
        "commentNum": commentNum.toString(),
      },
    );
    if (response.statusCode == 200) {
    } else {
      throw Exception(response.statusCode.toString());
    }
  }
}
