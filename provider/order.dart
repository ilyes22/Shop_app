import 'package:flutter/foundation.dart';
import 'package:shop_app/provider/cart.dart';
import './cart.dart';

class OrderItems {
  final String id;
  final List<CartItems> products;
  final DateTime dateTime;
  final double amount;
  OrderItems(
      {required this.id,
      required this.products,
      required this.dateTime,
      required this.amount});
}

class Orders with ChangeNotifier {
  List<OrderItems> _order = [];
  List<OrderItems> get orders {
    return [..._order];
  }

  void addOrder(List<CartItems> orderNow, double total) {
    _order.insert(
        0,
        OrderItems(
            id: DateTime.now().toString(),
            dateTime: DateTime.now(),
            amount: total,
            products: orderNow));
    notifyListeners();
  }
}
