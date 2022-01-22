import 'package:flutter/cupertino.dart';
import 'package:statemanagement/provider/cart.dart';

class OrderIteam {
  final String? id;
  final int? amount;
  final List<CartIteam> products;
  final DateTime dateTime;

  OrderIteam(
      {this.id, this.amount, required this.products, required this.dateTime});
}

class Orders with ChangeNotifier {
  List<OrderIteam> _orders = [];

  List<OrderIteam> get orders {
    return _orders;
  }

  void addOrders(List<CartIteam> cartProducts, int total) {
    _orders.insert(
        0,
        OrderIteam(
            products: cartProducts,
            dateTime: DateTime.now(),
            id: DateTime.now().toString(),
            amount: total));
    notifyListeners();
  }
}
