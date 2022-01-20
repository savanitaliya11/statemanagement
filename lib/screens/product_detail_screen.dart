// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement/provider/products.dart';

class ProductDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)?.settings.arguments as String;
    final productData = Provider.of<Products>(context).findById(productId);
    print('==============>>>>>>>>>>>>.{$productData}');
    // .iteams
    // .firstWhere((element) => element.id == productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          productData.title!,
          style: TextStyle(fontFamily: 'Lato'),
        ),
      ),
      body: SafeArea(
          child: Text(
        productData.description!,
        style: TextStyle(fontFamily: 'Lato'),
      )),
    );
  }
}
