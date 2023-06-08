import 'package:batta/model/model_login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class ChangeNickScreen extends StatefulWidget {
  const ChangeNickScreen({
    super.key,
    required this.nickname,
  });

  final String nickname;

  @override
  State<ChangeNickScreen> createState() => _ChangeNickScreenState();
}

class _ChangeNickScreenState extends State<ChangeNickScreen> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    String username = Provider.of<LoginModel>(context).getUsername();
    String nickname = widget.nickname;

    changeNick() async {
      final url = Uri.parse("http://10.0.2.2:8000/batta/changenick/");
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: <String, String>{
          "username": username,
          "nickname": nickname,
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
          title: const Text('닉네임 변경'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.1,
                vertical: height * 0.05,
              ),
              child: TextField(
                controller: TextEditingController(text: nickname),
                decoration: const InputDecoration(
                  labelText: '닉네임',
                ),
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  nickname = value;
                },
              ),
            ),
            ButtonTheme(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 13, 32, 101),
                  minimumSize: Size(
                    width * 0.3,
                    height * 0.05,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  changeNick().whenComplete(() {
                    Navigator.of(context).pop();
                  });
                },
                child: const Text(
                  '닉네임 변경',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
