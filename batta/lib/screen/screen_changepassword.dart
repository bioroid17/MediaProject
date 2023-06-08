import 'package:batta/model/model_login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  String password = "";
  String newPassword = "";
  String newPasswordCheck = "";
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    String username = Provider.of<LoginModel>(context).getUsername();
    int result = 0;

    changePassword() async {
      final url = Uri.parse("http://10.0.2.2:8000/batta/changepassword/");
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: <String, String>{
          "username": username,
          "password": password,
          "newPassword": newPassword,
        },
      );
      if (response.statusCode == 200) {
        result = int.parse(response.body);
      } else {
        throw Exception(response.statusCode.toString());
      }
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 13, 32, 101),
          title: const Text('비밀번호 변경'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.1,
                vertical: height * 0.02,
              ),
              child: TextField(
                decoration: const InputDecoration(
                  labelText: '현재 비밀번호',
                ),
                keyboardType: TextInputType.text,
                obscureText: true,
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.1,
                vertical: height * 0.02,
              ),
              child: TextField(
                decoration: const InputDecoration(
                  labelText: '새 비밀번호',
                ),
                keyboardType: TextInputType.text,
                obscureText: true,
                onChanged: (value) {
                  setState(() {
                    newPassword = value;
                  });
                },
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.1,
                vertical: height * 0.02,
              ),
              child: TextField(
                decoration: const InputDecoration(
                  labelText: '새 비밀번호 확인',
                ),
                keyboardType: TextInputType.text,
                obscureText: true,
                onChanged: (value) {
                  setState(() {
                    newPasswordCheck = value;
                  });
                },
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
                onPressed: () {
                  if (password.isEmpty) {
                    showDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("비밀번호 오류"),
                          content: const SingleChildScrollView(
                            child: ListBody(
                              children: [
                                Text("비밀번호를 입력해주세요."),
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
                  } else if (newPassword.isEmpty) {
                    showDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("새 비밀번호 오류"),
                          content: const SingleChildScrollView(
                            child: ListBody(
                              children: [
                                Text("새 비밀번호를 입력해주세요."),
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
                  } else if (newPasswordCheck.isEmpty) {
                    showDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("새 비밀번호 확인 오류"),
                          content: const SingleChildScrollView(
                            child: ListBody(
                              children: [
                                Text("새 비밀번호 확인란을 입력해주세요."),
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
                  } else if (newPassword != newPasswordCheck) {
                    showDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("새 비밀번호 오류"),
                          content: const SingleChildScrollView(
                            child: ListBody(
                              children: [
                                Text("새 비밀번호와 확인란의 내용이 다릅니다."),
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
                    changePassword().whenComplete(() {
                      if (result == 0) {
                        showDialog(
                          context: context,
                          barrierDismissible: true,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text("비밀번호 오류"),
                              content: const SingleChildScrollView(
                                child: ListBody(
                                  children: [
                                    Text("비밀번호가 다릅니다."),
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
                      } else if (result == 1) {
                        Navigator.of(context).pop();
                      }
                    });
                  }
                },
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
