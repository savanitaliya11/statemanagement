// ignore_for_file: prefer_const_constructors, avoid_print, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement/provider/cart.dart';
import 'package:statemanagement/provider/products.dart';
import 'package:statemanagement/widgets/app_drawer.dart';
import 'package:statemanagement/widgets/bandge.dart';
import 'package:statemanagement/widgets/product_grid.dart';

enum filterOptions { all, favouriteOnly }

class ProductOverViewScreen extends StatefulWidget {
  @override
  _ProductOverViewScreenState createState() => _ProductOverViewScreenState();
}

class _ProductOverViewScreenState extends State<ProductOverViewScreen> {
  bool _showFavourite = false;

  @override
  Widget build(BuildContext context) {
    final productContainer = Provider.of<Products>(context, listen: false);
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        //PopupMenuButton
        actions: [
          PopupMenuButton(
            onSelected: (filterOptions selectedvalue) {
              setState(() {
                if (selectedvalue == filterOptions.favouriteOnly) {
                  _showFavourite = true;
                } else {
                  _showFavourite = false;
                }
              });
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Only Favourite'),
                value: filterOptions.favouriteOnly,
              ),
              PopupMenuItem(
                child: Text('Show all'),
                value: filterOptions.all,
              ),
            ],
          ),

          //show selected iteam number cart....
          Consumer<Cart>(
            builder: (context, cart, Widget? ch) => Bandge(
              child: ch,
              value: cart.iteamCount.toString(),
            ),
            child: IconButton(
              icon: Icon(
                Icons.shopping_cart,
              ),
              onPressed: () {
                Navigator.pushNamed(context, 'cart_screen');
              },
            ),
          )
        ],

        title: Text(
          'My Shop',
          style: TextStyle(fontFamily: 'Lato'),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: ProductGrid(
        showFav: _showFavourite,
      )),
    );
  }
}
