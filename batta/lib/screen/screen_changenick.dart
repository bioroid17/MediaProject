import 'package:flutter/material.dart';

class ChangeNickScreen extends StatefulWidget {
  const ChangeNickScreen({super.key});

  @override
  State<ChangeNickScreen> createState() => _ChangeNickScreenState();
}

class _ChangeNickScreenState extends State<ChangeNickScreen> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('이메일 변경'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.1,
                vertical: height * 0.05,
              ),
              child: const TextField(
                decoration: InputDecoration(
                  labelText: '닉네임',
                ),
                keyboardType: TextInputType.text,
              ),
            ),
            ButtonTheme(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0D2065),
                  minimumSize: Size(
                    width * 0.3,
                    height * 0.05,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {},
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
