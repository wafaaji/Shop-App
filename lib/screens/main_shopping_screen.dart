import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/providers/products_provider.dart';
import 'package:shop_app/screens/cart_screen.dart';
import 'package:shop_app/screens/order_screen.dart';
import 'package:shop_app/widgets/grid_product_item.dart';

class MainShoppingScreen extends StatefulWidget {
  static const id = '/MainShoppingScreen';
  const MainShoppingScreen({super.key});

  @override
  State<MainShoppingScreen> createState() => _MainShoppingScreenState();
}

class _MainShoppingScreenState extends State<MainShoppingScreen> {
  bool showFav = false;

  // we do not need to rebuild SafeArea & Scaffold that why we use provider in GridView
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          floatingActionButton: FloatingActionButton.extended(
            backgroundColor: Colors.pink,
            onPressed: (){
              Navigator.of(context).pushNamed(OrderScreen.id);
            },
            label: const Text("My Orders"),
          ),
          appBar: AppBar(
            title: const Text("Phone Shop"),
            backgroundColor: Colors.pinkAccent,
            actions: [
              PopupMenuButton(
                onSelected: (int selectedValue){
                  if(selectedValue == 0) {
                    setState(() {
                      showFav = true;
                    });
                  }
                  if(selectedValue == 1) {
                    setState(() {
                      showFav = false;
                    });
                  }
                },
                icon: const Icon(Icons.more_vert),
                itemBuilder: (_){
                  return [
                    const PopupMenuItem(value: 0,child: Text("filter be favorite"),),
                    const PopupMenuItem(value: 1,child: Text("remove filter"),),
                  ];
                },
              ),
              IconButton(
                onPressed: (){
                  Navigator.of(context).pushNamed(CartScreen.id);
                },
                icon: const Icon(Icons.shopping_cart_checkout,),
              )
            ],
          ),
          body: ProductsGrid(isFav: showFav,),
        ),
    );
  }
}

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({
    super.key,
    required this.isFav
  });
  final bool isFav;

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    final availProducts = isFav  ? productData.favoriteProducts : productData.availProduct;
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: availProducts.length,
      itemBuilder: (context, index) {
        return ChangeNotifierProvider<Product>.value(
          value: availProducts[index],
          // create: (BuildContext context) => availProducts[index],
          child: const GridProductItem(),
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
