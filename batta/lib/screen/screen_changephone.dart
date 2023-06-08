import 'package:batta/model/model_login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class ChangePhoneScreen extends StatefulWidget {
  const ChangePhoneScreen({
    super.key,
    required this.phone,
  });
  final String phone;

  @override
  State<ChangePhoneScreen> createState() => _ChangePhoneScreenState();
}

class _ChangePhoneScreenState extends State<ChangePhoneScreen> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    String username = Provider.of<LoginModel>(context).getUsername();
    String phone = widget.phone;

    changePhone() async {
      final url = Uri.parse("http://10.0.2.2:8000/batta/changephone/");
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: <String, String>{
          "username": username,
          "phone": phone,
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
          title: const Text('전화번호 변경'),
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
                controller: TextEditingController(text: phone),
                decoration: const InputDecoration(
                  labelText: '전화번호',
                ),
                keyboardType: TextInputType.phone,
                onChanged: (value) {
                  phone = value;
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
                  changePhone().whenComplete(() {
                    Navigator.of(context).pop();
                  });
                },
                child: const Text(
                  '전화번호 변경',
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
