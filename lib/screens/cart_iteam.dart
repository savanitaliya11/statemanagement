// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:statemanagement/componant/constant.dart';

class CartData extends StatelessWidget {
  final String? title;
  final double? price;
  final int? quntity;
  final String? id;
  CartData({this.quntity, this.price, this.id, this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      child: ListTile(
        leading: CircleAvatar(
          child: FittedBox(
              child: Text(price!.toString(), style: fittedboxtextStyle)),
        ),
        title: Text(title!, style: cdataTextStyle),
        subtitle: Text(price!.toString(), style: cartamountTextStyle),
        trailing: Text(
          '${quntity!} *',
          style: cdataTextStyle,
        ),
      ),
    );
  }
}
