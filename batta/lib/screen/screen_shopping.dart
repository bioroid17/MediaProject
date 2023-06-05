import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ShoppingApp extends StatelessWidget {
  const ShoppingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        title: '쇼핑',
        theme: ThemeData(),
        home: const ShoppingPage(),
      ),
    );
  }
}

class ShoppingPage extends StatefulWidget {
  const ShoppingPage({super.key});

  @override
  State<ShoppingPage> createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  List<Map<String, dynamic>> items = [
    {
      'title': '프랭클린 야구글러브 모음 좌투 우투 아동용 성인용',
      'imageUrl':
          'https://shopping-phinf.pstatic.net/main_3892255/38922554778.20230325145833.jpg?type=f640',
    },
    {
      'title': '홈런 야구배트 대 중 소 나무 야구 방망이 아동 청소년 성인',
      'imageUrl':
          'https://fastly.picsum.photos/id/237/200/300.jpg?hmac=TmmQSbShHz9CdQm0NkEjx1Dyh_Y984R9LpNrpvH2D_U',
    },
    {
      'title': '티라노스포츠 티라노 하이퍼 도그마 2 0',
      'imageUrl':
          'https://fastly.picsum.photos/id/237/200/300.jpg?hmac=TmmQSbShHz9CdQm0NkEjx1Dyh_Y984R9LpNrpvH2D_U',
    },
    {
      'title': 'Item 4',
      'imageUrl':
          'https://fastly.picsum.photos/id/237/200/300.jpg?hmac=TmmQSbShHz9CdQm0NkEjx1Dyh_Y984R9LpNrpvH2D_U',
    },
    {
      'title': 'Item 5',
      'imageUrl':
          'https://fastly.picsum.photos/id/237/200/300.jpg?hmac=TmmQSbShHz9CdQm0NkEjx1Dyh_Y984R9LpNrpvH2D_U',
    },
    {
      'title': 'Item 6',
      'imageUrl':
          'https://fastly.picsum.photos/id/237/200/300.jpg?hmac=TmmQSbShHz9CdQm0NkEjx1Dyh_Y984R9LpNrpvH2D_U',
    },
    {
      'title': 'Item 7',
      'imageUrl':
          'https://fastly.picsum.photos/id/237/200/300.jpg?hmac=TmmQSbShHz9CdQm0NkEjx1Dyh_Y984R9LpNrpvH2D_U',
    },
  ];

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage:
                  NetworkImage(item['imageUrl'] as String), // 캐스트 추가
            ),
            title: Text(item['title'] as String), // 캐스트 추가
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const WebViewPage(),
                  settings: const RouteSettings(
                    arguments:
                        'https://search.shopping.naver.com/catalog/38922554778?query=%EC%95%BC%EA%B5%AC%20%EA%B8%80%EB%9F%AC%EB%B8%8C&NaPm=ct%3Dlii7xn00%7Cci%3D1a0b8965e9be27d4534634165adda235d272f0c9%7Ctr%3Dslsl%7Csn%3D95694%7Chk%3D7f72936e12c457f55c2c6ce92eb2024f08aafb13', // 네이버 쇼핑 URL
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class WebViewPage extends StatelessWidget {
  const WebViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final String url = ModalRoute.of(context)?.settings.arguments as String;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('네이버 쇼핑'),
          backgroundColor: const Color.fromARGB(255, 13, 32, 101),
          shadowColor: Colors.grey,
        ),
        body: WebView(
          initialUrl: url,
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
