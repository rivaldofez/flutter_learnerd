import 'package:flutter/material.dart';

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

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int number = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Semantics(hidden: true, excludeSemantics :true,child: Text("Aplikasi Aksebilitas")),
      ),
      floatingActionButton: FloatingActionButton(
        child: Semantics(onTapHint: "menambahkan bilangan dengan satu",child: Icon(Icons.plus_one)),
        onPressed: () {
          setState(() {
            number++;
          });
        },
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Semantics(
              label:
                  "Ini adalah bilangan yang akan ditambahkan, bilangan saat ini adalah",
              child: Text(
                number.toString(),
                style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
