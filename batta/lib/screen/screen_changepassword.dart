import 'package:flutter/material.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
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
                  labelText: '비밀번호',
                ),
                keyboardType: TextInputType.text,
                obscureText: true,
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
                  '비밀번호 변경',
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
