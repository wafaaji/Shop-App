import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products_provider.dart';

class ProductDetailsScreen extends StatelessWidget {
  static const id = '/ProductDetailsScreen';
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var id = ModalRoute.of(context)?.settings.arguments as String;
    final ourProduct = Provider.of<Products>(context, listen: false).findById(id);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 250,
            width: double.infinity,
            child: Image.asset(ourProduct.image,
            fit: BoxFit.cover,),
          ),
          const SizedBox(
            height: 20,
          ),
          Text("\$ ${ourProduct.price}", style: const TextStyle(color: Colors.grey),),
          const SizedBox(
            height: 20,
          ),
          Text(ourProduct.description,),
        ],
      ),
    );
  }
}
