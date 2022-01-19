// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  String? id;
  String? title;
  String? imageUrl;
  ProductItem({this.id, this.title, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Image.network(
        imageUrl!,
        fit: BoxFit.cover,
      ),
      footer: GridTileBar(
        backgroundColor: Colors.black54,
        title: Text(
          title!,
          textAlign: TextAlign.center,
        ),
        trailing:
            IconButton(onPressed: () {}, icon: Icon(Icons.add_shopping_cart)),
        leading: IconButton(
            onPressed: () {}, icon: Icon(Icons.favorite_border_rounded)),
      ),
    );
  }
}
