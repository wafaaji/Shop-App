import 'package:flutter/cupertino.dart';
import 'package:shop_app/providers/card_provider.dart';

class OrderItem{
  final String id;
  final double totalPrice;
  final DateTime orderTime;
  final List<CartItem> cartItem;

  OrderItem({
    required this.id,
    required this.totalPrice,
    required this.orderTime,
    required this.cartItem,
});
}

class Orders with ChangeNotifier{
  List<OrderItem> _myOrder = [];

  List<OrderItem> get myOrders{
    return[..._myOrder];
  }

  void addOrder({
      required List<CartItem> cartItems,
      required double totalPrice,
  }){
    _myOrder.add(
      OrderItem(
        id: DateTime.now().toString(),
        totalPrice: totalPrice,
        orderTime: DateTime.now(),
        cartItem: cartItems,
      ),
    );
    notifyListeners();
  }
}