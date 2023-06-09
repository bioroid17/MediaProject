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
      'url':
          'https://search.shopping.naver.com/catalog/38922554778?query=%ED%94%84%EB%9E%AD%ED%81%B4%EB%A6%B0%20%EC%95%BC%EA%B5%AC%EA%B8%80%EB%9F%AC%EB%B8%8C%20%EB%AA%A8%EC%9D%8C%20%EC%A2%8C%ED%88%AC%20%EC%9A%B0%ED%88%AC%20%EC%95%84%EB%8F%99%EC%9A%A9%20%EC%84%B1%EC%9D%B8%EC%9A%A9&NaPm=ct%3Dlinukb0w%7Cci%3D7b4024c6daf8af1943b8d161dcc8881173a985f6%7Ctr%3Dslsl%7Csn%3D95694%7Chk%3De245de89eeb5fb43363b5c6bdb6cebbdfea6bcc3', // 첫 번째 아이템의 URL
    },
    {
      'title': '이보쉴드 야구헬멧 검투사 마우스가드 성인 유소년 양귀헬멧',
      'imageUrl':
          'https://shopping-phinf.pstatic.net/main_3409831/34098317517.20220816092638.jpg?type=f640',
      'url':
          'https://search.shopping.naver.com/catalog/34098317517?query=%EC%95%BC%EA%B5%AC%20%ED%97%AC%EB%A9%A7&NaPm=ct%3Dliok6rcw%7Cci%3D92e998bbe7603de83341bc00cb00ff3f6435e0b6%7Ctr%3Dslsl%7Csn%3D95694%7Chk%3De73a0fd3a6fe8b873cf59f9f73372e7ff88f8603', // 두 번째 아이템의 URL
    },
    {
      'title': 'KN 케이엔 양귀 조절형 야구헬멧 곤색 03 KP003',
      'imageUrl':
          'https://shopping-phinf.pstatic.net/main_3432324/34323248787.20220828054756.jpg?type=f640',
      'url':
          'https://search.shopping.naver.com/catalog/34323248787?query=%EC%95%BC%EA%B5%AC%20%ED%97%AC%EB%A9%A7&NaPm=ct%3Dliok5mgo%7Cci%3Dbc16947926812ad1ff14fe8ee3d9e169bdbaa0e1%7Ctr%3Dslsl%7Csn%3D95694%7Chk%3Ddd735d828a6344006f2e40eba1fee6fadad0483b', // 세 번째 아이템의 URL
    },
    {
      'title': '브렛 프로 외귀헬멧 블랙무광',
      'imageUrl':
          'https://shopping-phinf.pstatic.net/main_3432204/34322040460.20220828043010.jpg?type=f640',
      'url':
          'https://search.shopping.naver.com/catalog/34322040460?query=%EC%95%BC%EA%B5%AC%20%ED%97%AC%EB%A9%A7&NaPm=ct%3Dliok3ya0%7Cci%3D54fd61eda625ed92945de137f8cfb8a5c94f16d6%7Ctr%3Dslsl%7Csn%3D95694%7Chk%3D84d3eb2e51a40966754fda654961f646af9000ba', // 네 번째 아이템의 URL
    },
    {
      'title': '티라노스포츠 티라노 라비 2 0',
      'imageUrl':
          'https://shopping-phinf.pstatic.net/main_3795831/37958317218.20230517121923.jpg?type=f640',
      'url':
          'https://search.shopping.naver.com/catalog/37958317218?query=%EB%B0%B0%ED%8A%B8&NaPm=ct%3Dliok2708%7Cci%3D00cf000cae1c6b07feb4342cc74e3ee1129d0ddf%7Ctr%3Dslsl%7Csn%3D95694%7Chk%3Db88a86b3563f39295791cd587098bd5796b8a55c', // 다섯 번째 아이템의 URL
    },
    {
      'title': '와니엘 디아멍배트 프로 고성능 프리미엄 KBN인증',
      'imageUrl':
          'https://shopping-phinf.pstatic.net/main_3321284/33212847184.20220630153440.jpg?type=f640',
      'url':
          'https://search.shopping.naver.com/catalog/33212847184?query=%EB%B0%B0%ED%8A%B8&NaPm=ct%3Dliok0o80%7Cci%3D6b1a6781160de025510e0c152a187d4a7c62db5f%7Ctr%3Dslsl%7Csn%3D95694%7Chk%3D23027153407912ab25ee3297421696687ca8b1fa', // 여섯 번째 아이템의 URL
    },
    {
      'title': '윌슨 스포츠용품 GQJ 나무 야구배트 WBWB001 8',
      'imageUrl':
          'https://shopping-phinf.pstatic.net/main_3593810/35938104674.20221118172158.jpg?type=f640',
      'url':
          'https://search.shopping.naver.com/catalog/28533671743?query=%EB%B0%B0%ED%8A%B8&NaPm=ct%3Dliojzh0g%7Cci%3D534df0ad8c871519fac3b3b02e57157764758ab6%7Ctr%3Dslsl%7Csn%3D95694%7Chk%3D60dfdc51a96bbb2d90658737ca1381fc7430ef30', // 일곱 번째 아이템의 URL
    },
    {
      'title': '골드이스트 야구장비가방 멀티에이블 백팩',
      'imageUrl':
          'https://shopping-phinf.pstatic.net/main_1414681/14146814440.20180426181958.jpg?type=f640',
      'url':
          'https://search.shopping.naver.com/catalog/14146814440?query=%EC%95%BC%EA%B5%AC%EC%9E%A5%EB%B9%84&NaPm=ct%3Dliojwlm8%7Cci%3D61bda514cc36422a23a88597061f58de0c44ccbe%7Ctr%3Dslsl%7Csn%3D95694%7Chk%3D1e44ae1f6ed043bfcbb152111967e9f41bf8b502', // 여덟 번째 아이템의 URL
    },
    {
      'title': '사사키 야구배트가방 1개입 배트케이스 야구 장비가방',
      'imageUrl':
          'https://shopping-phinf.pstatic.net/main_3568386/35683861704.20221107064519.jpg?type=f640',
      'url':
          'https://search.shopping.naver.com/catalog/35683861704?query=%EC%95%BC%EA%B5%AC%EC%9E%A5%EB%B9%84&NaPm=ct%3Dliojem8o%7Cci%3Df152059a94f533ed736b90cd1da9bd5ead7105f7%7Ctr%3Dslsl%7Csn%3D95694%7Chk%3D47bfa3d2af74974ef837e089819bc2139588c2e8', // 아홉 번째 아이템의 URL
    },
    {
      'title': '미즈노 야구장비 유소년 외야 글러브 셀렉트 9',
      'imageUrl':
          'https://shopping-phinf.pstatic.net/main_3437343/34373437677.20220830175306.jpg?type=f640',
      'url':
          'https://search.shopping.naver.com/catalog/34373437677?query=%EC%95%BC%EA%B5%AC%EC%9E%A5%EB%B9%84&NaPm=ct%3Dliojcxa8%7Cci%3Db4c373d4286fba179591057af7af2b1ffe4aab19%7Ctr%3Dslsl%7Csn%3D95694%7Chk%3D427c1acd97de6a616313880adc5fd9cfbb47c795', // 열 번째 아이템의 URL
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 5.0, //  간격 조절
          crossAxisSpacing: 5.0, //  간격 조절
          crossAxisCount: 2, // 그리드 열 개수
          childAspectRatio: 1, // 이미지의 가로 세로 비율 (1:1)
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WebViewPage(
                    url: item['url'] as String,
                  ),
                ),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Image.network(
                    item['imageUrl'] as String,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    item['title'] as String,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class WebViewPage extends StatelessWidget {
  final String url;

  const WebViewPage({required this.url, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
