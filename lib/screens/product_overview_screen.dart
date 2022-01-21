// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement/provider/products.dart';
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
      drawer: Drawer(
        child: ListView(
          children: [
            Container(
              width: double.infinity,
              height: 100.0,
              color: Theme.of(context).colorScheme.primary,
            ),
            ListTile(
              leading: IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.black87,
                  size: 30.0,
                ),
                onPressed: () {},
              ),
              title: Text(
                'Shop',
                style: TextStyle(fontSize: 18),
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
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
                    )
                  ])
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
