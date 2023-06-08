import 'package:batta/model/model_login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

enum BoardType {
  free("자유게시판", "free"),
  circle("모임게시판", "circle");

  final String korString;
  final String engType;
  const BoardType(this.korString, this.engType);
}

class WriteBoardScreen extends StatefulWidget {
  const WriteBoardScreen({super.key});

  @override
  State<WriteBoardScreen> createState() => _WriteBoardScreenState();
}

class _WriteBoardScreenState extends State<WriteBoardScreen> {
  final List<BoardType> boards = [BoardType.free, BoardType.circle];
  BoardType chosenValue = BoardType.free;
  String chosenType = BoardType.free.engType;

  String title = "";
  String content = "";

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    String username = Provider.of<LoginModel>(context).getUsername();

    doWriteBoard() async {
      final url = Uri.parse("http://10.0.2.2:8000/batta/writeboard/");
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: <String, String>{
          "username": username,
          "boardType": chosenType,
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
          title: const Text('글 쓰기'),
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
                DropdownButton(
                  isExpanded: true,
                  value: chosenValue,
                  items: boards.map(
                    (BoardType value) {
                      return DropdownMenuItem<BoardType>(
                        value: value,
                        child: Text(value.korString),
                      );
                    },
                  ).toList(),
                  onChanged: (value) {
                    setState(() {
                      chosenValue = value!;
                      chosenType = value.engType;
                    });
                  },
                ),
                TextField(
                  controller: TextEditingController(text: title),
                  decoration: const InputDecoration(
                    labelText: '글 제목',
                  ),
                  maxLines: null,
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    title = value;
                  },
                ),
                TextField(
                  controller: TextEditingController(text: content),
                  decoration: const InputDecoration(
                    labelText: '글 내용',
                  ),
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
                doWriteBoard().whenComplete(() {
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
