// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  String? id;
  String? title;
  String? imageUrl;
  String? price;
  ProductItem({this.id, this.title, this.imageUrl, this.price});

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: CachedNetworkImage(
        fit: BoxFit.cover,
        imageUrl: imageUrl!,
      ),
      footer: GridTileBar(
        backgroundColor: Colors.black54,
        title: Text(
          price!,
          textAlign: TextAlign.center,
        ),
        trailing:
            IconButton(onPressed: () {}, icon: Icon(Icons.add_shopping_cart)),
        leading: IconButton(
            onPressed: () {}, icon: Icon(Icons.favorite_border_rounded)),
      ),
      header: GridTileBar(
        backgroundColor: Colors.black12,
        title: Text(title!),
        leading: Text(
          id!,
          style: TextStyle(
              color: Colors.deepOrange,
              fontWeight: FontWeight.bold,
              fontSize: 18),
        ),
      ),
    );
  }
}
