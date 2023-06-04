import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ShoppingApp extends StatelessWidget {
  const ShoppingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '장비 쇼핑',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ShoppingPage(),
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
      'title': 'Item 1',
      'imageUrl':
          'https://fastly.picsum.photos/id/237/200/300.jpg?hmac=TmmQSbShHz9CdQm0NkEjx1Dyh_Y984R9LpNrpvH2D_U',
    },
    {
      'title': 'Item 2',
      'imageUrl':
          'https://fastly.picsum.photos/id/237/200/300.jpg?hmac=TmmQSbShHz9CdQm0NkEjx1Dyh_Y984R9LpNrpvH2D_U',
    },
    {
      'title': 'Item 3',
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
                        'https://search.shopping.naver.com/search/all?frm=NVSHATC&origQuery=%EC%95%BC%EA%B5%AC%EC%9E%A5%EB%B9%84&pagingIndex=1&pagingSize=40&productSet=total&query=%EC%95%BC%EA%B5%AC%EC%9E%A5%EB%B9%84&sort=review&timestamp=&viewType=list', // 네이버 쇼핑 URL
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

    return Scaffold(
      appBar: AppBar(
        title: const Text('네이버 쇼핑'),
        backgroundColor: const Color.fromARGB(255, 13, 32, 101),
      ),
      body: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
