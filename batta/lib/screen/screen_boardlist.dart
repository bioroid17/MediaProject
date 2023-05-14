import 'package:batta/screen/screen_board.dart';
import 'package:flutter/material.dart';

class BoardListScreen extends StatefulWidget {
  const BoardListScreen({super.key});

  @override
  State<BoardListScreen> createState() => _BoardListScreenState();
}

class _BoardListScreenState extends State<BoardListScreen> {
  // final Map<String, dynamic> freeBoardJson = {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('BATTA 게시판'),
            centerTitle: true,
            bottom: const TabBar(
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
          backgroundColor: const Color(0xFFEFECE5),
          body: const TabBarView(children: [
            BoardScreen(
              type: "free",
            ),
            BoardScreen(
              type: "circle",
            ),
            BoardScreen(
              type: "shop",
            ),
          ]),
          // body: SingleChildScrollView(
          //   padding: EdgeInsets.symmetric(vertical: height * 0.05),
          //   child: Center(
          //     child: Column(
          //       children: [
          //         Container(
          //           decoration: BoxDecoration(
          //             border: Border.all(
          //               color: const Color(0xFF0D2065),
          //             ),
          //             borderRadius: BorderRadius.circular(10),
          //           ),
          //           width: width * 0.85,
          //           height: height * 0.3,
          //           padding: EdgeInsets.symmetric(
          //             vertical: height * 0.02,
          //             horizontal: width * 0.03,
          //           ),
          //           child: Column(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               Row(
          //                 children: [
          //                   const Icon(
          //                     Icons.list,
          //                   ),
          //                   SizedBox(
          //                     width: width * 0.03,
          //                   ),
          //                   const Text("자유게시판"),
          //                 ],
          //               ),
          //             ],
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        ),
      ),
    );
  }
}
