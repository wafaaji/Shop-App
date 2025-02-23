import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/providers/order_provider.dart';

class OrdersItemTile extends StatefulWidget {
  const OrdersItemTile({super.key, required this.order});
  final OrderItem order;

  @override
  State<OrdersItemTile> createState() => _OrdersItemTileState();
}

class _OrdersItemTileState extends State<OrdersItemTile> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text("${widget.order.totalPrice} \$"),
            subtitle: Text("${widget.order.orderTime}"),
            trailing: IconButton(
              onPressed: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
              icon: isExpanded
                  ? const Icon(Icons.expand_less)
                  : const Icon(Icons.expand_more),
            ),
          ),
          if (isExpanded)
            SizedBox(
              height: widget.order.cartItem.length + 28,
              child: ListView(
                children: widget.order.cartItem
                    .map(
                      (product) => Row(
                        children: [
                          Expanded(child: Text(product.title)),
                          Text(product.quantity.toString()),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(product.price),
                        ],
                      ),
                    )
                    .toList(),
              ),
            ),
        ],
      ),
    );
  }
}
