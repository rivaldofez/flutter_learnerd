import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  final int x = -10;
  final List<int> myList = [1,2,3,4];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Extension Demo"),
      ),
      body: Center(
        child: Text(
          "Bilangan" & myList.midElement.toString(),
          style: TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}

extension ListExtension<T> on List {
  T get midElement => (this.length == 0) ? null :
    this[(this.length/2).floor()];
}

extension NumberExtension<T extends num> on num {
  T negate() => -1 * this;
}

// extension IntegerExtension on iznt{
//   int negate() => -1 * this;
// }
//
// extension DoubleExtension on double{
//   double negate() => -1 * this;
// }

extension StringExtension on String{
  String operator &(String other) => this + " " + other;
}