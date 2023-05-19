import 'package:batta/screen/screen_changeemail.dart';
import 'package:batta/screen/screen_changenick.dart';
import 'package:batta/screen/screen_changepassword.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('설정'),
          centerTitle: true,
        ),
        backgroundColor: const Color(0xFFEFECE5),
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ChangeEmailScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          "이메일 변경",
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ChangeNickScreen(),
                            ),
                          );
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
                                      // Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //     builder: (context) =>
                                      //         const ChangeEmailScreen(),
                                      //   ),
                                      // );
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
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) =>
                          //         const ChangePasswordScreen(),
                          //   ),
                          // );
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
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => const ChangeEmailScreen(),
                          //   ),
                          // );
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
}
