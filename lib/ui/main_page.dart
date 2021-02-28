import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learnerd/bloc/post_bloc.dart';
import 'post_item.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  ScrollController controller = ScrollController();
  PostBloc bloc;

  void onScroll(){
    double maxScroll = controller.position.maxScrollExtent;
    double currentScroll = controller.position.pixels;

    if(currentScroll == maxScroll)
      bloc.add(PostEvent());
  }

  @override
  Widget build(BuildContext context) {
    bloc = BlocProvider.of<PostBloc>(context);
    controller.addListener(onScroll);
    return Scaffold(
      appBar: AppBar(
        title: Text("Infinite List With Bloc"),
      ),
      body: Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          child: BlocBuilder<PostBloc, PostState>(
            builder: (context, state) {
              if (state is PostUninitialized)
                return Center(
                  child: SizedBox(
                    width: 30,
                    height: 30,
                    child: CircularProgressIndicator(),
                  ),
                );
              else {
                PostLoaded postLoaded = state as PostLoaded;
                return ListView.builder(
                  controller: controller,
                  itemCount: (postLoaded.hasReachMax)
                      ? postLoaded.posts.length
                      : postLoaded.posts.length + 1,
                  itemBuilder: (context, index) =>
                      (index < postLoaded.posts.length)
                          ? PostItem(postLoaded.posts[index])
                          : Center(
                              child: Container(
                                width: 30,
                                height: 30,
                                child: SizedBox(
                                  width: 30,
                                  height: 30,
                                  child: CircularProgressIndicator(),
                                ),
                              ),
                            ),
                );
              }
            },
          )),
    );
  }
}
