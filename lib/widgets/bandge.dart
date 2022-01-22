// ignore_for_file: prefer_if_null_operators, use_key_in_widget_constructors, prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Bandge extends StatelessWidget {
  final Color? color;
  final String? value;
  final Widget? child;

  Bandge({this.color, this.value, this.child});
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        child!,
        Padding(
          padding: const EdgeInsets.only(right: 1, bottom: 25, left: 20),
          child: CircleAvatar(
            radius: 10,
            backgroundColor: Theme.of(context).colorScheme.secondary,
            child: Text(
              value!,
              style: TextStyle(fontSize: 10),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
