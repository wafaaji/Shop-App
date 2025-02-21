import 'package:flutter/material.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/widgets/grid_product_item.dart';

class MainShoppingScreen extends StatelessWidget {
  static const id = '/MainShoppingScreen';
  MainShoppingScreen({super.key});

  final List<Product> availProducts = [
    Product(
        id: '1001',
        title: 'Samsung',
        description: "it's a phone",
        image: 'assets/images/samsung.jpeg',
        price: 1000),
    Product(
        id: '1002',
        title: 'realme',
        description: "it's a phone",
        image: 'assets/images/realme.jpeg',
        price: 1000),
    Product(
        id: '1003',
        title: 'Iphone',
        description: "it's a phone",
        image: 'assets/images/iphone.jpeg',
        price: 1000),
    Product(
        id: '1004',
        title: 'nokia',
        description: "it's a phone",
        image: 'assets/images/nokia.jpeg',
        price: 1000),
    Product(
        id: '1005',
        title: 'oneplus',
        description: "it's a phone",
        image: 'assets/images/oneplus.jpeg',
        price: 1000),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Phone Shop"),
          ),
          body: GridView.builder(
            padding: EdgeInsets.all(10),
            itemCount: availProducts.length,
            itemBuilder: (context, index) {
              return GridProductItem(
                id: availProducts[index].id,
                title: availProducts[index].title,
                image: availProducts[index].image,
              );
              },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1/1,
              crossAxisSpacing: 10,
              mainAxisSpacing: 30,
            ),
          ),
        ),
    );
  }
}
