import 'package:batta/model/model_daumpostcode.dart';
import 'package:batta/model/model_member.dart';
import 'package:batta/screen/screen_daumpostcodesearch.dart';
import 'package:batta/screen/screen_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

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
  final ImagePicker imagePicker = ImagePicker();
  XFile? image;
  String phone = "";
  String email = "";

  DaumPostModel? dataModel;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    doRegister(MemberModel member) async {
      setState(() {});
      Map<String, String> body = {
        'username': member.username,
        'password': member.password,
        'nickname': member.nickname,
        'zonecode': member.zonecode,
        'address': member.address,
      };
      if (member.phone.isNotEmpty) {
        body['phone'] = member.phone;
      }
      if (member.email.isNotEmpty) {
        body['email'] = member.email;
      }
      final url = Uri.parse("http://10.0.2.2:8000/batta/register/");
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: body,
      );
      if (response.statusCode == 200) {
        setState(() {});
      } else {
        throw Exception(response.statusCode.toString());
      }
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 13, 32, 101),
          title: const Text('BATTA 회원가입'),
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
                                floatingLabelStyle:
                                    TextStyle(color: Color(0xFF0D2065))),
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
                          child: Text(
                            "중복 확인",
                            style: TextStyle(
                              fontSize: width * 0.032,
                            ),
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
                          child: Text(
                            "중복 확인",
                            style: TextStyle(
                              fontSize: width * 0.032,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: width * 0.32,
                          child: TextField(
                            controller: TextEditingController(text: zonecode),
                            decoration: const InputDecoration(
                              labelText: '우편번호(필수)',
                            ),
                            keyboardType: TextInputType.text,
                            readOnly: true,
                          ),
                        ),
                        SizedBox(
                          width: width * 0.05,
                        ),
                        OutlinedButton(
                          onPressed: () {
                            HapticFeedback.mediumImpact();
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return const DaumPostcodeSearchScreen();
                                },
                              ),
                            ).then(
                              (value) {
                                if (value != null) {
                                  setState(
                                    () {
                                      dataModel = value;
                                      zonecode = dataModel!.zonecode;
                                      address = dataModel!.address;
                                    },
                                  );
                                }
                              },
                            );
                          },
                          child: Text(
                            "우편번호 찾기",
                            style: TextStyle(
                              fontSize: width * 0.032,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: height * 0.02,
                      ),
                      child: TextField(
                        controller: TextEditingController(text: address),
                        decoration: const InputDecoration(
                          labelText: '주소(필수)',
                          hintText: "우편번호 찾기 버튼으로 주소 찾기",
                        ),
                        keyboardType: TextInputType.text,
                        readOnly: true,
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
                    // image != null
                    //     ? SizedBox(
                    //         width: 300,
                    //         height: 300,
                    //         child: Image.file(
                    //             File(image!.path)), //가져온 이미지를 화면에 띄워주는 코드
                    //       )
                    //     : Container(
                    //         width: 300,
                    //         height: 300,
                    //         color: Colors.grey,
                    //       ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     ElevatedButton(
                    //       onPressed: () {
                    //         image = await imagePicker.pickImage(
                    //           //이미지를 선택
                    //           source: ImageSource.camera, //위치는 카메라
                    //           maxHeight: 75,
                    //           maxWidth: 75,
                    //           imageQuality: 30, // 이미지 크기 압축을 위해 퀄리티를 30으로 낮춤.
                    //         );
                    //       },
                    //       child: const Text("카메라"),
                    //     ),
                    //     const SizedBox(width: 30),
                    //     ElevatedButton(
                    //       onPressed: () {
                    //         imagePicker.pickImage(
                    //           //이미지를 선택
                    //           source: ImageSource.gallery, //위치는 갤러리
                    //           maxHeight: 75,
                    //           maxWidth: 75,
                    //           imageQuality: 30, // 이미지 크기 압축을 위해 퀄리티를 30으로 낮춤.
                    //         );
                    //       },
                    //       child: const Text("갤러리"),
                    //     ),
                    //   ],
                    // ),
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
                            // 이후 유효성 검사 코드 추가할 것
                            doRegister(
                              MemberModel.fromMap(
                                {
                                  'username': username,
                                  'password': password,
                                  'nickname': nickname,
                                  'zonecode': zonecode,
                                  'address': address,
                                  'image': image.toString(),
                                  'phone': phone,
                                  'email': email,
                                },
                              ),
                            ).whenComplete(() {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginScreen(),
                                ),
                              );
                            });
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

  //이미지를 가져오는 함수
  // Future getImage(ImageSource imageSource) async {
  //   //pickedFile에 ImagePicker로 가져온 이미지가 담긴다.
  //   final XFile? pickedFile = await imagePicker.pickImage(source: imageSource);
  //   if (pickedFile != null) {
  //     setState(() {
  //       image = XFile(pickedFile.path); //가져온 이미지를 _image에 저장
  //     });
  //   }
  // }
}
