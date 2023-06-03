import 'package:batta/model/model_login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

  String username = "";
  String title = "";
  String content = "";

  @override
  Widget build(BuildContext context) {
    doWrite() {}
    username = Provider.of<LoginModel>(context).getUsername();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('글 쓰기'),
          centerTitle: true,
        ),
        body: Column(
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
              decoration: const InputDecoration(
                labelText: '글 제목',
              ),
              maxLines: null,
              keyboardType: TextInputType.text,
              onChanged: (value) {
                setState(() {
                  title = value;
                });
              },
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: '글 내용',
              ),
              maxLines: null,
              keyboardType: TextInputType.text,
              onChanged: (value) {
                setState(() {
                  content = value;
                });
              },
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.of(context).pop();
          },
          label: const Text("작성 완료"),
        ),
      ),
    );
  }
}
