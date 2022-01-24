// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Scaffold(
        body: Column(
          children: [
            AppBar(
              title: Text('Hello Friend!!!'),
              automaticallyImplyLeading: false,
            ),
            ListTile(
              title: Text('Shop'),
              leading: Icon(Icons.shopping_cart),
              onTap: () {
                Navigator.pushReplacementNamed(
                    context, 'product_overview_screen');
              },
            ),
            Divider(),
            ListTile(
              title: Text('Order'),
              leading: Icon(Icons.payment),
              onTap: () {
                Navigator.pushReplacementNamed(context, 'order_screen');
              },
            ),
          ],
        ),
      ),
    );
  }
}
