// ignore_for_file: prefer_final_fields

import 'package:flutter/cupertino.dart';
import 'package:statemanagement/models/product.dart';

//Mixin class ChangeNotifier
class Products with ChangeNotifier {
  List<Product> _iteams = [
    Product(
      title: 'T-shirt',
      description: 'Trouser for Men',
      id: 'p1',
      price: '499.00',
      imageUrl:
          'https://5.imimg.com/data5/YX/OO/TA/ANDROID-108727015/product-jpeg-500x500.jpg',
    ),
    Product(
      title: 'Jeans',
      description: 'Trouser for Men',
      id: 'p2',
      price: '40.00',
      imageUrl:
          'https://tiimg.tistatic.com/fp/1/006/253/full-sleeves-pink-color-girls-t-shirts-551.jpg',
    ),
    Product(
        title: 'Trouser',
        description: 'Trouser for Men',
        id: 'p3',
        price: '499.00',
        imageUrl:
            'https://4.imimg.com/data4/KA/WM/ANDROID-21901465/product-250x250.jpeg'),
    Product(
      title: 'Mask',
      description: 'Trouser for Men',
      id: 'p4',
      price: '499.00',
      imageUrl:
          'https://images.bewakoof.com/original/anonymous-mask-vest-men-s-printed-round-neck-vest-232419-1567158564.jpg',
    ),
  ];

  List<Product> get iteams {
    return [..._iteams];
  }

  Product findById(String id) {
    return _iteams.firstWhere((element) => element.id == id);
  }

  void addProduct() {
    notifyListeners();
  }
}
