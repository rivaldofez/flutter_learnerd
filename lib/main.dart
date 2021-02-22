import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learnerd/product_card.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: firstColor,
        ),
        body: ChangeNotifierProvider<ProductState>(
          builder: (context) => ProductState(),
          child: Container(
            margin: EdgeInsets.all(20),
            child: Align(
              alignment: Alignment.topCenter,
              child: Consumer<ProductState>(
                builder: (context, productState, _) => ProductCard(
                  imgURL: "images/pemandangan.jpg",
                  name: "Buah-buahan Mix 1 Kg",
                  price: "Rp25.000",
                  onAddCartTap: () {},
                  quantity: productState.quantity,
                  onIncTap: () {
                    productState.quantity += 1;
                  },
                  onDecTap: () {
                    productState.quantity -=1;
                  },
                  notification: (productState.quantity > 5) ? "Diskon 10%" : null,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ProductState with ChangeNotifier {
  int _quantity = 0;

  int get quantity => _quantity;

  set quantity(int newValue) {
    _quantity = newValue;
    notifyListeners();
  }
}
