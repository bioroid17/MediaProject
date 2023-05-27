import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // 필수: 아이디, 비번, 닉네임, 주소
  String username = "";
  bool usernameCheck = false;
  String password = "";
  String passwordCheck = "";
  String nickname = "";
  bool nicknameCheck = false;
  String address = "";
  String detailAdress = "";

  // 선택: 프로필 사진, 전화번호, 이메일
  String? phone1;
  String? phone2;
  String? phone3;
  String? email1;
  String? email2;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('BATTA 회원가입'),
          centerTitle: true,
        ),
        backgroundColor: const Color(0xFFEFECE5),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: height * 0.1),
              padding: EdgeInsets.symmetric(
                vertical: height * 0.03,
                horizontal: width * 0.1,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xFF0D2065),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              width: width * 0.85,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      '회원가입',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: width * 0.38,
                          child: TextField(
                            decoration: const InputDecoration(
                              labelText: '아이디(필수 입력)',
                            ),
                            keyboardType: TextInputType.text,
                            maxLength: 16,
                            onChanged: (value) {
                              setState(() {
                                username = value;
                                usernameCheck = false;
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          width: width * 0.05,
                        ),
                        OutlinedButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              barrierDismissible: true,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text("중복 확인"),
                                  content: const SingleChildScrollView(
                                    child: ListBody(
                                      children: [
                                        Text("아이디가 중복입니다."),
                                      ],
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        setState(() {
                                          usernameCheck = true;
                                        });
                                      },
                                      child: const Text("확인"),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: const Text("중복 확인"),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: height * 0.02,
                      ),
                      child: TextField(
                        decoration: const InputDecoration(
                          labelText: '비밀번호(필수 입력)',
                        ),
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        maxLength: 20,
                        onChanged: (value) {
                          setState(() {
                            password = value;
                          });
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: height * 0.02,
                      ),
                      child: TextField(
                        decoration: const InputDecoration(
                          labelText: '비밀번호 확인(필수 입력)',
                        ),
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        maxLength: 20,
                        onChanged: (value) {
                          setState(() {
                            passwordCheck = value;
                          });
                        },
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: width * 0.38,
                          child: TextField(
                            decoration: const InputDecoration(
                              labelText: '닉네임(필수 입력)',
                            ),
                            keyboardType: TextInputType.text,
                            maxLength: 16,
                            onChanged: (value) {
                              setState(() {
                                nickname = value;
                                nicknameCheck = false;
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          width: width * 0.05,
                        ),
                        OutlinedButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              barrierDismissible: true,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text("중복 확인"),
                                  content: const SingleChildScrollView(
                                    child: ListBody(
                                      children: [
                                        Text("닉네임이 중복입니다."),
                                      ],
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        setState(() {
                                          usernameCheck = true;
                                        });
                                      },
                                      child: const Text("확인"),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: const Text("중복 확인"),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: height * 0.01),
                      child: ButtonTheme(
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const RegisterScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            '회원가입',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
