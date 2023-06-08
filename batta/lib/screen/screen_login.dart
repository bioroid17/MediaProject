import 'package:batta/model/model_login.dart';
import 'package:batta/screen/screen_navbar.dart';
import 'package:batta/screen/screen_register.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String username = "";
  String password = "";
  int result = 0;

  late LoginModel loginInfo;
  late SharedPreferences userpref;

  @override
  void initState() {
    super.initState();
    initPrefs();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    loginInfo = Provider.of<LoginModel>(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 13, 32, 101),
          shadowColor: Colors.grey,
          title: const Text('BATTA 로그인'),
          centerTitle: true,
        ),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
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
                      child: TextField(
                        controller: TextEditingController(text: username),
                        decoration: const InputDecoration(
                          labelText: '아이디',
                        ),
                        keyboardType: TextInputType.text,
                        onChanged: (value) {
                          username = value;
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: height * 0.02,
                      ),
                      child: TextField(
                        controller: TextEditingController(text: password),
                        decoration: const InputDecoration(
                          labelText: '비밀번호',
                        ),
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        onChanged: (value) {
                          password = value;
                        },
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
                            doLogin().whenComplete(
                              () {
                                if (result == 1) {
                                  // 아이디, 비밀번호 모두 일치
                                  loginInfo.setUsername(username);
                                  userpref.setString("battaUsername", username);
                                  userpref.setString("battaPassword", password);
                                  setState(() {
                                    username = "";
                                    password = "";
                                  });
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const NavbarScreen(),
                                    ),
                                  );
                                } else if (result == 0) {
                                  showDialog(
                                    context: context,
                                    barrierDismissible: true,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: const Text("로그인 오류"),
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
                                } else if (result == -1) {
                                  showDialog(
                                    context: context,
                                    barrierDismissible: true,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: const Text("로그인 오류"),
                                        content: const SingleChildScrollView(
                                          child: ListBody(
                                            children: [
                                              Text("아이디가 없습니다."),
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
                                }
                              },
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

  Future<void> doLogin() async {
    final url = Uri.parse("http://10.0.2.2:8000/batta/login/");
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: <String, String>{
        "username": username,
        "password": password,
      },
    );
    if (response.statusCode == 200) {
      setState(() {
        result = int.parse(response.body);
      });
    } else {
      throw Exception(response.statusCode.toString());
    }
  }

  Future initPrefs() async {
    // 스마트폰 저장소에 액세스를 얻는다.
    userpref = await SharedPreferences.getInstance();
    // likedToons를 저장소에서 불러온다.
    final battaUsername = userpref.getString('battaUsername');
    final battaPassword = userpref.getString('battaPassword');
    if (battaUsername != null && battaPassword != null) {
      setState(() {
        username = battaUsername;
        password = battaPassword;
        doLogin().whenComplete(() {
          if (result == 1) {
            // 아이디, 비밀번호 모두 일치
            loginInfo.setUsername(username);
            userpref.setString("battaUsername", username);
            userpref.setString("battaPassword", password);
            setState(() {
              username = "";
              password = "";
            });
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const NavbarScreen(),
              ),
            );
          } else if (result == 0) {
            showDialog(
              context: context,
              barrierDismissible: true,
              builder: (context) {
                return AlertDialog(
                  title: const Text("로그인 오류"),
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
          } else if (result == -1) {
            showDialog(
              context: context,
              barrierDismissible: true,
              builder: (context) {
                return AlertDialog(
                  title: const Text("로그인 오류"),
                  content: const SingleChildScrollView(
                    child: ListBody(
                      children: [
                        Text("아이디가 없습니다."),
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
          }
        });
      });
    } else {
      // 앱을 처음 실행하면 username, password는 없으므로 새로 만들어준다.
      // 딱히 setString의 결과를 기다릴 필요는 없으므로 await를 쓸 필요는 없다.
      userpref.setString('battaUsername', "");
      userpref.setString('battaPassword', "");
    }
  }
}
