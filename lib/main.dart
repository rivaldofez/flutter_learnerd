import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<bool> isSelected = [true, false, false];
  ColorFilter colorFilter = ColorFilter.mode(Colors.blue, BlendMode.screen);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ColorFiltered(
        colorFilter: colorFilter,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Widgets Demo GDG 2019 China"),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SelectableText(
                  "Ini adalah selectable text, silahkan pilih saya",
                  style: TextStyle(fontSize: 20),
                  showCursor: true,
                  cursorWidth: 3,
                  cursorColor: Colors.red,
                ),
                SizedBox(height: 10),
                ToggleButtons(
                  isSelected: isSelected,
                  onPressed: (index) {
                    for (int i = 0; i < isSelected.length; i++) {
                      isSelected[i] = (i == index) ? true : false;
                    }
                    setState(() {
                      if(index == 0)
                        colorFilter = ColorFilter.mode(Colors.blue, BlendMode.screen);
                          else if(index == 1)
                            colorFilter = ColorFilter.mode(Colors.green, BlendMode.softLight);
                          else
                            colorFilter = ColorFilter.mode(Colors.purple, BlendMode.multiply);
                    });
                  },
                  fillColor: Colors.red[50],
                  selectedColor: Colors.red,
                  selectedBorderColor: Colors.black,
                  splashColor: Colors.blue,
                  highlightColor: Colors.yellow,
                  borderRadius: BorderRadius.circular(10),
                  children: [
                    Icon(Icons.alarm),
                    Icon(Icons.adb),
                    Icon(Icons.card_travel)
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
