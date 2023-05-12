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
          title: const Text('BATTA 홈'),
          centerTitle: true,
        ),
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
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: width * 0.85,
                  height: height * 0.3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("인기 글"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: const Row(
                              children: [
                                Icon(
                                  Icons.person,
                                ),
                                Text("익명"),
                              ],
                            ),
                          ),
                          const Text("2021/05/12 16:00"),
                        ],
                      ),
                      const Text(
                        "제목",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text("글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용")
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
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: width * 0.85,
                  height: height * 0.3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("나의 빠따"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: const Row(
                              children: [
                                Icon(
                                  Icons.person,
                                ),
                                Text("익명"),
                              ],
                            ),
                          ),
                          const Text("2021/05/12 17:30"),
                        ],
                      ),
                      const Text(
                        "제목",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text("글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용")
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
