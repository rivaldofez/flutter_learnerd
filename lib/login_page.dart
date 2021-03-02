import 'package:flutter/material.dart';
import 'package:flutter_learnerd/auth_services.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController(text: "");
    TextEditingController passwordController = TextEditingController(text: "");

    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              width: 300,
              height: 100,
              child: TextField(
                controller: emailController,
              ),
            ),
            Container(
              width: 300,
              height: 100,
              child: TextField(
                controller: passwordController,
              ),
            ),
            RaisedButton(
              onPressed: () async {
                await AuthServices.signInAnonymous();
              },
              child: Text("Sign In Anonymous"),
            ),
            RaisedButton(
              onPressed: () async {
                await AuthServices.signIn(emailController.text, passwordController.text);
              },
              child: Text("Sign In"),
            ),
            RaisedButton(
              onPressed: () async {
                await AuthServices.signUp(emailController.text, passwordController.text);
              },
              child: Text("Sign Up"),
            ),
          ],
        ),
      ),
    );
  }
}
