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
  String zonecode = "";
  String address = "";
  String detailAddress = "";

  // 선택: 프로필 사진, 전화번호, 이메일
  String? phone = "010";
  String? email;

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
                              labelText: '아이디(필수)',
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
                          labelText: '비밀번호(필수)',
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
                          labelText: '비밀번호 확인(필수)',
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
                              labelText: '닉네임(필수)',
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
                    Row(
                      children: [
                        SizedBox(
                          width: width * 0.32,
                          child: TextField(
                            decoration: const InputDecoration(
                              labelText: '우편번호(필수)',
                            ),
                            keyboardType: TextInputType.text,
                            readOnly: true,
                            onChanged: (value) {
                              setState(() {
                                zonecode = value;
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
                                  title: const Text("우편번호 찾기"),
                                  content: const SingleChildScrollView(
                                    child: ListBody(
                                      children: [
                                        Text("아직 구현되지 않음"),
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
                          child: const Text(
                            "우편번호 찾기",
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: height * 0.02,
                      ),
                      child: TextField(
                        decoration: const InputDecoration(
                          labelText: '주소(필수)',
                          hintText: "우편번호 찾기 버튼으로 주소 찾기",
                        ),
                        keyboardType: TextInputType.text,
                        readOnly: true,
                        onChanged: (value) {
                          setState(() {
                            address = value;
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
                          labelText: '상세주소(필수)',
                        ),
                        keyboardType: TextInputType.text,
                        onChanged: (value) {
                          setState(() {
                            detailAddress = value;
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
                          labelText: '이메일',
                        ),
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) {
                          setState(() {
                            email = value;
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
                          labelText: '전화번호',
                        ),
                        keyboardType: TextInputType.phone,
                        onChanged: (value) {
                          setState(() {
                            phone = value;
                          });
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: height * 0.02),
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
