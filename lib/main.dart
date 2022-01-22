// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement/provider/cart.dart';
import 'package:statemanagement/provider/products.dart';
import 'package:statemanagement/screens/cart_screen.dart';
import 'package:statemanagement/screens/product_detail_screen.dart';
import 'package:statemanagement/screens/product_overview_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //wrap changeNotifierProvider on MaterialAPP therefore we can notify/use value
    //where we want
    return MultiProvider(
      //Multi provider provides more than one provider value to the material app
      //as material app is child of multi provider.
      providers: [
        ChangeNotifierProvider(
          //give instance or way to provider which will call
          create: (BuildContext context) => Products(),
        ),

        //this will also work same as like create but sometime it might be act as bug or create bug...
        // ChangeNotifierProvider.value(value: Cart()),

        //using create is safe or more efficient as compared to use value....
        ChangeNotifierProvider(create: (context) => Cart())
      ],

      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          initialRoute: 'product_overview_screen',
          routes: {
            'product_overview_screen': (context) => ProductOverViewScreen(),
            'product_detail_screen': (context) => ProductDetailScreen(),
            'cart_screen': (context) => MyCart()
          },
          theme: ThemeData(
              fontFamily: 'Lato',
              colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple)
                  .copyWith(secondary: Colors.deepOrange)),
          home: ProductOverViewScreen()),
    );
  }
}
