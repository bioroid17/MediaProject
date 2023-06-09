import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 13, 32, 101),
          title: const Text('BATTA 홈'),
          centerTitle: true,
        ),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: height * 0.05),
          child: Center(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xFF0D2065),
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  width: width * 0.85,
                  padding: EdgeInsets.symmetric(
                    vertical: height * 0.05,
                    horizontal: width * 0.05,
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("인기 글"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.person,
                              ),
                              Text("익명"),
                            ],
                          ),
                          Text("2023/05/12 16:00"),
                        ],
                      ),
                      Text(
                        "제목",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text("글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용")
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.1,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xFF0D2065),
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  width: width * 0.85,
                  padding: EdgeInsets.symmetric(
                    vertical: height * 0.05,
                    horizontal: width * 0.05,
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("나의 빠따"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.person,
                              ),
                              Text("익명"),
                            ],
                          ),
                          Text("2023/05/12 17:30"),
                        ],
                      ),
                      Text(
                        "제목",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text("글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용")
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.1,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xFF0D2065),
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  width: width * 0.85,
                  padding: EdgeInsets.symmetric(
                    vertical: height * 0.05,
                    horizontal: width * 0.05,
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("나의 빠따"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.person,
                              ),
                              Text("익명"),
                            ],
                          ),
                          Text("2023/05/12 17:30"),
                        ],
                      ),
                      Text(
                        "제목",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text("글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용")
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
