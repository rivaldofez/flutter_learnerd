import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter Tipografi"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Contoh 01 (Tanpa Apapun)", style: TextStyle(fontSize: 20),),
              Text(
                "Contoh 02 (SmallCap)",
                style: TextStyle(
                    fontSize: 20, fontFeatures: [FontFeature.enable('smcp')]),
              ),
              Text(
                "Contoh 1/2 (SmallCap & Frac) 100000",
                style: TextStyle(
                    fontSize: 20, fontFeatures: [FontFeature.enable('dtls')]),
              ),
              Text(
                "Contoh 1/2 (SmallCap & Frac) 100000",
                style: TextStyle(
                    fontSize: 20, fontFeatures: [FontFeature.oldstyleFigures()]),
              )
            ],
          ),
        ),
      ),
    );
  }
}

