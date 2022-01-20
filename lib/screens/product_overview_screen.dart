// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:statemanagement/widgets/product_grid.dart';

class ProductOverViewScreen extends StatefulWidget {
  @override
  _ProductOverViewScreenState createState() => _ProductOverViewScreenState();
}

class _ProductOverViewScreenState extends State<ProductOverViewScreen> {
  @override
  Widget build(BuildContext context) {
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
        title: Text(
          'My Shop',
          style: TextStyle(fontFamily: 'Lato'),
        ),
        centerTitle: true,
      ),
      body: SafeArea(child: ProductGrid()),
    );
  }
}
