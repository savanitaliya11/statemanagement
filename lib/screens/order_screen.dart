// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement/provider/order.dart';
import 'package:statemanagement/widgets/app_drawer.dart';
import 'package:statemanagement/widgets/order_iteams.dart';

class OrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final order = Provider.of<Orders>(context);
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text('My Order'),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemBuilder: (context, i) => OrderData(order.orders[i]),
          itemCount: order.orders.length,
        ),
      ),
    );
  }
}
