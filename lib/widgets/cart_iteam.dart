// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement/componant/constant.dart';
import 'package:statemanagement/provider/cart.dart';

class CartData extends StatelessWidget {
  final String? title;
  final String? price;
  final int? quntity;
  final String? id;
  final String? productId;
  CartData({this.quntity, this.price, this.id, this.title, this.productId});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      direction: DismissDirection.endToStart,
      key: ValueKey(id),
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).iteamRemove(productId!);
      },
      background: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(left: 50),
        child: Icon(
          Icons.delete,
          size: 40,
        ),
        color: Theme.of(context).errorColor,
      ),
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: ListTile(
          leading: CircleAvatar(
            child:
                FittedBox(child: Text('\$${price}', style: fittedboxtextStyle)),
          ),
          title: Text(title!, style: cdataTextStyle),
          subtitle: Text('Total: ${price}', style: cartamountTextStyle),
          trailing: Text(
            '${quntity!} x',
            style: cdataTextStyle,
          ),
        ),
      ),
    );
  }
}
