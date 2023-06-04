import 'package:batta/screen/screen_boardlist.dart';
import 'package:batta/screen/screen_home.dart';
import 'package:batta/screen/screen_map.dart';
import 'package:batta/screen/screen_notice.dart';
import 'package:batta/screen/screen_setting.dart';
import 'package:flutter/material.dart';

class NavbarScreen extends StatefulWidget {
  const NavbarScreen({super.key});

  @override
  State<NavbarScreen> createState() => _NavbarScreenState();
}

class _NavbarScreenState extends State<NavbarScreen> {
  int _selectedIndex = 0; // 처음에 나올 화면 지정

  // 이동할 페이지
  final List<Widget> _pages = [
    const HomeScreen(),
    const BoardListScreen(),
    const MapScreen(),
    const NoticeScreen(
      type: '',
    ),
    const SettingScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: _pages[_selectedIndex], // 페이지와 연결
        ),

        // BottomNavigationBar 위젯
        bottomNavigationBar: BottomNavigationBar(
          // bottomNavigationBar item이 4개 이상일 경우
          selectedItemColor: const Color.fromARGB(255, 13, 32, 101), // 선택된 요소 색
          unselectedItemColor: Colors.grey, // 선택되지 않은 요소 색
          type: BottomNavigationBarType.shifting,

          // 클릭 이벤트
          onTap: _onItemTapped,
          currentIndex: _selectedIndex, // 현재 선택된 index

          // BottomNavigationBarItem 위젯
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '홈',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list_alt_outlined),
              label: '게시판',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.map_outlined),
              label: '지도',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: '알림',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: '설정',
            ),
          ],
        ));
  }

  void _onItemTapped(int index) {
    // state 갱신
    setState(() {
      _selectedIndex = index; // index는 item 순서로 0, 1, 2로 구성
    });
  }
}
