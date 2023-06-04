import 'package:batta/screen/screen_board.dart';
import 'package:batta/screen/screen_writeboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BoardListScreen extends StatelessWidget {
  const BoardListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 4,
        child: Center(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: const Color.fromARGB(255, 13, 32, 101),
              shadowColor: Colors.grey,
              title: const Text('BATTA 게시판'),
              centerTitle: true,
              bottom: const TabBar(
                indicatorColor: Colors.white,
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: [
                  Tab(
                    text: "자유게시판",
                  ),
                  Tab(
                    text: "모임게시판",
                  ),
                  Tab(
                    text: "모임 지도",
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
                  type: "free",
                ),
                BoardScreen(
                  type: "circle",
                ),
                BoardScreen(type: "map"),
                BoardScreen(
                  type: "shop",
                ),
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
