import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ModifyBoardScreen extends StatefulWidget {
  const ModifyBoardScreen({
    super.key,
    required this.boardNum,
    required this.title,
    required this.content,
  });

  final int boardNum;
  final String title, content;

  @override
  State<ModifyBoardScreen> createState() => _ModifyBoardScreenState();
}

class _ModifyBoardScreenState extends State<ModifyBoardScreen> {
  String title = "";
  String content = "";

  @override
  initState() {
    super.initState();
    title = widget.title;
    content = widget.content;
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    doModifyBoard() async {
      final url = Uri.parse("http://10.0.2.2:8000/batta/modifyboard/");
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: <String, String>{
          "boardNum": widget.boardNum.toString(),
          "title": title,
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
          title: const Text('글 수정'),
          centerTitle: true,
          shadowColor: Colors.grey,
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.05,
              vertical: height * 0.02,
            ),
            child: Column(
              children: [
                TextField(
                  decoration: const InputDecoration(
                    labelText: '글 제목',
                  ),
                  controller: TextEditingController(text: title),
                  maxLines: null,
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    title = value;
                  },
                ),
                TextField(
                  decoration: const InputDecoration(
                    labelText: '글 내용',
                  ),
                  controller: TextEditingController(text: content),
                  maxLines: null,
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    content = value;
                  },
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              if (title.isEmpty) {
                showDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text("글쓰기 오류"),
                      content: const SingleChildScrollView(
                        child: ListBody(
                          children: [
                            Text("제목을 작성해 주세요"),
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
              } else if (content.isEmpty) {
                showDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text("글쓰기 오류"),
                      content: const SingleChildScrollView(
                        child: ListBody(
                          children: [
                            Text("내용을 작성해 주세요"),
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
                doModifyBoard().whenComplete(() {
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
