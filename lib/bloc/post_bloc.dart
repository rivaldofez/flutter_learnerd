import 'package:flutter_learnerd/model/post.dart';
import 'package:bloc/bloc.dart';

class PostEvent{}

abstract class PostState{}

class PostUninitialized extends PostState{}

class PostLoaded extends PostState{
  List<Post> posts;
  bool hasReachMax;

  PostLoaded({this.posts, this.hasReachMax});

  PostLoaded copyWith({List<Post> posts, bool hasReachedMax}){
    return PostLoaded(
      posts: posts ?? this.posts,
      hasReachMax: hasReachedMax ?? this.hasReachMax
    );
  }
}

class PostBloc extends Bloc<PostEvent, PostState> {
  @override
  PostState get initialState => PostUninitialized();

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    List<Post> posts;
    if(state is PostUninitialized){
      posts = await Post.connectToAPI(0, 10);
      yield PostLoaded(posts: posts, hasReachMax: false);
    }else{
      PostLoaded postLoaded = state as PostLoaded;
      posts = await Post.connectToAPI(postLoaded.posts.length, 10);
      yield (posts.isEmpty) ? postLoaded.copyWith(hasReachedMax: true) : PostLoaded(posts: postLoaded.posts + posts, hasReachMax: false);
    }
  }

}