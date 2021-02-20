import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learnerd/post_result_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  PostResult postResult = null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Api Demo")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text((postResult != null)
                  ? postResult.id +
                      " | " +
                      postResult.name +
                      " | " +
                      postResult.job +
                      " | " +
                      postResult.created
                  : "Tidak ada data"),
              RaisedButton(
                onPressed: () {
                  PostResult.connectToAPI("Badu", "Dokter").then((value) {
                    postResult = value;
                    setState(() {

                    });
                  });
                },
                child: Text('Post'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
