import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isBlack = true;
  bool isStop = true;
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Timer Demo"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                counter.toString(),
                style: TextStyle(
                    color: (isBlack) ? Colors.black : Colors.red,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              RaisedButton(
                child: Text("Ubah warna 5 detik kemudian"),
                onPressed: () {
                  Timer(Duration(seconds: 5), (){
                    setState(() {
                      isBlack = !isBlack;
                    });
                  });

                },
              ),
              SizedBox(
                height: 10,
              ),
              RaisedButton(
                child: Text("Ubah warna secara langsung"),
                onPressed: () {
                  Timer.run(() {
                    setState(() {
                      isBlack = !isBlack;
                    });
                  });
                },
              ),
              SizedBox(
                height: 10,
              ),
              RaisedButton(
                child: Text("Start Timer"),
                onPressed: () {
                  isStop = false;
                  counter = 0;
                  Timer.periodic(Duration(seconds: 1), (timer) {
                    if(isStop){
                      timer.cancel();
                    }
                    setState(() {
                      counter++;
                    });
                  });
                },
              ),
              RaisedButton(
                child: Text("Stop Timer"),
                onPressed: () {
                  isStop = true;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
