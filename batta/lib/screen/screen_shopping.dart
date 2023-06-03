import 'package:flutter/material.dart';
import 'package:batta/widget/widget_board.dart';
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
  List<String> items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('장비 쇼핑'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index]),
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
      ),
      body: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
