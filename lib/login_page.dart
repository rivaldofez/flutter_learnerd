import 'package:flutter/material.dart';
import 'package:flutter_learnerd/auth_services.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () async {
            await AuthServices.signInAnonymous();
          },
          child: Text("Sign In Anonymous"),
        ),
      ),
    );
  }
}


