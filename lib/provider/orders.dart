import 'package:demp_app/provider/cart.provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class OrderItem {
  final String ?id;
  final double amount;
  final List<CartItem> product;
  final DateTime datetime;

  OrderItem({
     this.id,
    required this.amount,
    required this.product,
    required this.datetime,
  });
}

class Orders with ChangeNotifier {
  final List<OrderItem> _Orders = [];

  List<OrderItem> get orders {
    return [...orders];
  }

  void addOrder(List<CartItem> cartProducts, double total) {
    _Orders.insert(
        0,
        OrderItem(
            id: DateTime.now().toString(),
            amount: total,
            datetime: DateTime.now(),
            product: cartProducts));
    notifyListeners();
  }
}
