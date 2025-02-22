import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/providers/products_provider.dart';
import 'package:shop_app/widgets/grid_product_item.dart';

class MainShoppingScreen extends StatelessWidget {
  static const id = '/MainShoppingScreen';
  MainShoppingScreen({super.key});

  // we do not need to rebuild SafeArea & Scaffold that why we use provider in GridView
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Phone Shop"),
          ),
          body: ProductsGrid(),
        ),
    );
  }
}

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    final availProducts = productData.availProduct;
    return GridView.builder(
      padding: const EdgeInsets.all(10),
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
    );
  }
}
