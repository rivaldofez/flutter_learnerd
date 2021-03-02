import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

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

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shimmer Demo"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  width: 200,
                  height: 300,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://menhairstylesworld.com/wp-content/uploads/2019/05/03.-zac-efron-haircut-crop.jpg"),
                          fit: BoxFit.cover)),
                ),
                Shimmer(
                  gradient: LinearGradient(
                      begin: Alignment(-1, 0.5),
                      end: Alignment(1, -0.25),
                      stops: [
                        0.45,
                        0.5,
                        0.55
                      ],
                      colors: [
                        Colors.white.withOpacity(0),
                        Colors.white.withOpacity(0.5),
                        Colors.white.withOpacity(0)
                      ]),
                  child: Container(width: 200, height: 300, color: Colors.red),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Shimmer(
              direction: ShimmerDirection.rtl,
              loop: 2,
              period: Duration(seconds: 5),
              gradient: LinearGradient(
                  begin: Alignment(-1, 0.5),
                  end: Alignment(1, -0.25),
                  stops: [
                    0.45,
                    0.5,
                    0.55
                  ],
                  colors: [
                    Colors.black,
                    Colors.white,
                    Colors.black
                  ]),
              child: Text(
                "Rivaldo Fernandes",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
