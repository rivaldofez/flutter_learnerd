import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isOn = false;

  Widget myWidget = Container(
    width: 200,
    height: 100,
    decoration: BoxDecoration(
        color: Colors.red, border: Border.all(color: Colors.black54)),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Animated Switcher"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AnimatedSwitcher(
                child: myWidget,
                duration: Duration(seconds: 1),
                transitionBuilder: (child, animation)=> RotationTransition(
                  turns: animation,
                  child: child,
                )
              ),
              Switch(
                value: isOn,
                inactiveTrackColor: Colors.red[200],
                inactiveThumbColor: Colors.red,
                activeColor: Colors.green,
                onChanged: (value) {
                  isOn = value;
                  setState(() {
                    if (isOn)
                      myWidget = Container(
                        key: ValueKey(1),
                        width: 200,
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            border: Border.all(color: Colors.black54)),
                      );
                    else
                      myWidget = Container(
                        key: ValueKey(2),
                        width: 200,
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            border: Border.all(color: Colors.black54)),
                      );
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
