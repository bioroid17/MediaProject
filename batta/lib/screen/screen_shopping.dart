import 'package:flutter/material.dart';

void main() {
  runApp(const HomeShopping());
}

class HomeShopping extends StatelessWidget {
  const HomeShopping({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Shopping',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('야구 장비 Shopping'),
      ),
      body: Column(
        children: [
          const BannerWidget(),
          Expanded(
            child: ProductListWidget(),
          ),
        ],
      ),
    );
  }
}

class BannerWidget extends StatelessWidget {
  const BannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.blue,
      child: const Center(
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

class ProductItemWidget extends StatelessWidget {
  final String name;
  final int price;

  const ProductItemWidget({
    super.key,
    required this.name,
    required this.price,
  });

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
