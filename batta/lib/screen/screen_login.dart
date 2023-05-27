import 'package:batta/screen/screen_navbar.dart';
import 'package:batta/screen/screen_register.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('BATTA 로그인'),
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
                      '로그인',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: height * 0.02,
                      ),
                      child: const TextField(
                        decoration: InputDecoration(
                          labelText: '아이디',
                        ),
                        keyboardType: TextInputType.text,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: height * 0.02,
                      ),
                      child: const TextField(
                        decoration: InputDecoration(
                          labelText: '비밀번호',
                        ),
                        keyboardType: TextInputType.text,
                        obscureText: true,
                      ),
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
                                builder: (context) => const NavbarScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            '로그인',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
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
