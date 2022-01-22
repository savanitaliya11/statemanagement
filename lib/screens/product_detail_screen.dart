// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement/provider/products.dart';

class ProductDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)?.settings.arguments as String;
    final productData =
        Provider.of<Products>(context, listen: false).findById(productId);

    // .iteams
    // .firstWhere((element) => element.id == productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          productData.title!,
          style: TextStyle(fontFamily: 'Lato'),
        ),
      ),
      body: Container(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 300,
                child: CachedNetworkImage(
                  imageUrl: productData.imageUrl!,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                productData.title!,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 2, left: 10, right: 10),
                child: Text(
                  productData.description!,
                  softWrap:
                      true, //if des is too long then it will automatically take new line
                  style: TextStyle(color: Colors.black87, fontSize: 18),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                productData.price!.toString(),
                style: TextStyle(color: Colors.black87, fontSize: 15),
              )
            ],
          ),
        ),
      ),
    );
  }
}
