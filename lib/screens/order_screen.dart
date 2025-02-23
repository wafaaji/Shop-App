import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/order_provider.dart';
import 'package:shop_app/widgets/orders_item.dart';

class OrderScreen extends StatelessWidget {
  static const id = '/OrderScreen';
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Orders"),
        backgroundColor: Colors.pinkAccent,
      ),
      body: ListView.builder(
        itemCount: orders.myOrders.length,
        itemBuilder: (context, index) => OrdersItemTile(
          order: orders.myOrders[index],
        ),
      ),
    );
  }
}
