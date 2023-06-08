import 'dart:convert';

import 'package:batta/model/model_login.dart';
import 'package:batta/screen/screen_changeemail.dart';
import 'package:batta/screen/screen_changeimage.dart';
import 'package:batta/screen/screen_changenick.dart';
import 'package:batta/screen/screen_changepassword.dart';
import 'package:batta/screen/screen_changephone.dart';
import 'package:batta/screen/screen_deleteaccount.dart';
import 'package:batta/screen/screen_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  static const storage = FlutterSecureStorage();
  late String email, nickname, phone;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    String username = Provider.of<LoginModel>(context).getUsername();
    // String? profile;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 13, 32, 101),
          title: const Text('설정'),
          centerTitle: true,
        ),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xFF0D2065),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: width * 0.85,
                  margin: EdgeInsets.only(top: height * 0.07),
                  padding: EdgeInsets.symmetric(
                    vertical: height * 0.03,
                    horizontal: width * 0.03,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "계정",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const ChangePasswordScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          "비밀번호 변경",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      GestureDetector(
                        onTap: () {
                          getEmail(username).whenComplete(() {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChangeEmailScreen(
                                  email: email,
                                ),
                              ),
                            );
                          });
                        },
                        child: const Text(
                          "이메일 변경",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      GestureDetector(
                        onTap: () {
                          getPhone(username).whenComplete(() {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChangePhoneScreen(
                                  phone: phone,
                                ),
                              ),
                            );
                          });
                        },
                        child: const Text(
                          "전화번호 변경",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xFF0D2065),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: width * 0.85,
                  margin: EdgeInsets.only(top: height * 0.07),
                  padding: EdgeInsets.symmetric(
                    vertical: height * 0.03,
                    horizontal: width * 0.03,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "커뮤니티",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      GestureDetector(
                        onTap: () {
                          getNick(username).whenComplete(() {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChangeNickScreen(
                                  nickname: nickname,
                                ),
                              ),
                            );
                          });
                        },
                        child: const Text(
                          "닉네임 변경",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            barrierDismissible: true,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text("프로필 사진 변경"),
                                content: const SingleChildScrollView(
                                  child: ListBody(
                                    children: [
                                      Text("프로필 사진을 변경/삭제할까요?"),
                                    ],
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const ChangeImageScreen(),
                                        ),
                                      );
                                    },
                                    child: const Text("변경"),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text("삭제"),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text("취소"),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: const Text(
                          "프로필 사진 변경",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const Text(
                          "푸시 알람 설정",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xFF0D2065),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: width * 0.85,
                  margin: EdgeInsets.symmetric(vertical: height * 0.07),
                  padding: EdgeInsets.symmetric(
                    vertical: height * 0.03,
                    horizontal: width * 0.03,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "기타",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      GestureDetector(
                        onTap: () {
                          storage.delete(key: "login");
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                            (route) => false,
                          );
                        },
                        child: const Text(
                          "로그아웃",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DeleteAccountScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          "회원 탈퇴",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> getEmail(String username) async {
    final url =
        Uri.parse("http://10.0.2.2:8000/batta/getemail?username=$username");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      email = jsonDecode(response.body)["email"];
    } else {
      throw Exception(response.statusCode.toString());
    }
  }

  Future<void> getNick(String username) async {
    final url =
        Uri.parse("http://10.0.2.2:8000/batta/getnick?username=$username");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      nickname = jsonDecode(response.body)["nickname"];
    } else {
      throw Exception(response.statusCode.toString());
    }
  }

  Future<void> getPhone(String username) async {
    final url =
        Uri.parse("http://10.0.2.2:8000/batta/getphone?username=$username");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      phone = jsonDecode(response.body)["phone"];
    } else {
      throw Exception(response.statusCode.toString());
    }
  }
}
