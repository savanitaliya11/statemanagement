// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement/provider/products.dart';
import 'package:statemanagement/widgets/product_iteam.dart';

class ProductGrid extends StatelessWidget {
  bool showFav;

  ProductGrid({required this.showFav});
  @override
  Widget build(BuildContext context) {
    //call provider here to get data in this file
    final productsData = Provider.of<Products>(context);
    final products = showFav ? productsData.fav : productsData.iteams;

    return GridView.builder(
      padding: EdgeInsets.all(7),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
      itemBuilder: (context, i) => ChangeNotifierProvider.value(
        value: products[i],
        //create: (c) => products[i],
        child: ProductItem(
            // price: products[i].price,
            // title: products[i].title,
            // id: products[i].id,
            // imageUrl: products[i].imageUrl,
            ),
      ),
      itemCount: products.length,
    );
  }
}
