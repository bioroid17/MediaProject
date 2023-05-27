import 'package:flutter/material.dart';

void main() {
  runApp(HomeShoppingApp());
}

class HomeShoppingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Shopping',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Shopping'),
      ),
      body: Column(
        children: [
          BannerWidget(),
          Expanded(
            child: ProductListWidget(),
          ),
        ],
      ),
    );
  }
}

class BannerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.blue,
      child: Center(
        child: Text(
          'Banner',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}

class ProductListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10, // 상품 개수에 맞게 수정
      itemBuilder: (BuildContext context, int index) {
        return ProductItemWidget(
          name: 'Product ${index + 1}',
          price: 10000,
          // 다른 상품 정보도 추가로 넘겨줄 수 있음
        );
      },
    );
  }
}

class ProductItemWidget extends StatelessWidget {
  final String name;
  final int price;

  ProductItemWidget({required this.name, required this.price});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(name),
        subtitle: Text('Price: $price'),
        trailing: Icon(Icons.shopping_cart),
        onTap: () {
          // 상품을 선택했을 때 동작
        },
      ),
    );
  }
}
