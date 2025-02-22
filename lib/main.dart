import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products_provider.dart';
import 'package:shop_app/screens/main_shopping_screen.dart';
import 'package:shop_app/screens/product_details_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.pinkAccent,
      ),
      title: 'Flutter Demo',
      home: MyHomePage(),
      routes: {
        ProductDetailsScreen.id: (c)=> const ProductDetailsScreen(),
        MainShoppingScreen.id: (c)=> MainShoppingScreen(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => Products(),
        child: MainShoppingScreen(),
    );
  }

}
