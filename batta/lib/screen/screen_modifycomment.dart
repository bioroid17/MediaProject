import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ModifyCommentScreen extends StatefulWidget {
  const ModifyCommentScreen({
    super.key,
    required this.commentNum,
    required this.content,
  });

  final int commentNum;
  final String content;
  @override
  State<ModifyCommentScreen> createState() => _ModifyCommentScreenState();
}

class _ModifyCommentScreenState extends State<ModifyCommentScreen> {
  String content = "";

  @override
  initState() {
    super.initState();
    content = widget.content;
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    doModifyComment() async {
      final url = Uri.parse("http://10.0.2.2:8000/batta/modifycomment/");
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: <String, String>{
          "commentNum": widget.commentNum.toString(),
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
          title: const Text('댓글 수정'),
          centerTitle: true,
          shadowColor: Colors.grey,
        ),
        body: Container(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.05,
            vertical: height * 0.02,
          ),
          child: TextField(
            decoration: const InputDecoration(
              labelText: '댓글 내용',
            ),
            controller: TextEditingController(text: content),
            maxLines: null,
            keyboardType: TextInputType.text,
            onChanged: (value) {
              content = value;
            },
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              if (content.isEmpty) {
                showDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text("글쓰기 오류"),
                      content: const SingleChildScrollView(
                        child: ListBody(
                          children: [
                            Text("댓글을 작성해 주세요"),
                          ],
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text("확인"),
                        ),
                      ],
                    );
                  },
                );
              } else {
                doModifyComment().whenComplete(() {
                  Navigator.of(context).pop();
                });
              }
            },
            label: const Text("작성 완료"),
            backgroundColor: const Color.fromARGB(255, 13, 32, 101)),
      ),
    );
  }
}
