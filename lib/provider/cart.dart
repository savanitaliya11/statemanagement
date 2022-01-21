import 'package:flutter/cupertino.dart';

class CartIteam {
  final String? id;
  final String? title;
  final double? price;
  final int? quntity;

  CartIteam({this.id, this.title, this.price, this.quntity});
}

class Cart with ChangeNotifier {
  //main cart iteam
  Map<String, CartIteam>? _iteams;

  Map<String, CartIteam> get iteams {
    return _iteams!;
  }

  void addCart(String id, String title, double price) {
    if (_iteams!.containsKey(id)) {
      _iteams!.update(
          id,
          (existingIteam) => CartIteam(
              id: existingIteam.id,
              quntity: existingIteam.quntity! + 1,
              title: existingIteam.title,
              price: existingIteam.price));
    } else {
      _iteams!.putIfAbsent(
          id,
          () => CartIteam(
              id: DateTime.now().toString(),
              price: price,
              title: title,
              quntity: 1));
    }
  }
}
