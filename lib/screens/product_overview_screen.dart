// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:statemanagement/models/product.dart';
import 'package:statemanagement/widgets/product_iteam.dart';

class ProductOverViewScreen extends StatefulWidget {
  const ProductOverViewScreen({Key? key}) : super(key: key);

  @override
  _ProductOverViewScreenState createState() => _ProductOverViewScreenState();
}

class _ProductOverViewScreenState extends State<ProductOverViewScreen> {
  List<Product> loadedProduct = [
    Product(
      title: 'Trouser Men',
      description: 'Trouser for Men',
      id: '1',
      price: '499.00',
      imageUrl:
          'https://5.imimg.com/data5/YX/OO/TA/ANDROID-108727015/product-jpeg-500x500.jpg',
    ),
    Product(
      title: 'Trouser Men',
      description: 'Trouser for Men',
      id: '1',
      price: '499.00',
      imageUrl:
          'https://tiimg.tistatic.com/fp/1/006/253/full-sleeves-pink-color-girls-t-shirts-551.jpg',
    ),
    Product(
        title: 'Trouser',
        description: 'Trouser for Men',
        id: '1',
        price: '499.00',
        imageUrl:
            'https://4.imimg.com/data4/KA/WM/ANDROID-21901465/product-250x250.jpeg'),
    Product(
      title: 'Mask',
      description: 'Trouser for Men',
      id: '1',
      price: '499.00',
      imageUrl:
          'https://images.bewakoof.com/original/anonymous-mask-vest-men-s-printed-round-neck-vest-232419-1567158564.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            Container(
              width: double.infinity,
              height: 100.0,
              color: Colors.blueAccent,
            ),
            ListTile(
              leading: IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.black,
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
        title: Text('My Shop'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: GridView.builder(
        padding: EdgeInsets.all(7),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemBuilder: (context, index) => ProductItem(
          title: loadedProduct[index].title,
          id: loadedProduct[index].id,
          imageUrl: loadedProduct[index].imageUrl,
        ),
        itemCount: loadedProduct.length,
      )),
    );
  }
}
