import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/card_provider.dart';

class CartItemTile extends StatelessWidget {
  const CartItemTile({super.key, required this.id, required this.title, required this.productId, required this.price, required this.quantity});

  final String id;
  final String title;
  final String productId;
  final String price;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: ListTile(
        leading: Text(price.toString()),
        title: Text(title.toString()),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(quantity.toString()),
            Text("\$${double.parse(price) * quantity}")
          ],
        ),
        trailing: IconButton(
          onPressed: (){
            Provider.of<Cart>(context, listen: false).removeItem(productId);
          },
          icon: const Icon(Icons.delete),
        ),
      ),
    );
  }
}
