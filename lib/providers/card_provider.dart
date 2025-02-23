import 'package:flutter/cupertino.dart';

class CartItem{
  final String id;
  final String title;
  final String price;
  final int quantity;

  CartItem({
    required this.id,
    required this.title,
    required this.price,
    required this.quantity,
});
}

class Cart with ChangeNotifier{
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items{
    return{..._items};
  }

  void addItem({required String productId, price, title,}){
    if(_items.containsKey(productId)){
      _items.update(productId, (value) =>
          CartItem(
              id: value.id,
              title: value.title,
              price: value.price,
              quantity: value.quantity + 1,
          )
      );
      notifyListeners();
    }else{
      _items.putIfAbsent(productId, () => CartItem(
          id: DateTime.now().toString(),
          title: title.toString(),
          price: price.toString(),
          quantity: 1)
      );
      notifyListeners();
    }
  }

  double get totalToPay{
    double total = 0.0;
    _items.forEach((key, value) {
      total += double.parse(value.price) * value.quantity;
    });
    return total;
  }

  void removeItem(String productId){
    _items.remove(productId);
    notifyListeners();
  }
}