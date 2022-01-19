// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productTitle = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          productTitle,
          style: TextStyle(fontFamily: 'Lato'),
        ),
      ),
      body: SafeArea(
          child: Text(
        'my Shop',
        style: TextStyle(fontFamily: 'Lato'),
      )),
    );
  }
}
