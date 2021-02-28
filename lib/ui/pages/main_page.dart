import 'package:flutter/material.dart';
import 'package:flutter_learnerd/widget/movie_box.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> urls = [
      "https://i.mydramalist.com/RQLeY_4f.jpg",
      "https://i.pinimg.com/564x/a3/00/39/a30039890aeb7a1a246143e1bdc53255.jpg",
      "https://dgeiu3fz282x5.cloudfront.net/g/x/x-3637.jpg",
      "https://images-na.ssl-images-amazon.com/images/I/7145Wo9GjlL._AC_SL1006_.jpg",
      "https://images-na.ssl-images-amazon.com/images/I/81K5OyA6+dL.jpg"
    ];
    PageController controller =
        PageController(initialPage: 0, viewportFraction: 0.6);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Widget Slider"),
      ),
      body: PageView.builder(
          controller: controller,
          itemCount: urls.length,
          itemBuilder: (context, index) => Center(
                child: MovieBox(urls[index]),
              )),
    );
  }
}
