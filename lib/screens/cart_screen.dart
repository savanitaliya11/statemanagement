// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement/componant/constant.dart';
import 'package:statemanagement/provider/cart.dart';
import 'package:statemanagement/widgets/cart_iteam.dart';

class MyCart extends StatelessWidget {
  const MyCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('My Cart'),
      ),
      body: SafeArea(
          child: Column(
        children: [
          //total
          Card(
            margin: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Spacer(),
                Chip(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  label: Text('\$${cart.totalAmount.toString()}',
                      style: cartamountTextStyle),
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'Order Now',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ))
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),

          //cart iteam list
          Expanded(
            child: ListView.builder(
              itemCount: cart.iteamCount,
              itemBuilder: (BuildContext context, i) => CartData(
                title: cart.iteams.values.toList()[i].title,
                price: cart.iteams.values.toList()[i].price.toString(),
                id: cart.iteams.values.toList()[i].id,
                productId: cart.iteams.keys.toList()[i],
                quntity: cart.iteams.values.toList()[i].quntity,
              ),
            ),
          )
        ],
      )),
    );
  }
}
