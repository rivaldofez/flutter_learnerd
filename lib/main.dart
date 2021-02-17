import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Latihan TextField"),
        ),
        body: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextField(
                decoration: InputDecoration(
                  fillColor: Colors.lightBlue[50],
                  filled: true,
                  icon: Icon(Icons.email),
                  suffix: Container(width: 5, height: 5, color: Colors.red,),
                  prefixIcon: Icon(Icons.email),
                  prefixText: "Name :",
                  prefixStyle: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                  labelText: "Nama Lengkap :",
                  labelStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                  hintText: "Nama Lengkapnya lho.",
                  hintStyle: TextStyle(fontSize: 12),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
                ),
                maxLength: 5,
                onChanged: (value){
                  setState(() {

                  });
                },
                controller: controller,
              ),
              Text(controller.text),
            ],
          ),
        ),
      ),
    );
  }
}

