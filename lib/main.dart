import 'package:flutter/material.dart';
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
      home: MainShoppingScreen(),
      routes: {
        ProductDetailsScreen.id: (c)=> const ProductDetailsScreen(),
        MainShoppingScreen.id: (c)=> MainShoppingScreen(),
      },
    );
  }
}
