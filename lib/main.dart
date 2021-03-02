import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learnerd/auth_services.dart';
import 'package:flutter_learnerd/database_services.dart';
import 'package:flutter_learnerd/wrapper.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return StreamProvider.value(
    //   value: AuthServices.firebaseUserStream,
    //   child: MaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     home: Wrapper(),
    //   ),
    // );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Firestore Demo"),
        ),
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  child: Text("Add Data"),
                  onPressed: () {
                    DatabaseServices.createOrUpdateProduct("1",
                        name: "Masker", price: 1000000);
                  },
                ),
                RaisedButton(
                  child: Text("Edit Data"),
                  onPressed: () {
                    DatabaseServices.createOrUpdateProduct("1",
                        name: "Masker", price: 2000000);
                  },
                ),
                RaisedButton(
                  child: Text("Get Data"),
                  onPressed: () async {
                    DocumentSnapshot snapshot = await DatabaseServices.getProduct("1");
                    print(snapshot.data["nama"]);
                    print(snapshot.data["harga"]);
                  },
                ),
                RaisedButton(
                  child: Text("Delete Data"),
                  onPressed: () async {
                    await DatabaseServices.deleteProduct("1");
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
