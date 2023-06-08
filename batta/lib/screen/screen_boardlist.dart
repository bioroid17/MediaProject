import 'package:batta/screen/screen_board.dart';
import 'package:batta/screen/screen_writeboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:batta/screen/screen_shopping.dart';

class BoardListScreen extends StatefulWidget {
  const BoardListScreen({super.key});

  @override
  State<BoardListScreen> createState() => _BoardListScreenState();
}

class _BoardListScreenState extends State<BoardListScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Center(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: const Color.fromARGB(255, 13, 32, 101),
              shadowColor: Colors.grey,
              title: const Text('BATTA 게시판'),
              centerTitle: true,
              bottom: const TabBar(
                indicatorColor: Color.fromARGB(255, 253, 187, 99),
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: [
                  Tab(
                    text: "자유게시판",
                  ),
                  Tab(
                    text: "모임게시판",
                  ),
                  Tab(
                    text: "쇼핑",
                  ),
                ],
              ),
            ),
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            body: const TabBarView(
              children: [
                BoardScreen(
                  boardType: "free",
                ),
                BoardScreen(
                  boardType: "circle",
                ),
                ShoppingPage(), // 쇼핑
              ],
            ),
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WriteBoardScreen(),
                  ),
                );
              },
              backgroundColor: const Color.fromARGB(255, 13, 32, 101),
              icon: const Icon(CupertinoIcons.pencil_circle),
              label: const Text("글 쓰기"),
            ),
          ),
        ),
      ),
    );
  }
}
