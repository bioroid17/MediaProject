import 'package:flutter/material.dart';

class ChangeEmailScreen extends StatefulWidget {
  const ChangeEmailScreen({super.key});

  @override
  State<ChangeEmailScreen> createState() => _ChangeEmailScreenState();
}

class _ChangeEmailScreenState extends State<ChangeEmailScreen> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 13, 32, 101),
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
                  labelText: '이메일',
                ),
                keyboardType: TextInputType.text,
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
                onPressed: () {},
                child: const Text(
                  '이메일 변경',
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
