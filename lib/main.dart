import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'product_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math';
import 'dart:async';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:
          BlocProvider(builder: (context) => ProductBloc(), child: MainPage()),
    );
  }
}

class MainPage extends StatelessWidget {
  final Random r = Random();

  @override
  Widget build(BuildContext context) {
    ProductBloc bloc = BlocProvider.of<ProductBloc>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[400],
        title: Text("Demo List View"),
      ),
      body: Column(
        children: [
          RaisedButton(
            color: Colors.red[400],
            child: Text("Create Products",style: TextStyle(color: Colors.white),),
            onPressed: () {
              bloc.dispatch(r.nextInt(4) + 2);
            },
          ),
          SizedBox(height: 20),
          BlocBuilder<ProductBloc, List<Product>>(
            builder: (context, products) => Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      (index == 0) ? SizedBox(width: 20,) : Container(),
                      ProductCard(
                        imgURL: products[index].imageURL,
                        name: products[index].name,
                        price: products[index].price.toString(),
                        onDecTap: () {},
                        onIncTap: () {},
                        onAddCartTap: () {},
                      ),
                      SizedBox(width:20 ,)
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Product {
  String imageURL;
  String name;
  int price;

  Product({this.imageURL = "", this.name = "", this.price = 0});
}

class ProductBloc extends Bloc<int, List<Product>> {
  @override
  List<Product> get initialState => [];

  @override
  Stream<List<Product>> mapEventToState(int event) async* {
    List<Product> products = [];

    for (int i = 0; i < event; i++)
      products.add(Product(
          imageURL:
              "https://metro.co.uk/wp-content/uploads/2019/04/ZAC-EFRON-GREATEST-SHOWMAN2-6b5e.jpg",
          name: "Zax Efron",
          price: (i + 1) * 5000));

    yield products;
  }
}
