import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.robotoTextTheme()
      ),
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Color fontColor = Colors.white;

    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        backgroundColor: Colors.black45,
        title: Text("Google Fonts Demo"),
      ),
      body: Center(
        child: Column(
          children: [
            Text("I'll Keep learning Flutter",
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
            Text("Rivaldo Fernandes",
              style: TextStyle(fontSize: 30, color: Colors.white
              ),
            ),
          ],
        ),
      ),
    );
  }
}
