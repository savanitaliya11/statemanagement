// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement/provider/cart.dart';
import 'package:statemanagement/provider/product.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //if we make listen false then change will be disappeared...
    //this will rebuild only ones not every time...
    final product = Provider.of<Product>(context);
    final cart = Provider.of<Cart>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, 'product_detail_screen',
                arguments: product.id);
          },
          child: CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl: product.imageUrl!,
          ),
        ),

        //Footer
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          title: Text(
            product.price!.toString(),
            textAlign: TextAlign.center,
          ),

          trailing: IconButton(
            onPressed: () {
              cart.addCart(product.id!, product.title!, product.price!);
            },
            icon: Icon(Icons.add_shopping_cart),
            color: Theme.of(context).colorScheme.secondary,
          ),

          //Consumer only rebuild the widget of Icon button.
          //<Product> call the data from provider/product.dart
          leading: Consumer<Product>(
            builder: (ctx, product, Widget? child) => IconButton(
                color: Theme.of(context).colorScheme.secondary,
                onPressed: () {
                  product.toggalFavouriteStatus();
                },
                icon: Icon(product.isFavorite
                    ? Icons.favorite
                    : Icons.favorite_border)),
          ),
        ),

        //Header
        header: GridTileBar(
          backgroundColor: Colors.black54,
          title: Text(product.title!),
          // leading: Text(
          //   product.id!,
          //   style: TextStyle(
          //       color: Colors.deepOrange,
          //       fontWeight: FontWeight.bold,
          //       fontSize: 18),
          // ),
        ),
      ),
    );
  }
}
